// ignore_for_file: must_be_immutable

import 'package:fgts/main/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class ParamsDropMenuDynamicDouble {
  Stream<List<dynamic>> streamList;
  List<dynamic>? initialData;
  Function(List<dynamic>) generateListItem;
  Stream<dynamic> stream;
  Function(dynamic)? onChanged;

  ParamsDropMenuDynamicDouble({
    required this.streamList,
    required this.generateListItem,
    required this.stream,
    this.onChanged,
    this.initialData,
  });
}

class CustomDropMenuDynamicDouble extends StatelessWidget {
  ParamsDropMenuDynamicDouble params;

  CustomDropMenuDynamicDouble(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
        stream: params.streamList,
        initialData: params.initialData ?? const [],
        builder: (context, snapshot) {
          List<DropdownMenuItem<dynamic>> list = [];

          if (snapshot.data!.isNotEmpty) {
            list = params.generateListItem(snapshot.data!);
          }

          return StreamBuilder<dynamic>(
              stream: params.stream,
              initialData: null,
              builder: (_, snapshotCard) {
                return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: "#CA9D50".hexToColor(),
                      ),
                      child: DropdownButton<dynamic>(
                          isExpanded: true,
                          dropdownColor: "#CA9D50".hexToColor(),
                          iconEnabledColor: Theme.of(context).primaryColorLight,
                          items: list,
                          value: snapshotCard.data,
                          onChanged: (val) {
                            if (val != null) {
                              params.onChanged!(val);
                            }
                          }),
                    ));
              });
        });
  }
}
