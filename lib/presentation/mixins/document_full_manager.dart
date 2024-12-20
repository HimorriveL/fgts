import 'package:get/get.dart';

import '../../domain/entities/all.dart';

mixin DocumentFullManager on GetxController {
  final _documentFull = Rx<DocumentFullEntity?>(null);
  Stream<DocumentFullEntity?> get documentFullStream => _documentFull.stream;
  set documentFull(DocumentFullEntity? value) => _documentFull.value = value;
  DocumentFullEntity? get documentFull => _documentFull.value;
}
