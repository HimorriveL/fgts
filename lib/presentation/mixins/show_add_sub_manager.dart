import 'package:get/get.dart';

mixin ShowAddSubManager on GetxController {
  final _isShowAddSub = Rx<bool>(false);
  Stream<bool> get isShowAddSubStream => _isShowAddSub.stream;
  set isShowAddSub(bool value) => _isShowAddSub.value = value;
  bool get isShowAddSub => _isShowAddSub.value;
}
