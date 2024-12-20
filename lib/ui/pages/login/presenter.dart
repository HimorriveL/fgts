import 'package:flutter/material.dart';

import '../../helpers/errors/all.dart';

abstract class LoginPresenter implements Listenable {
  Stream<UIError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isLoadingStream;

  bool get isFormValid;

  void validateUsername(String document);
  void validatePassword(String password);

  Future<void> auth();
}
