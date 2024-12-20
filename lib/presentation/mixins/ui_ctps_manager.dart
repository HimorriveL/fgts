import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UICtpsManager on GetxController {
  final _ctpsError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get ctpsErrorStream => _ctpsError.stream;
  set ctpsError(UIError? value) => _ctpsError.value = value;
  UIError? get ctpsError => _ctpsError.value;
}
