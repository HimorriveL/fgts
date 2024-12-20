import 'package:flutter/material.dart';

import 'package:get/get.dart';

mixin ForegroundManager on GetxController {
  final _foreground = Rx<Color>(Colors.white);
  Stream<Color> get foregroundStream => _foreground.stream;
  set foreground(Color value) => _foreground.value = value;
  Color get foreground => _foreground.value;
}
