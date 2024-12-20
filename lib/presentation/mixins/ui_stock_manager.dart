import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UIStockManager on GetxController {
  final _stockError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get stockErrorStream => _stockError.stream;
  set stockError(UIError? value) => _stockError.value = value;
  UIError? get stockError => _stockError.value;
}
