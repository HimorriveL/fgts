import '../../../domain/entities/all.dart';
import '../../../domain/helpers/all.dart';
import '../../../domain/usecases/all.dart';
import '../../cache/all.dart';

class LoadAccount implements ILoadAccount {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LoadAccount({required this.fetchSecureCacheStorage});
  @override
  Future<AccountEntity> loadAccount() async {
    try {
      final token = await fetchSecureCacheStorage.secureFetch('token');
      final expiresIn = await fetchSecureCacheStorage.secureFetch('expiresIn');
      return AccountEntity(token: token!, expiresIn: expiresIn!);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
