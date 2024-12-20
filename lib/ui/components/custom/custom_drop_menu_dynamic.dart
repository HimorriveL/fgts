// ignore_for_file: must_be_immutable
import 'package:fgts/main/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class ParamsDropMenuDynamic {
  Stream<List<dynamic>> stream;
  Function(dynamic, TextEditingController)? onChanged;
  Function(List<dynamic>) generateListItem;
  bool? selectFirst;

  ParamsDropMenuDynamic({
    required this.stream,
    required this.generateListItem,
    this.onChanged,
    this.selectFirst,
  });
}

class CustomDropMenuDynamic extends StatelessWidget {
  ParamsDropMenuDynamic params;

  CustomDropMenuDynamic(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
        stream: params.stream,
        initialData: const [],
        builder: (context, snapshot) {
          List<DropdownMenuItem<dynamic>> list = [];
          dynamic value;
          if (params.selectFirst == true) {
            value = snapshot.data!.isNotEmpty ? snapshot.data![0] : null;
          }
          if (snapshot.data!.isNotEmpty) {
            list = params.generateListItem(snapshot.data!);
          }

          TextEditingController controller = TextEditingController(text: "");

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: "#CA9D50".hexToColor(),
                  ),
                  child: DropdownButton<dynamic>(
                    value: value,
                    hint: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: TextField(
                            controller: controller,
                            style: TextStyle(
                                fontSize: 22,
                                color: Theme.of(context).primaryColorLight))),
                    isExpanded: true,
                    dropdownColor: "#CA9D50".hexToColor(),
                    iconEnabledColor: Theme.of(context).primaryColorLight,
                    items: list,
                    onChanged: (val) {
                      params.onChanged!(val, controller);
                    },
                  )));
        });
  }
}
