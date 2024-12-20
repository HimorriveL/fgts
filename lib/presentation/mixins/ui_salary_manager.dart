import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UISalaryManager on GetxController {
  final _salaryError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get salaryErrorStream => _salaryError.stream;
  set salaryError(UIError? value) => _salaryError.value = value;
  UIError? get salaryError => _salaryError.value;
}
