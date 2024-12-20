import '../../../../domain/entities/all.dart';
import '../../../components/all.dart';
import '../all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropMenuListTable extends StatelessWidget {
  const CustomDropMenuListTable({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);

    return CustomDropMenuDynamicDouble(ParamsDropMenuDynamicDouble(
        streamList: presenter.tableListStream,
        generateListItem: (listEntity) {
          List<DropdownMenuItem<dynamic>> list = [];
          for (var entity in (listEntity as List<ComboboxEntity>)) {
            list.add(CustomDropMenuStatic.addItem<ComboboxEntity>(
                context, entity.display, entity));
          }
          return list;
        },
        stream: presenter.tableStream,
        onChanged: (val) {
          if (val != null) {
            presenter.setTable(val);
          }
        }));
  }
}
