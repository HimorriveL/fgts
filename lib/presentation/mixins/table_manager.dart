import 'package:get/get.dart';

import '../../domain/entities/all.dart';

mixin TableManager on GetxController {
  final _table = Rx<ComboboxEntity?>(null);
  Stream<ComboboxEntity?> get tableStream => _table.stream;
  set table(ComboboxEntity? value) => _table.value = value;
  ComboboxEntity? get table => _table.value;
}
