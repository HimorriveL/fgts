import 'package:equatable/equatable.dart';

class DocumentFullEntity extends Equatable {
  final String csvFile;
  final List<DocumentEntity> documentList;

  @override
  List get props => [csvFile, documentList];

  const DocumentFullEntity({required this.csvFile, required this.documentList});
}

class DocumentEntity extends Equatable {
  final String document;
  final ErrorDocumentEntity? error;
  final DataDocumentEntity? data;

  @override
  List get props => [error, data];

  const DocumentEntity({required this.document, this.error, this.data});
}

class ErrorDocumentEntity extends Equatable {
  final String code;
  final String message;
  final String reason;

  @override
  List get props => [code, message, reason];

  const ErrorDocumentEntity(
      {required this.code, required this.message, required this.reason});
}

class DataDocumentEntity extends Equatable {
  final double value;
  final double debtor;
  final double finTax;
  final double liquidValue;
  final DateTime date;
  final DateTime lastPayment;
  final List<PaymentEntity> listPayment;

  @override
  List get props =>
      [value, debtor, finTax, liquidValue, date, lastPayment, listPayment];

  const DataDocumentEntity(
      {required this.value,
      required this.debtor,
      required this.finTax,
      required this.liquidValue,
      required this.date,
      required this.lastPayment,
      required this.listPayment});
}

class PaymentEntity extends Equatable {
  final double payment;
  final double interest;
  final double amortization;
  final double principalAmountInCents;
  final DateTime dueDate;

  @override
  List get props =>
      [payment, interest, amortization, principalAmountInCents, dueDate];

  const PaymentEntity({
    required this.payment,
    required this.interest,
    required this.amortization,
    required this.principalAmountInCents,
    required this.dueDate,
  });
}
