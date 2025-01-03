import '../../../domain/entities/all.dart';
import '../../../domain/helpers/all.dart';
import '../../../domain/usecases/all.dart';
import '../../http/all.dart';
import '../../models/all.dart';

class FindAllDocuments implements IFindAllDocuments {
  final CustomHttpClient httpClient;
  final String url;

  FindAllDocuments({required this.httpClient, required this.url});
  @override
  Future<DocumentFullEntity> execute(DocumentParams params) async {
    try {
      final body = RemoteDocumentParams.fromDomain(params).toJson();

      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);

      print(httpResponse);

      /*await Future.delayed(const Duration(milliseconds: 100));
      Map httpResponse = {
        "result": [
          {
            "code": "FGTS_DATA_INTEGRATION_ERROR",
            "message": "Não foi possível realizar o cálculo da operação.",
            "details": {
              "registrationNumber": "22486220070",
              "personId": null,
              "reason": "Trabalhador informado não possui contas de FGTS.",
              "code": 8,
              "codeDisplay": "TrabalhadorSemContasFGTS"
            },
            "correlationId": "#16dd49f1-0976-4803-bb6d-c181f454e260"
          },
          {
            "id": "16c4f6e9-e23c-48d6-a8f8-421de99fae1a",
            "calculateByValueType": "Gross",
            "requestedAmount": 0,
            "initialValue": 1228334,
            "liquidValue": 1197100,
            "monthlyInterest": 0.0179999999,
            "yearlyInterest": 0.23872053011534677,
            "startDate": "2024-12-20T12:00:00-03:00",
            "dueDate": "2034-02-01T00:00:00-03:00",
            "comm": 0,
            "efectiveCommissions": [],
            "commTc": 0,
            "commNonTc": 0,
            "agentCommissions": [
              {
                "name": "CORBAN",
                "amount": 0,
                "amountDisplay": "0%",
                "type": "Percentage",
                "baseValue": "InitialValue",
                "chargeCommissionFrom": "NewCustomers"
              }
            ],
            "finTax": 31235,
            "effectiveMonthlyCost": 0.019398083784049946,
            "effectiveYearlyCost": 0.25929000000000024,
            "registrationNumber": "01642756490",
            "termInMonths": 10,
            "numberOfPayments": 0,
            "paymentFixedCosts": 0,
            "paymentScheduleItems": [
              {
                "dueDate": "2024-12-20T12:00:00-03:00",
                "principalAmountInCents": 1228335,
                "amortization": 0,
                "interest": 0,
                "financeTax": 0,
                "payment": 0,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2025-02-01T00:00:00-03:00",
                "principalAmountInCents": 842164,
                "amortization": 386171,
                "interest": 10002,
                "financeTax": 2829,
                "payment": 396173,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2026-02-01T00:00:00-03:00",
                "principalAmountInCents": 557579,
                "amortization": 284585,
                "interest": 78144,
                "financeTax": 9599,
                "payment": 362729,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2027-02-01T00:00:00-03:00",
                "principalAmountInCents": 355702,
                "amortization": 201877,
                "interest": 117807,
                "financeTax": 6809,
                "payment": 319684,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2028-02-01T00:00:00-03:00",
                "principalAmountInCents": 217587,
                "amortization": 138115,
                "interest": 133616,
                "financeTax": 4659,
                "payment": 271731,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2029-02-01T00:00:00-03:00",
                "principalAmountInCents": 127789,
                "amortization": 89798,
                "interest": 129831,
                "financeTax": 3029,
                "payment": 219629,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2030-02-01T00:00:00-03:00",
                "principalAmountInCents": 69967,
                "amortization": 57822,
                "interest": 117881,
                "financeTax": 1950,
                "payment": 175703,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2031-02-01T00:00:00-03:00",
                "principalAmountInCents": 35971,
                "amortization": 33996,
                "interest": 94348,
                "financeTax": 1147,
                "payment": 128344,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2032-02-01T00:00:00-03:00",
                "principalAmountInCents": 16817,
                "amortization": 19154,
                "interest": 70687,
                "financeTax": 646,
                "payment": 89841,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2033-02-01T00:00:00-03:00",
                "principalAmountInCents": 6032,
                "amortization": 10785,
                "interest": 52104,
                "financeTax": 364,
                "payment": 62889,
                "addedFixedCosts": 0
              },
              {
                "dueDate": "2034-02-01T00:00:00-03:00",
                "principalAmountInCents": 0,
                "amortization": 6032,
                "interest": 37664,
                "financeTax": 203,
                "payment": 43696,
                "addedFixedCosts": 0
              }
            ]
          }
        ],
        "csvFile": "consultas-2024-12-20T19-57-51-282Z.csv"
      };*/

      httpResponse["result"]
          .asMap()
          .map((i, element) =>
              MapEntry(i, (element["cpfDocument"] = params.cpfList[i])))
          .values
          .toList();

      final entity = DocumentFullEntity(
          csvFile: httpResponse["csvFile"],
          documentList: List<DocumentEntity>.from(httpResponse["result"]
              .map((json) => DocumentModel.fromJson(json).toEntity())));

      return entity;
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteDocumentParams {
  final List<String> cpfList;
  final int timeout;
  final int delay;
  final int rateLimitPoints;
  final int rateLimitDuration;
  final String productId;

  RemoteDocumentParams({
    required this.cpfList,
    required this.timeout,
    required this.delay,
    required this.rateLimitPoints,
    required this.rateLimitDuration,
    required this.productId,
  });

  factory RemoteDocumentParams.fromDomain(DocumentParams params) =>
      RemoteDocumentParams(
        cpfList: params.cpfList,
        timeout: params.timeout,
        delay: params.delay,
        rateLimitPoints: params.rateLimitPoints,
        rateLimitDuration: params.rateLimitDuration,
        productId: params.productId,
      );

  Map toJson() => {
        'cpfList': cpfList,
        'timeout': timeout,
        'delay': delay,
        'rateLimitPoints': rateLimitPoints,
        'rateLimitDuration': rateLimitDuration,
        'productId': productId,
      };
}
