import 'package:flutter/material.dart';

Widget background(Widget decoratee) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.black,
    ),
    //child: Center(child: SingleChildScrollView(child: decoratee)),
    child: decoratee,
  );
}
