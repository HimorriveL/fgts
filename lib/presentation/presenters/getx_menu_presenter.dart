import 'package:get/get.dart';

import '../../ui/pages/all.dart';
import '../mixins/all.dart';

class GetxMenuPresenter extends GetxController
    with ShowCompanyManager, ShowSalesManager, NavigationManager
    implements MenuPresenter {
  GetxMenuPresenter();

  @override
  void showCompany() {
    isShowCompany = !isShowCompany;
  }

  @override
  void showSales() {
    isShowSales = !isShowSales;
  }

  @override
  void goto(String route) {
    navigateTo = route;
  }
}
