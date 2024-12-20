import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UICityManager on GetxController {
  final _cityError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get cityErrorStream => _cityError.stream;
  set cityError(UIError? value) => _cityError.value = value;
  UIError? get cityError => _cityError.value;
}
