import 'package:intl/intl.dart';

class CustomFormat {
  static DateTime formatToDate(String value) {
    return DateFormat("dd/MM/yyyy").parse(value, true);
  }

  static dateFormatToString(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static setMaskCNPJ(String value) {
    return value.replaceFirstMapped(
        RegExp(r'(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'),
        (match) =>
            '${match.group(1)}.${match.group(2)}.${match.group(3)}/${match.group(4)}-${match.group(5)}');
  }

  static setMaskCPF(String value) {
    return value.replaceFirstMapped(
        RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'),
        (match) =>
            '${match.group(1)}.${match.group(2)}.${match.group(3)}-${match.group(4)}');
  }

  static setDocumentMask(String value) {
    if (value.length == 11) {
      return setMaskCPF(value);
    } else {
      return setMaskCNPJ(value);
    }
  }

  static setCtps(String value) {
    return value.replaceFirstMapped(RegExp(r'(\d{7})(\d{4})'),
        (match) => '${match.group(1)}/${match.group(2)}');
  }

  static setOnlyNumber(String value) {
    return value.replaceAll(RegExp(r'[^0-9]'), '');
  }

  static String setMoneyFormatWitoutMask(String value) {
    return value.replaceAll(".", "").replaceAll(",", ".");
  }

  static setMoneyMask(double value) {
    NumberFormat currency = NumberFormat('#,##0.00', 'pt_BR');
    try {
      //var number = int.parse(setOnlyNumber(value.toStringAsFixed(2))) / 100;
      //return currency.format(number);
      return currency.format(value);
    } catch (e) {
      return currency.format(0);
    }
  }

  static String setStockMask(double value) {
    NumberFormat currency = NumberFormat('#,##0.0000', 'pt_BR');
    try {
      var number = int.parse(setOnlyNumber(value.toStringAsFixed(4))) / 10000;
      return (value < 0 ? "-" : "") + currency.format(number);
    } catch (e) {
      return currency.format(0);
    }
  }

  static setPhoneMask(String value) {
    String onlyNumbers = setOnlyNumber(value);

    if (onlyNumbers.length > 10) {
      onlyNumbers = onlyNumbers.replaceAllMapped(
          RegExp(r'^(.{2})(.{0,5})(.{0,4}).*'),
          (Match m) => "(${m[1]}) ${m[2]}-${m[3]}");
    } else if (onlyNumbers.length > 6) {
      onlyNumbers = onlyNumbers.replaceAllMapped(
          RegExp(r'^(.{2})(.{0,4})(.{0,4}).*'),
          (Match m) => "(${m[1]}) ${m[2]}-${m[3]}");
    } else if (onlyNumbers.length > 2) {
      onlyNumbers = onlyNumbers.replaceAllMapped(
          RegExp(r'^(.{2})(.{0,4}).*'), (Match m) => "(${m[1]}) ${m[2]}");
    } else if (onlyNumbers.length > 2) {
      onlyNumbers = onlyNumbers.replaceAllMapped(
          RegExp(r'^(.{0,2}).*'), (Match m) => "(${m[0]})");
    } else if (onlyNumbers.isNotEmpty) {
      onlyNumbers = onlyNumbers.replaceAllMapped(
          RegExp(r'^(.{0,2}).*'), (Match m) => "(${m[0]}");
    } else {
      onlyNumbers = '';
    }
    return onlyNumbers;
  }
}
