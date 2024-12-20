import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../main/factories/all.dart';
import '../../main/factories/pages/dashboard/all.dart';
import 'app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      title: 'Manager',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      navigatorObservers: [routeObserver],
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeLoginPage, transition: Transition.fadeIn),
        GetPage(
          name: '/dashboard',
          page: makeDashboardPage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/logout',
          page: makeLogoutPage,
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
