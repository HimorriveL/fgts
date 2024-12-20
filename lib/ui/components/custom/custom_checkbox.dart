// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../helpers/all.dart';

class ParamsCheckBox {
  Stream<bool> stream;
  Function(bool?)? onChanged;
  String? textActive;
  String? textDisabled;
  bool? defaultValue;
  ParamsCheckBox({
    required this.stream,
    this.onChanged,
    this.textActive,
    this.textDisabled,
    this.defaultValue,
  });
}

class CustomCheckBox extends StatelessWidget {
  ParamsCheckBox params;

  CustomCheckBox(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor),
        child: StreamBuilder<bool>(
          stream: params.stream,
          initialData: params.defaultValue ?? true,
          builder: (context, snapshot) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor),
              child: CheckboxListTile(
                title: Text(
                  snapshot.data == true
                      ? (params.textActive ?? R.string.active)
                      : (params.textDisabled ?? R.string.disabled),
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColorLight),
                ),
                value: snapshot.data,
                onChanged: (newValue) {
                  params.onChanged!(newValue!);
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            );
          },
        ),
      ),
    );
  }
}
