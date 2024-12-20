import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UIValueCostManager on GetxController {
  final _valueCostError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get valueCostErrorStream => _valueCostError.stream;
  set valueCostError(UIError? value) => _valueCostError.value = value;
  UIError? get valueCostError => _valueCostError.value;
}
