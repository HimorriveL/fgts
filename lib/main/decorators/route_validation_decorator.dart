import 'package:flutter/material.dart';

import '../../data/cache/all.dart';
import '../../domain/usecases/all.dart';
import '../factories/all.dart';

class AuthorizeIslogged implements IsLoggedDecorator {
  final FetchCacheStorage fetchCacheStorage;
  final Widget decoratee;
  AuthorizeIslogged({
    required this.fetchCacheStorage,
    required this.decoratee,
  });

  @override
  Widget isLogged() {
    try {
      final token = fetchCacheStorage.fetch('token');
      if (token != null) {
        return decoratee;
      }
      return makeLoginPage();
    } catch (error) {
      return makeLoginPage();
    }
  }
}
