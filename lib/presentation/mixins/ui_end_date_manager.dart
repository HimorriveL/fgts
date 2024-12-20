import 'package:get/get.dart';

import '../../ui/helpers/all.dart';

mixin UIEndDateManager on GetxController {
  final _endDateError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get endDateErrorStream => _endDateError.stream;
  set endDateError(UIError? value) => _endDateError.value = value;
  UIError? get endDateError => _endDateError.value;
}
