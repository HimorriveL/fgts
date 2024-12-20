import 'package:get/get.dart';

import '../../domain/entities/all.dart';

mixin LoginListManager on GetxController {
  final _loginList = Rx<List<ComboboxEntity>>([]);
  Stream<List<ComboboxEntity>> get loginListStream => _loginList.stream;
  set loginList(List<ComboboxEntity> value) => _loginList.value = value;
  List<ComboboxEntity> get loginList => _loginList.value;
}
