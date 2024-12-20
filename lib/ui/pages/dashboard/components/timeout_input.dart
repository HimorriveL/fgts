import 'package:fgts/main/extensions/color_extension.dart';

import '../../../components/all.dart';
import '../../../helpers/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeoutInput extends StatelessWidget {
  const TimeoutInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);

    return CustomTextField(ParamsTextField(
      backgroundColor: "1D1D1D".hexToColor(),
      borderColor: "#CA9D50".hexToColor(),
      colorText: Colors.white,
      stream: null,
      streamInitialData: UIError.requiredField,
      onChanged: presenter.validateTimeout,
      textLabel: R.string.timeout,
      isOnlyNumber: true,
    ));
  }
}
