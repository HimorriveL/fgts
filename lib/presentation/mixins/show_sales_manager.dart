import 'package:get/get.dart';

mixin ShowSalesManager on GetxController {
  final _isShowSales = false.obs;
  Stream<bool> get isShowSalesStream => _isShowSales.stream;
  set isShowSales(bool value) => _isShowSales.value = value;
  bool get isShowSales => _isShowSales.value;
}
