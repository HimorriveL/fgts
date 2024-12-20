import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UICellphoneManager on GetxController {
  final _cellphoneError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get cellphoneErrorStream => _cellphoneError.stream;
  set cellphoneError(UIError? value) => _cellphoneError.value = value;
  UIError? get cellphoneError => _cellphoneError.value;
}
