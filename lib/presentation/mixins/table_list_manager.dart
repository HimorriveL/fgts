import 'package:get/get.dart';

import '../../domain/entities/all.dart';

mixin TableListManager on GetxController {
  final _tableList = Rx<List<ComboboxEntity>>([]);
  Stream<List<ComboboxEntity>> get tableListStream => _tableList.stream;
  set tableList(List<ComboboxEntity> value) => _tableList.value = value;
  List<ComboboxEntity> get tableList => _tableList.value;
}
