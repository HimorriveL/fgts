// ignore_for_file: must_be_immutable

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../../../domain/helpers/all.dart';
import '../../helpers/all.dart';
import '../all.dart';

class ParamsTextField {
  Stream<UIError?>? stream;
  UIError? streamInitialData = UIError.requiredField;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  String textLabel;
  Function(String)? onChanged;
  int? maxLength;
  IconData? icon;
  bool? isAutoFocus = false;
  bool? isObscureText = false;
  bool? isOnlyNumber = false;
  bool? isOnlyLetter = false;
  bool? isUpperCase = false;
  bool? isLowerCase = false;
  bool? isCpf = false;
  bool? isCnpj = false;
  bool? isCtps = false;
  bool? isCellphone = false;
  bool? isTelephone = false;
  bool? isMoney = false;
  bool? isDate = false;
  bool? isStock = false;
  FocusNode? focusNode;
  Color? backgroundColor;
  Color? borderColor;
  Color? colorText;

  ParamsTextField({
    required this.stream,
    this.streamInitialData,
    this.controller,
    this.inputFormatters,
    required this.textLabel,
    this.onChanged,
    this.maxLength,
    this.icon,
    this.isAutoFocus,
    this.isObscureText,
    this.focusNode,
    this.isOnlyNumber,
    this.isOnlyLetter,
    this.isUpperCase,
    this.isLowerCase,
    this.isCpf,
    this.isCnpj,
    this.isCtps,
    this.isCellphone,
    this.isTelephone,
    this.isMoney,
    this.isDate,
    this.isStock,
    this.backgroundColor,
    this.borderColor,
    this.colorText,
  });
}

class CustomTextField extends StatelessWidget {
  ParamsTextField params;

  CustomTextField(this.params, {super.key});

  _buildUI(Color colorBorder) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextField(
        focusNode: params.focusNode,
        obscureText: params.isObscureText ?? false,
        autofocus: params.isAutoFocus ?? false,
        controller: params.controller,
        inputFormatters: makeInputFormatters(params),
        onChanged: params.onChanged,
        style: TextStyle(
          color: params.colorText,
        ),
        decoration: decoration(ParamValues(
          colorText: params.colorText,
          backgroundColor: params.backgroundColor,
          icon: params.icon,
          colorBorder: params.borderColor ?? colorBorder,
          textLabel: params.textLabel,
        )),
      ),
    );
  }

  List<TextInputFormatter> makeInputFormatters(ParamsTextField params) {
    List<TextInputFormatter> inputFormatters = [];

    if (params.maxLength != null) {
      inputFormatters.add(LengthLimitingTextInputFormatter(params.maxLength!));
    }
    if (params.isOnlyNumber != null && params.isOnlyNumber == true) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9]')));
    }
    if (params.isOnlyLetter != null && params.isOnlyLetter == true) {
      inputFormatters.add(
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
      );
    }
    if (params.isUpperCase != null && params.isUpperCase == true) {
      inputFormatters.add(UpperCaseTextFormatter());
    }

    if (params.isLowerCase != null && params.isLowerCase == true) {
      inputFormatters.add(LowerCaseTextFormatter());
    }

    if (params.isCpf != null && params.isCpf == true) {
      inputFormatters
          .add(FilteringTextInputFormatter.allow(RegExp(r'[0-9\/\.\-]')));
      inputFormatters.add(
        MaskedTextInputFormatter(mask: 'xxx.xxx.xxx-xx', separator: '.-'),
      );
    }

    if (params.isCnpj != null && params.isCnpj == true) {
      inputFormatters
          .add(FilteringTextInputFormatter.allow(RegExp(r'[0-9\/\.\-]')));
      inputFormatters.add(
        MaskedTextInputFormatter(mask: 'xx.xxx.xxx/xxxx-xx', separator: './-'),
      );
    }

    if (params.isCtps != null && params.isCtps == true) {
      inputFormatters
          .add(FilteringTextInputFormatter.allow(RegExp(r'[0-9/\-]')));
      inputFormatters.add(
        MaskedTextInputFormatter(mask: 'xxxxxxx/xxxx', separator: '/'),
      );
    }
    if (params.isTelephone != null && params.isTelephone == true) {
      inputFormatters.add(PhoneMaskFormatter(isPhone: true));
    }
    if (params.isCellphone != null && params.isCellphone == true) {
      inputFormatters.add(PhoneMaskFormatter());
    }

    if (params.isMoney != null && params.isMoney == true) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9]')));
      inputFormatters.add(MaskedMoneyInputFormatter());
    }
    if (params.isStock != null && params.isStock == true) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9]')));
      inputFormatters.add(MaskedStockInputFormatter());
    }

    if (params.isDate != null && params.isDate == true) {
      inputFormatters
          .add(FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')));
      inputFormatters
          .add(MaskedTextInputFormatter(mask: 'xx/xx/xxxx', separator: '/'));
    }

    if (params.inputFormatters != null) {
      inputFormatters.addAll(params.inputFormatters!);
    }

    return inputFormatters;
  }

  @override
  Widget build(BuildContext context) {
    if (params.stream == null) {
      return _buildUI(Colors.black);
    } else {
      return StreamBuilder<UIError?>(
        stream: params.stream,
        initialData: params.streamInitialData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildUI(Colors.black);
          } else {
            return _buildUI(Colors.black);
          }
        },
      );
    }
  }
}
