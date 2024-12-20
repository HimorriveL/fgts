import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UIDocument2Manager on GetxController {
  final _document2Error = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get document2ErrorStream => _document2Error.stream;
  set document2Error(UIError? value) => _document2Error.value = value;
  UIError? get document2Error => _document2Error.value;
}
