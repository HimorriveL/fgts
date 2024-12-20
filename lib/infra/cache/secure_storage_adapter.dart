import '../../data/cache/all.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAdapter
    implements
        SaveSecureCacheStorage,
        FetchSecureCacheStorage,
        IDeleteSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureStorageAdapter({required this.secureStorage});

  @override
  Future<void> secureSave({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> secureFetch(String key) async {
    return await secureStorage.read(key: key) ?? "";
  }

  @override
  Future<void> secureDelete(String key) async {
    await secureStorage.delete(key: key);
  }
}
