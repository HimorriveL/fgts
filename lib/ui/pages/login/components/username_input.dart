import '../../../components/all.dart';
import '../../../helpers/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return CustomTextField(ParamsTextField(
      stream: null,
      streamInitialData: UIError.requiredField,
      onChanged: presenter.validateUsername,
      textLabel: R.string.userName,
      icon: Icons.person,
      isAutoFocus: true,
    ));
  }
}
