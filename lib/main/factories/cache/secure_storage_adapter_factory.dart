import '../../../infra/cache/all.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

SecureStorageAdapter makeSecureStorageAdapter() =>
    SecureStorageAdapter(secureStorage: const FlutterSecureStorage());
