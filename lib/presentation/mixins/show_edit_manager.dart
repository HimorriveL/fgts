import 'package:get/get.dart';

mixin ShowEditManager on GetxController {
  final _isShowEdit = Rx<bool>(false);
  Stream<bool> get isShowEditStream => _isShowEdit.stream;
  set isShowEdit(bool value) => _isShowEdit.value = value;
  bool get isShowEdit => _isShowEdit.value;
}
