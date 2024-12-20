import '../../../data/usecases/account/clear_account.dart';
import '../../../domain/usecases/all.dart';
import '../cache/all.dart';

IDeleteAccount makeDeleteAccount() => DeleteAccount(
      deleteSecureCacheStorage: makeSecureStorageAdapter(),
      deleteCacheStorage: makeStorageAdapter(),
    );
