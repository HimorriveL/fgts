abstract class FetchSecureCacheStorage {
  Future<String?> secureFetch(String key);
}

abstract class FetchCacheStorage {
  String? fetch(String key);
}
