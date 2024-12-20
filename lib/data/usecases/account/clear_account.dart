import '../../../domain/helpers/all.dart';
import '../../../domain/usecases/all.dart';
import '../../cache/all.dart';

class DeleteAccount implements IDeleteAccount {
  final IDeleteSecureCacheStorage deleteSecureCacheStorage;
  final IDeleteCacheStorage deleteCacheStorage;

  DeleteAccount({
    required this.deleteSecureCacheStorage,
    required this.deleteCacheStorage,
  });
  @override
  Future<void> execute() async {
    try {
      await deleteSecureCacheStorage.secureDelete('token');
      await deleteSecureCacheStorage.secureDelete('name');
      await deleteSecureCacheStorage.secureDelete('id');

      deleteCacheStorage.delete('token');
      deleteCacheStorage.delete('name');
      deleteCacheStorage.delete('id');
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
