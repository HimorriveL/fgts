import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UIPasswordManager on GetxController {
  final _passwordError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get passwordErrorStream => _passwordError.stream;
  set passwordError(UIError? value) => _passwordError.value = value;
  UIError? get passwordError => _passwordError.value;
}
