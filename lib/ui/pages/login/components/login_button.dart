import '../../../components/all.dart';
import '../../../helpers/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return CustomButton(ParamsButton(
      activePressed: true,
      textLabel: R.string.enter,
      onPressed: presenter.auth,
    ));
  }
}
