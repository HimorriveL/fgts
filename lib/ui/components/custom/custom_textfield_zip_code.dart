// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import '../../helpers/all.dart';
import 'all.dart';

class ParamsTextFieldZipCode {
  Stream<UIError?> streamZipCodeErrorStream;
  TextEditingController? controller;
  Function(String)? onChanged;
  Function(bool)? onFocusChange;
  String? text;
  UIError? streamInitialDatal;

  ParamsTextFieldZipCode({
    required this.streamZipCodeErrorStream,
    this.controller,
    this.onChanged,
    this.onFocusChange,
    this.text,
    this.streamInitialDatal,
  });
}

class CustomTextFieldZipCode extends StatelessWidget {
  ParamsTextFieldZipCode params;

  CustomTextFieldZipCode(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: params.onFocusChange,
      child: CustomTextField(ParamsTextField(
        streamInitialData: params.streamInitialDatal,
        stream: params.streamZipCodeErrorStream,
        controller: params.controller,
        maxLength: 8,
        isOnlyNumber: true,
        onChanged: params.onChanged,
        textLabel: params.text ?? R.string.zipCode,
      )),
    );
  }
}
