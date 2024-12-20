import 'package:fgts/main/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/background.dart';
import '../../helpers/all.dart';
import '../../mixins/all.dart';
import '../all.dart';
import 'components/all.dart';

class LoginPage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  final LoginPresenter presenter;

  LoginPage(this.presenter, {super.key});

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
              handleMainError(context, presenter.mainErrorStream);
              return background(
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            width: 325,
                            height: 450,
                            constraints: const BoxConstraints(
                              minWidth: 325,
                              minHeight: 450,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  "A16E18".hexToColor(),
                                  "D8A54E".hexToColor(),
                                ],
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 36),
                                const Image(
                                  image: AssetImage('images/logo.png'),
                                  height: 75,
                                  width: 75,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Consulta FGTS",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  R.string.detailsData,
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: UsernameInput(),
                                ),
                                const SizedBox(height: 16),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: PasswordInput(),
                                ),
                                const SizedBox(height: 24),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: LoginButton(),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
