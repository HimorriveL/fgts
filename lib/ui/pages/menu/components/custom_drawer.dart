import 'package:get/get.dart';

import '../../../helpers/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_list_item.dart';
import 'custom_list_menu.dart';
import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<MenuPresenter>(context);
    return AnimatedContainer(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 500),
      width: 300,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: context.theme.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomDrawerHeader(),
            const Divider(
              color: Colors.grey,
            ),
            CustomListMenu(
              icon: Icons.home_outlined,
              title: R.string.dashboard,
              goTo: '/dashboard',
            ),
            CustomListMenu(
                icon: Icons.business_sharp,
                title: R.string.company,
                isShowStream: presenter.isShowCompanyStream,
                show: () => {presenter.showCompany()},
                listSubMenuItem: [
                  CustomListItem(
                    icon: Icons.import_contacts,
                    title: R.string.data,
                    goTo: '/company/data',
                  ),
                  CustomListItem(
                    icon: Icons.person,
                    title: R.string.users,
                    goTo: '/company/users',
                  ),
                  CustomListItem(
                    icon: Icons.category,
                    title: R.string.categories,
                    goTo: '/company/categories',
                  ),
                  CustomListItem(
                    icon: Icons.local_offer,
                    title: R.string.products,
                    goTo: '/company/products',
                  ),
                  CustomListItem(
                    icon: Icons.change_circle,
                    title: R.string.stock,
                    goTo: '/company/stocks',
                  ),
                  CustomListItem(
                    icon: Icons.people,
                    title: R.string.providers,
                    goTo: '/company/providers',
                  ),
                ]),
            CustomListMenu(
                icon: Icons.paid,
                title: R.string.sales,
                isShowStream: presenter.isShowSalesStream,
                show: () => {presenter.showSales()},
                listSubMenuItem: [
                  CustomListItem(
                    icon: Icons.search,
                    title: R.string.consult,
                    goTo: '/sale/find',
                  ),
                ]),
            CustomListMenu(
              icon: Icons.logout,
              title: R.string.logout,
              goTo: '/logout',
            ),
            const Divider(color: Colors.grey),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
