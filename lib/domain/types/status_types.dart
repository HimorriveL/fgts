import '../../ui/helpers/all.dart';
import '../entities/all.dart';

List<ComboboxEntity> getStatusTypeList() {
  return [
    const ComboboxEntity(display: "", value: null),
    ComboboxEntity(display: R.string.closed, value: "CLOSED"),
    ComboboxEntity(display: R.string.cancelled, value: "CANCELLED"),
  ];
}

ComboboxEntity statusTypeDisplayToValue(String value) {
  try {
    return getStatusTypeList().where((c) => c.value == value).toList().first;
  } catch (e) {
    return getStatusTypeList().where((c) => c.value == "CLOSED").toList().first;
  }
}
