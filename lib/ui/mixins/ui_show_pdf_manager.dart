// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:html' as html;

mixin UIShowCSVManager {
  void handleShowCSV(BuildContext context, Stream<dynamic> stream) {
    stream.listen((file) {
      if (file != null) {
        final blob = html.Blob([file], 'text/csv');
        final url = html.Url.createObjectUrlFromBlob(blob);
        html.window.open(url, "_blank");
        html.Url.revokeObjectUrl(url);
      }
    });
  }
}
