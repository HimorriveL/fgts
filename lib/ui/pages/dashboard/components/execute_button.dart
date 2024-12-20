import 'package:fgts/main/extensions/color_extension.dart';

import '../../../components/all.dart';
import '../../../helpers/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExecuteButton extends StatelessWidget {
  const ExecuteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);

    return CustomButton(ParamsButton(
      backgroundColor: "#CA9D50".hexToColor(),
      activePressed: true,
      textLabel: R.string.execute,
      onPressed: presenter.execute,
    ));
  }
}
