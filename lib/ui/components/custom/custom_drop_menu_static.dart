// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class ParamsDropMenuStatic {
  List<DropdownMenuItem<dynamic>> listItem;
  Stream<dynamic>? stream;
  dynamic initialData;
  Function(dynamic)? onChanged;

  ParamsDropMenuStatic({
    required this.listItem,
    this.stream,
    this.initialData,
    this.onChanged,
  });
}

class CustomDropMenuStatic extends StatelessWidget {
  ParamsDropMenuStatic params;

  CustomDropMenuStatic(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: params.stream,
        initialData: params.initialData,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor),
              child: DropdownButton<dynamic>(
                  isExpanded: true,
                  dropdownColor: Theme.of(context).primaryColor,
                  iconEnabledColor: Theme.of(context).primaryColorLight,
                  hint: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('Novo Cadastro...',
                          style: TextStyle(
                              fontSize: 22,
                              color: Theme.of(context).primaryColorLight))),
                  value: snapshot.data!,
                  items: params.listItem,
                  onChanged: (val) {
                    if (val != null) {
                      params.onChanged!(val);
                    }
                  }),
            ),
          );
        });
  }

  static DropdownMenuItem<T> addItem<T>(
      BuildContext context, String display, dynamic value,
      [double customFontSize = 22]) {
    return DropdownMenuItem<T>(
      value: value,
      child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            display,
            style: TextStyle(
                fontSize: customFontSize,
                color: Theme.of(context).primaryColorLight),
          )),
    );
  }
}
