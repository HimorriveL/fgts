// ignore_for_file: non_constant_identifier_names

import '../../presentation/protocols/all.dart';
import '../protocols/all.dart';

import 'package:equatable/equatable.dart';

class DocumentValidation extends Equatable implements FieldValidation {
  @override
  final String field;
  @override
  List get props => [field];

  const DocumentValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    var value = input[field]?.replaceAll(RegExp('[^z0-9]'), '');

    if (value?.length == 11 || value?.length == 14) {
      var isValid =
          value.length == 11 ? _isValidCPF(value) : _isValidCNPJ(value);
      return isValid ? null : ValidationError.invalidField;
    }

    return ValidationError.invalidField;
  }
}

List<String> BLACKLIST = [
  "00000000000",
  "00000000000000",
  "11111111111",
  "11111111111111",
  "22222222222",
  "22222222222222",
  "33333333333",
  "33333333333333",
  "44444444444",
  "44444444444444",
  "55555555555",
  "55555555555555",
  "66666666666",
  "66666666666666",
  "77777777777",
  "77777777777777",
  "88888888888",
  "88888888888888",
  "99999999999",
  "99999999999999",
  "12345678909"
];

_verifierDigitCPF(String document) {
  List<int> numbers =
      document.split("").map((number) => int.parse(number, radix: 10)).toList();
  int modulus = numbers.length + 1;
  List<int> multiplied = [];
  for (var i = 0; i < numbers.length; i++) {
    multiplied.add(numbers[i] * (modulus - i));
  }
  int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;
  return (mod < 2 ? 0 : 11 - mod);
}

bool _isValidCPF(String document) {
  String numbers = document.substring(0, 9);
  numbers += _verifierDigitCPF(numbers).toString();
  numbers += _verifierDigitCPF(numbers).toString();
  return numbers.substring(numbers.length - 2) ==
      document.substring(document.length - 2);
}

int _verifierDigitCNPJ(String document) {
  int soma = 0;
  List<int> multiplied = [];
  if (document.length == 13) {
    multiplied.add(6);
  }
  multiplied.addAll([5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]);
  for (var i = 0; i < document.length; i++) {
    soma += int.parse(document[i]) * multiplied[i];
  }
  final div = (soma / 11).floor();
  final rest = soma - (11 * div);
  if (rest == 0 || rest == 1) {
    return 0;
  } else {
    return 11 - rest;
  }
}

bool _isValidCNPJ(String document) {
  String numbers = document.substring(0, 12);
  numbers += _verifierDigitCNPJ(numbers).toString();
  numbers += _verifierDigitCNPJ(numbers).toString();

  return document == numbers;
}
