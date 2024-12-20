import 'package:flutter/services.dart';

import 'all.dart';

class MaskedMoneyInputFormatter extends TextInputFormatter {
  double? maxValue;

  MaskedMoneyInputFormatter([this.maxValue]);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    dynamic value =
        CustomFormat.setMoneyMask(double.parse(newValue.text) / 100);

    if (maxValue != null) {
      if (double.parse(
              value.toString().replaceAll(".", "").replaceAll(",", ".")) >
          maxValue!) {
        value = CustomFormat.setMoneyMask((maxValue! * 100));
      }
    }

    return newValue.copyWith(
        text: value,
        selection:
            TextSelection.fromPosition(TextPosition(offset: value.length)));
  }
}
