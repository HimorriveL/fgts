import 'package:get/get.dart';

mixin ShowPdfManager on GetxController {
  final _showCSV = Rx<dynamic>(null);
  Stream<dynamic> get showCSVStream => _showCSV.stream;
  set showCSV(dynamic value) => _showCSV.value = value;
}
