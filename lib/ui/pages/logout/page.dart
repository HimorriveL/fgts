import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../mixins/all.dart';
import 'all.dart';

class LogoutPage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  final LogoutPresenter presenter;

  const LogoutPage(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListenableProvider(
          create: (_) => presenter,
          child: Builder(
            builder: (context) {
              handleNavigation(presenter.navigateToStream, clear: true);
              handleLoading(context, presenter.isLoadingStream);
              presenter.execute();
              return const Text("");
            },
          ),
        ),
      ),
    );
  }
}
