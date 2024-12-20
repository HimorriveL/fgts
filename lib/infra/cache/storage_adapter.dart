import 'package:get_storage/get_storage.dart';

import '../../data/cache/all.dart';

class StorageAdapter
    implements SaveCacheStorage, IDeleteCacheStorage, FetchCacheStorage {
  final GetStorage storage;

  StorageAdapter({required this.storage});

  @override
  Future<void> save({required String key, required String value}) async {
    await storage.write(key, value);
  }

  @override
  String? fetch(String key) {
    return storage.read(key);
  }

  @override
  Future<void> delete(String key) async {
    await storage.remove(key);
  }
}
