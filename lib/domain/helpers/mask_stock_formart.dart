import 'package:flutter/services.dart';

import 'all.dart';

class MaskedStockInputFormatter extends TextInputFormatter {
  double? maxValue;

  MaskedStockInputFormatter([this.maxValue]);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    dynamic value =
        CustomFormat.setStockMask(double.parse(newValue.text) / 10000);

    if (maxValue != null) {
      if (double.parse(
              value.toString().replaceAll(".", "").replaceAll(",", ".")) >
          maxValue!) {
        value = CustomFormat.setStockMask((maxValue! * 100));
      }
    }

    return newValue.copyWith(
        text: value,
        selection:
            TextSelection.fromPosition(TextPosition(offset: value.length)));
  }
}
