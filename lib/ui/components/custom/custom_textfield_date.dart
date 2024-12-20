// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import '../../helpers/all.dart';
import './all.dart';

class ParamsTextFieldDate {
  Stream<UIError?> stream;
  TextEditingController? controller;
  Function(String)? onChanged;
  UIError? streamInitialData;
  String text;

  ParamsTextFieldDate({
    required this.stream,
    this.controller,
    required this.onChanged,
    this.streamInitialData,
    required this.text,
  });
}

class CustomTextfieldDate extends StatelessWidget {
  ParamsTextFieldDate params;
  CustomTextfieldDate(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(ParamsTextField(
      streamInitialData: params.streamInitialData,
      stream: params.stream,
      controller: params.controller,
      maxLength: 10,
      onChanged: params.onChanged,
      textLabel: params.text,
      isDate: true,
    ));
  }
}
