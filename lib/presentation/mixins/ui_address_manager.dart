import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UIAddressManager on GetxController {
  final _addressError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get addressErrorStream => _addressError.stream;
  set addressError(UIError? value) => _addressError.value = value;
  UIError? get addressError => _addressError.value;
}
