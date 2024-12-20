import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UIStartDateManager on GetxController {
  final _startDateError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get startDateErrorStream => _startDateError.stream;
  set startDateError(UIError? value) => _startDateError.value = value;
  UIError? get startDateError => _startDateError.value;
}
