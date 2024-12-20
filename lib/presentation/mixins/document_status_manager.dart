import 'package:get/get.dart';

import '../../domain/entities/all.dart';

mixin DocumentStatusManager on GetxController {
  final _documentStatus = Rx<DocumentEntity?>(null);
  Stream<DocumentEntity?> get documentStatusStream => _documentStatus.stream;
  set documentStatus(DocumentEntity? value) => _documentStatus.value = value;
  DocumentEntity? get documentStatus => _documentStatus.value;
}
