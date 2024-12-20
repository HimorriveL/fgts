import '../../../data/usecases/all.dart';
import '../../../domain/usecases/all.dart';
import '../cache/all.dart';

ISaveAccount makeLocalSaveCurrentAccount() => SaveAccount(
      saveSecureCacheStorage: makeSecureStorageAdapter(),
      saveCacheStorage: makeStorageAdapter(),
    );
