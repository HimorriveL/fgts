import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UIZipCodeManager on GetxController {
  final _zipCodeError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get zipCodeErrorStream => _zipCodeError.stream;
  set zipCodeError(UIError? value) => _zipCodeError.value = value;
  UIError? get zipCodeError => _zipCodeError.value;
}
