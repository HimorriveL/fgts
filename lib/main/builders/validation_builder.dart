import '../../validation/protocols/all.dart';
import '../../validation/validators/all.dart';

class ValidationBuilder {
  static ValidationBuilder? _instance;
  String fieldName;
  List<FieldValidation> validations = [];

  ValidationBuilder._(this.fieldName);

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance!;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder cpfCnpj() {
    validations.add(DocumentValidation(fieldName));
    return this;
  }

  ValidationBuilder min(int size) {
    validations.add(MinLengthValidation(field: fieldName, size: size));
    return this;
  }

  ValidationBuilder numberNotZero() {
    validations.add(NumberNotZeroValidation(field: fieldName));
    return this;
  }

  ValidationBuilder sameAs(String fieldToCompare) {
    validations.add(CompareFieldsValidation(
        field: fieldName, fieldToCompare: fieldToCompare));
    return this;
  }

  List<FieldValidation> build() => validations;
}
