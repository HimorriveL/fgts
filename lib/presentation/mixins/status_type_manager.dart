import 'package:get/get.dart';

import '../../domain/entities/all.dart';
import '../../domain/types/all.dart';

mixin StatusTypeManager on GetxController {
  final _statusType = Rx<ComboboxEntity>(getStatusTypeList()[0]);
  Stream<ComboboxEntity> get statusTypeStream => _statusType.stream;
  set statusType(ComboboxEntity value) => _statusType.value = value;
}
