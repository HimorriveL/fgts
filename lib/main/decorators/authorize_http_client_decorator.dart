import '../../data/cache/all.dart';
import '../../data/http/all.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final FetchSecureCacheStorage fetchSecureCacheStorage;
  final IDeleteSecureCacheStorage deleteSecureCacheStorage;
  final HttpClient decoratee;

  AuthorizeHttpClientDecorator({
    required this.fetchSecureCacheStorage,
    required this.deleteSecureCacheStorage,
    required this.decoratee,
  });

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    dynamic body,
    Map? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final token = await fetchSecureCacheStorage.secureFetch('token');
      final authorizedHeaders = headers ?? {}
        ..addAll({'Authorization': 'Bearer ${token!}'});
      return await decoratee.request(
          url: url,
          method: method,
          body: body,
          headers: authorizedHeaders,
          query: query);
    } catch (error) {
      if (error is HttpError && error != HttpError.forbidden) {
        rethrow;
      } else {
        //await deleteSecureCacheStorage.delete('token');
        throw HttpError.forbidden;
      }
    }
  }
}
