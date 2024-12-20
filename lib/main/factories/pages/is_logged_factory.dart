import 'package:flutter/material.dart';

import '../../decorators/all.dart';
import '../cache/all.dart';

Widget makeIsLoggedDecorator(Widget widget) {
  return AuthorizeIslogged(
    decoratee: widget,
    fetchCacheStorage: makeStorageAdapter(),
  ).isLogged();
}
