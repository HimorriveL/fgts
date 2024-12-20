import '../entities/all.dart';

List<ComboboxEntity> getStateTypeList() {
  return [
    const ComboboxEntity(display: "AC", value: "AC"),
    const ComboboxEntity(display: "AL", value: "AL"),
    const ComboboxEntity(display: "AP", value: "AP"),
    const ComboboxEntity(display: "AM", value: "AM"),
    const ComboboxEntity(display: "BA", value: "BA"),
    const ComboboxEntity(display: "CE", value: "CE"),
    const ComboboxEntity(display: "DF", value: "DF"),
    const ComboboxEntity(display: "ES", value: "ES"),
    const ComboboxEntity(display: "GO", value: "GO"),
    const ComboboxEntity(display: "MA", value: "MA"),
    const ComboboxEntity(display: "MT", value: "MT"),
    const ComboboxEntity(display: "MS", value: "MS"),
    const ComboboxEntity(display: "MG", value: "MG"),
    const ComboboxEntity(display: "PA", value: "PA"),
    const ComboboxEntity(display: "PB", value: "PB"),
    const ComboboxEntity(display: "PR", value: "PR"),
    const ComboboxEntity(display: "PE", value: "PE"),
    const ComboboxEntity(display: "PI", value: "PI"),
    const ComboboxEntity(display: "RJ", value: "RJ"),
    const ComboboxEntity(display: "RN", value: "RN"),
    const ComboboxEntity(display: "RS", value: "RS"),
    const ComboboxEntity(display: "RO", value: "RO"),
    const ComboboxEntity(display: "RR", value: "RR"),
    const ComboboxEntity(display: "SC", value: "SC"),
    const ComboboxEntity(display: "SP", value: "SP"),
    const ComboboxEntity(display: "SE", value: "SE"),
    const ComboboxEntity(display: "TO", value: "TO"),
  ];
}

ComboboxEntity stateTypeDisplayToValue(String value) {
  try {
    return getStateTypeList().where((c) => c.value == value).toList().first;
  } catch (e) {
    return getStateTypeList().where((c) => c.value == "SP").toList().first;
  }
}
