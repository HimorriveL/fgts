import '../../../domain/entities/all.dart';
import '../../../domain/helpers/all.dart';
import '../../../domain/usecases/all.dart';
import '../../cache/all.dart';

class SaveAccount implements ISaveAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;
  final SaveCacheStorage saveCacheStorage;

  SaveAccount(
      {required this.saveSecureCacheStorage, required this.saveCacheStorage});
  @override
  Future<void> execute(AccountEntity account) async {
    try {
      saveCacheStorage.save(key: 'token', value: account.token);
      await saveSecureCacheStorage.secureSave(
          key: 'token', value: account.token);
      await saveSecureCacheStorage.secureSave(key: 'expiresIn', value: account.expiresIn);
   
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
