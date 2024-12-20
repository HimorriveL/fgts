import '../../../components/all.dart';
import '../../../helpers/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return CustomTextField(ParamsTextField(
      stream: null,
      streamInitialData: UIError.requiredField,
      onChanged: presenter.validatePassword,
      textLabel: R.string.password,
      icon: Icons.lock,
      isObscureText: true,
    ));
  }
}
