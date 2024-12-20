import 'package:get/get.dart';

mixin ActiveManager on GetxController {
  final _isActive = Rx<bool>(true);
  Stream<bool> get isActiveStream => _isActive.stream;
  set isActive(bool value) => _isActive.value = value;
  bool get isActive => _isActive.value;
}
