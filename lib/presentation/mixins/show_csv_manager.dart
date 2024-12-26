import 'package:get/get.dart';

mixin ShowCsvManager on GetxController {
  final _showCSV = Rx<dynamic>(null);
  Stream<dynamic> get showCSVStream => _showCSV.stream;
  set showCSV(dynamic value) => _showCSV.value = value;
}
