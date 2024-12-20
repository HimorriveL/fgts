import '../../domain/entities/all.dart';

class PaymentModel {
  final int payment;
  final int interest;
  final int amortization;
  final int principalAmountInCents;
  final DateTime dueDate;

  PaymentModel({
    required this.payment,
    required this.interest,
    required this.amortization,
    required this.principalAmountInCents,
    required this.dueDate,
  });

  factory PaymentModel.fromJson(Map json) {
    return PaymentModel(
      amortization: json["amortization"],
      dueDate: DateTime.parse(json["dueDate"]),
      interest: json["interest"],
      payment: json["payment"],
      principalAmountInCents: json["principalAmountInCents"],
    );
  }

  PaymentEntity toEntity() => PaymentEntity(
        amortization: amortization / 100,
        dueDate: dueDate,
        interest: interest / 100,
        payment: payment / 100,
        principalAmountInCents: principalAmountInCents / 100,
      );
}

class DocumentModel {
  final String? errorCode;
  final String? errorMessage;
  final String? errorReason;
  final String cpfDocument;
  final int? initialValue;
  final int? finTax;
  final int? liquidValue;
  final List<PaymentEntity>? listPayment;

  DocumentModel({
    this.errorCode,
    this.errorMessage,
    this.errorReason,
    this.initialValue,
    this.finTax,
    this.liquidValue,
    this.listPayment,
    required this.cpfDocument,
  });

  factory DocumentModel.fromJson(Map json) {
    if (json['code'] != null) {
      return DocumentModel(
        errorCode: json['code'],
        errorMessage: json['message'],
        errorReason: json['details']?["reason"] ?? "INDISPONIVEL",
        cpfDocument: json['cpfDocument'],
      );
    }

    return DocumentModel(
      cpfDocument: json['cpfDocument'],
      initialValue: json['initialValue'],
      finTax: json['finTax'],
      liquidValue: json['liquidValue'],
      listPayment: List<PaymentEntity>.from(json['paymentScheduleItems']
          .map((json) => PaymentModel.fromJson(json).toEntity())), //TODO,
    );
  }

  DocumentEntity toEntity() => DocumentEntity(
      document: cpfDocument,
      error: errorCode == null
          ? null
          : ErrorDocumentEntity(
              code: errorCode!,
              message: errorMessage!,
              reason: errorReason!,
            ),
      data: errorCode != null
          ? null
          : DataDocumentEntity(
              value: initialValue! / 100,
              debtor: listPayment!.fold(
                  0,
                  (previous, current) =>
                      previous + current.principalAmountInCents),
              finTax: finTax! / 100,
              liquidValue: liquidValue! / 100,
              date: getTime(
                  listPayment!.first.dueDate, listPayment!.last.dueDate),
              lastPayment: listPayment!.last.dueDate,
              listPayment: listPayment!,
            ));

  DateTime getTime(DateTime first, DateTime last) {
    Duration age = first.difference(last);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    return DateTime(years, months, days);
  }
}
