import '../../presentation/protocols/all.dart';

abstract class FieldValidation {
  String get field;
  ValidationError? validate(Map input);
}
