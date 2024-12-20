import '../../../domain/entities/all.dart';
import '../../../domain/helpers/all.dart';
import '../../../domain/usecases/all.dart';
import '../../http/all.dart';
import '../../models/all.dart';

class RemoteAuthentication implements IAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});
  @override
  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String username;
  final String password;

  RemoteAuthenticationParams({
    required this.username,
    required this.password,
  });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(
          username: params.document, password: params.password);

  Map toJson() => {'username': username, 'password': password};
}
