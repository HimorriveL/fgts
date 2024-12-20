import '../../../data/usecases/all.dart';
import '../../../domain/usecases/all.dart';
import '../cache/all.dart';

ILoadAccount makeLocalLoadCurrentAccount() =>
    LoadAccount(fetchSecureCacheStorage: makeSecureStorageAdapter());
