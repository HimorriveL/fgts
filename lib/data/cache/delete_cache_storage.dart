abstract class IDeleteSecureCacheStorage {
  Future<void> secureDelete(String key);
}

abstract class IDeleteCacheStorage {
  Future<void> delete(String key);
}
