import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/all.dart';
import '../../helpers/all.dart';
import 'all.dart';
import 'components/custom_drawer.dart';

class MenuPage extends StatelessWidget with NavigationManager {
  final MenuPresenter presenter;
  final Widget widget;
  final String? title;

  // ignore: use_key_in_widget_constructors
  const MenuPage(this.presenter, this.widget, [this.title]);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => presenter,
      child: Builder(builder: (context) {
        handleNavigation(presenter.navigateToStream, clear: true);
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            title: title == null
                ? null
                : Text(
                    title!,
                    style: const TextStyle(color: Colors.white),
                  ),
            /* iconTheme: IconThemeData(
              color: context.theme.primaryColorLight,
              size: 40,
            ),*/
            leading: Builder(
              builder: (context) => IconButton(
                tooltip: R.string.openMenu,
                icon: Icon(
                  Icons.menu,
                  color: context.theme.primaryColorLight,
                  size: 40,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            elevation: 0,
            backgroundColor: title == null ? Colors.transparent : Colors.black,
          ),
          drawer: const CustomDrawer(),
          body: Center(
            child: background(widget),
          ),
        );
      }),
    );
  }
}
