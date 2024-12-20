import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UICategoryManager on GetxController {
  final _categoryError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get categoryErrorStream => _categoryError.stream;
  set categoryError(UIError? value) => _categoryError.value = value;
  UIError? get categoryError => _categoryError.value;
}
