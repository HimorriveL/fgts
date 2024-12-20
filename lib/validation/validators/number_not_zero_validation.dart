import '../../presentation/protocols/all.dart';
import '../protocols/all.dart';

import 'package:equatable/equatable.dart';

class NumberNotZeroValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const NumberNotZeroValidation({required this.field});

  @override
  ValidationError? validate(Map input) =>
      input[field] != null && double.parse(input[field]) != 0
          ? null
          : ValidationError.requiredField;
}
