// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ParamsButton {
  Stream<bool>? stream;
  String? textLabel;
  Function()? onPressed;
  bool? activePressed = false;
  Icon? icon;
  Color? backgroundColor;
  Color? foregroundColor;

  ParamsButton({
    this.stream,
    this.textLabel,
    required this.onPressed,
    this.activePressed,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });
}

class CustomButton extends StatelessWidget {
  ParamsButton params;

  CustomButton(this.params, {super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: params.stream,
      initialData: false,
      builder: (context, snapshot) {
        Function()? onPressed;
        if (params.activePressed != null && params.activePressed == true) {
          onPressed = params.onPressed;
        } else {
          onPressed = snapshot.data == true ? params.onPressed : null;
        }

        Widget display = params.icon ??
            (params.textLabel != null
                ? Text(params.textLabel!)
                : const Text(""));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: params.foregroundColor,
                  backgroundColor: params.backgroundColor ?? Colors.black,
                ),
                child: display),
          ),
        );
      },
    );
  }
}
