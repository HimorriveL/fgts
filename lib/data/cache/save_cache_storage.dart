abstract class SaveSecureCacheStorage {
  Future<void> secureSave({required String key, required String value});
}

abstract class SaveCacheStorage {
  void save({required String key, required String value});
}
