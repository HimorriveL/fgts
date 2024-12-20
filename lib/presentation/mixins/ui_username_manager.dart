import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UIUsernameManager on GetxController {
  final _usernameError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get usernameErrorStream => _usernameError.stream;
  set usernameError(UIError? value) => _usernameError.value = value;
  UIError? get usernameError => _usernameError.value;
}
