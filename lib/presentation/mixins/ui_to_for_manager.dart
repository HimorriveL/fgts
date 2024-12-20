import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UIToForManager on GetxController {
  final _toForError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get toForErrorStream => _toForError.stream;
  set toForError(UIError? value) => _toForError.value = value;
  UIError? get toForError => _toForError.value;
}
