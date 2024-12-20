import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

InputDecoration decoration(ParamValues params) {
  return InputDecoration(
    filled: params.backgroundColor != null,
    fillColor: params.backgroundColor,
    labelStyle: TextStyle(color: params.colorText ?? params.colorBorder),
    labelText: params.textLabel,
    suffixIcon: Icon(params.icon, color: params.colorBorder),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: params.colorBorder, width: 3.0),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: params.colorBorder, width: 3.0),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
  );
}

class ParamValues extends Equatable {
  final IconData? icon;
  final Color colorBorder;
  final String textLabel;
  final Color? backgroundColor;
  final Color? colorText;

  @override
  List get props => [
        icon,
        colorBorder,
        textLabel,
      ];

  const ParamValues({
    this.icon,
    required this.colorBorder,
    required this.textLabel,
    this.backgroundColor,
    this.colorText,
  });
}
