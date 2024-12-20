import 'package:flutter/material.dart';

abstract class MenuPresenter implements Listenable {
  Stream<bool> get isShowCompanyStream;
  Stream<bool> get isShowSalesStream;
  Stream<String?> get navigateToStream;

  void showCompany();
  void showSales();
  void goto(String route);
}
