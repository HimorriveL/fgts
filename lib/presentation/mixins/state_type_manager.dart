import 'package:get/get.dart';

import '../../domain/entities/all.dart';
import '../../domain/types/all.dart';

mixin StateTypeManager on GetxController {
  final _stateType = Rx<ComboboxEntity>(getStateTypeList()[0]);
  Stream<ComboboxEntity> get stateTypeStream => _stateType.stream;
  set stateType(ComboboxEntity value) => _stateType.value = value;
}
