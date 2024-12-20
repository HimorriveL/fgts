import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UINcmManager on GetxController {
  final _ncmError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get ncmErrorStream => _ncmError.stream;
  set ncmError(UIError? value) => _ncmError.value = value;
  UIError? get ncmError => _ncmError.value;
}
