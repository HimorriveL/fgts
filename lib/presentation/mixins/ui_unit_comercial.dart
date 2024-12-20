import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UIUnitComercialManager on GetxController {
  final _unitComercialError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get unitComercialErrorStream => _unitComercialError.stream;
  set unitComercialError(UIError? value) => _unitComercialError.value = value;
  UIError? get unitComercialError => _unitComercialError.value;
}
