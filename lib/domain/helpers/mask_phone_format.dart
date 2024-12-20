import 'package:flutter/services.dart';

import 'all.dart';

class PhoneMaskFormatter extends TextInputFormatter {
  bool? isPhone = false;

  PhoneMaskFormatter({
    this.isPhone,
  });

  String _phoneMask(String phone, bool? isPhone) {
    String onlyNumbers = phone.replaceAll(RegExp(r'[\Dg]'), "");
    onlyNumbers = onlyNumbers.replaceAll(RegExp(r'^0'), "");

    if (isPhone != null && isPhone == true) {
      try {
        onlyNumbers = onlyNumbers.substring(0, 10);
        // ignore: empty_catches
      } catch (e) {}
    }

    return CustomFormat.setPhoneMask(onlyNumbers);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = _phoneMask(newValue.text, isPhone);
    int offset = newValue.selection.base.offset < newValue.text.length
        ? newValue.selection.base.offset
        : newText.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: offset,
      ),
    );
  }
}
