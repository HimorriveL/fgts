import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../helpers/all.dart';

Future<Color?> chooseColor(BuildContext context, Color color) async {
  late Color newColor = color;

  void setValue(Color value) {
    newColor = value;
  }

  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(R.string.selectColor),
      content: HueRingPicker(pickerColor: color, onColorChanged: setValue),
      actions: [
        TextButton(
          child: Text(R.string.cancel),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        TextButton(
          child: Text(R.string.select),
          onPressed: () {
            Navigator.pop(context, newColor);
          },
        ),
      ],
    ),
  );
}
