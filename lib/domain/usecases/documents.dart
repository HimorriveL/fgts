import 'package:equatable/equatable.dart';

import '../entities/all.dart';

abstract class IDownloadFile {
  Future<dynamic> execute(String fileName);
}

abstract class IFindAllDocuments {
  Future<DocumentFullEntity> execute(DocumentParams params);
}

class DocumentParams extends Equatable {
  final List<String> cpfList;
  final int timeout;
  final int delay;
  final int rateLimitPoints;
  final int rateLimitDuration;
  final String productId;

  @override
  List get props =>
      [cpfList, timeout, delay, rateLimitPoints, rateLimitDuration, productId];
  const DocumentParams({
    required this.cpfList,
    required this.timeout,
    required this.delay,
    required this.rateLimitPoints,
    required this.rateLimitDuration,
    required this.productId,
  });
}
