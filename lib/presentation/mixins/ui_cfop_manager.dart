import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UICfopManager on GetxController {
  final _cfopError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get cfopErrorStream => _cfopError.stream;
  set cfopError(UIError? value) => _cfopError.value = value;
  UIError? get cfopError => _cfopError.value;
}
