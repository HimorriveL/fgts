import 'package:get/get.dart';

import '../../domain/entities/all.dart';

mixin LoginManager on GetxController {
  final _login = Rx<ComboboxEntity?>(null);
  Stream<ComboboxEntity?> get loginStream => _login.stream;
  set login(ComboboxEntity? value) => _login.value = value;
  ComboboxEntity? get login => _login.value;
}
