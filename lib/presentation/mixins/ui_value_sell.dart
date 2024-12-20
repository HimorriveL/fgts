import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UIValueSellManager on GetxController {
  final _valueSellError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get valueSellErrorStream => _valueSellError.stream;
  set valueSellError(UIError? value) => _valueSellError.value = value;
  UIError? get valueSellError => _valueSellError.value;
}
