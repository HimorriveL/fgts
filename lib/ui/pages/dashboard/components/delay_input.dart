import 'package:fgts/main/extensions/color_extension.dart';

import '../../../components/all.dart';
import '../../../helpers/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DelayInput extends StatelessWidget {
  const DelayInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);

    return CustomTextField(ParamsTextField(
      backgroundColor: "1D1D1D".hexToColor(),
      borderColor: "#CA9D50".hexToColor(),
      colorText: Colors.white,
      stream: null,
      streamInitialData: UIError.requiredField,
      onChanged: presenter.validateDelay,
      textLabel: R.string.delay,
      isOnlyNumber: true,
    ));
  }
}
