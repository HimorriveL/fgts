import 'package:flutter/material.dart';

import 'package:get/get.dart';

mixin BackgroundManager on GetxController {
  final _background = Rx<Color>(Colors.black);
  Stream<Color> get backgroundStream => _background.stream;
  set background(Color value) => _background.value = value;
  Color get background => _background.value;
}
