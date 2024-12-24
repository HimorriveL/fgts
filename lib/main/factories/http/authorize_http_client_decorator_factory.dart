import '../../../data/http/all.dart';
import '../../decorators/all.dart';
import '../cache/all.dart';
import './all.dart';

CustomHttpClient makeAuthorizeHttpClientDecorator() =>
    AuthorizeHttpClientDecorator(
      decoratee: makeHttpAdapter(),
      fetchSecureCacheStorage: makeSecureStorageAdapter(),
      deleteSecureCacheStorage: makeSecureStorageAdapter(),
    );
