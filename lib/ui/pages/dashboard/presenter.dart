import 'package:fgts/ui/helpers/errors/errors.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/all.dart';

abstract class DashboardPresenter implements Listenable {
  Stream<UIError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<List<ComboboxEntity>> get tableListStream;
  Stream<List<ComboboxEntity>> get loginListStream;
  Stream<DocumentFullEntity?> get documentFullStream;
  Stream<DocumentEntity?> get documentStatusStream;
  Stream<dynamic> get showCSVStream;

  Stream<ComboboxEntity?> get tableStream;
  Stream<ComboboxEntity?> get loginStream;

  bool get isFormValid;

  void validateTrackNumbers(String value);
  void validateDelay(String value);
  void validateTimeout(String value);
  Future<void> execute();
  Future<void> load();
  void setTable(ComboboxEntity val);
  void setLogin(ComboboxEntity val);
  void showDocument(DocumentEntity entity);
  Future<void> doDownloadFile();
}
