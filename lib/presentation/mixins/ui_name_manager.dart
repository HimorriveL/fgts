import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UINameManager on GetxController {
  final _nameError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get nameErrorStream => _nameError.stream;
  set nameError(UIError? value) => _nameError.value = value;
  UIError? get nameError => _nameError.value;
}
