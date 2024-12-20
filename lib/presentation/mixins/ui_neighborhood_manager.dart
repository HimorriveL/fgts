import '../../ui/helpers/all.dart';

import 'package:get/get.dart';

mixin UINeighborhoodManager on GetxController {
  final _neighborhoodError = Rx<UIError?>(UIError.requiredField);
  Stream<UIError?> get neighborhoodErrorStream => _neighborhoodError.stream;
  set neighborhoodError(UIError? value) => _neighborhoodError.value = value;
  UIError? get neighborhoodError => _neighborhoodError.value;
}
