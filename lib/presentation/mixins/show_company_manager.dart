import 'package:get/get.dart';

mixin ShowCompanyManager on GetxController {
  final _isShowCompany = false.obs;
  Stream<bool> get isShowCompanyStream => _isShowCompany.stream;
  set isShowCompany(bool value) => _isShowCompany.value = value;
  bool get isShowCompany => _isShowCompany.value;
}
