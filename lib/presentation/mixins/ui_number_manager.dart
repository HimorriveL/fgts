import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UINumberManager on GetxController {
  final _numberError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get numberErrorStream => _numberError.stream;
  set numberError(UIError? value) => _numberError.value = value;
  UIError? get numberError => _numberError.value;
}
