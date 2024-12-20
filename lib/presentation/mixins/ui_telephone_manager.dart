import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UITelephoneManager on GetxController {
  final _telephoneError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get telephoneErrorStream => _telephoneError.stream;
  set telephoneError(UIError? value) => _telephoneError.value = value;
  UIError? get telephoneError => _telephoneError.value;
}
