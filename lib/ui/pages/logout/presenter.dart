import 'package:flutter/material.dart';

abstract class LogoutPresenter implements Listenable {
  Stream<String?> get navigateToStream;
  Stream<bool> get isLoadingStream;
  Future<void> execute();
}
