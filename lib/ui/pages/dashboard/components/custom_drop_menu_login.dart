import '../../../../domain/entities/all.dart';
import '../../../components/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropMenuListLogin extends StatelessWidget {
  const CustomDropMenuListLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);

    return CustomDropMenuDynamic(ParamsDropMenuDynamic(
      stream: presenter.loginListStream,
      onChanged: (val, controller) {
        if (val != null) {
          controller.text = (val as ComboboxEntity).display;
          presenter.setLogin(val);
        }
      },
      generateListItem: (listEntity) {
        List<DropdownMenuItem<dynamic>> list = [];
        for (var entity in (listEntity as List<ComboboxEntity>)) {
          list.add(CustomDropMenuStatic.addItem<ComboboxEntity>(
              context, entity.display, entity));
        }
        return list;
      },
    ));
  }
}
