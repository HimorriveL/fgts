import '../../domain/entities/all.dart';
import '../http/all.dart';

class RemoteAccountModel {
  final String accessToken;
  final int expiresIn;

  RemoteAccountModel({required this.accessToken, required this.expiresIn});

  factory RemoteAccountModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['access_token', 'expires_in'])) {
      throw HttpError.invalidData;
    }
    return RemoteAccountModel(
        accessToken: json['access_token'], expiresIn: json['expires_in']);
  }

  AccountEntity toEntity() =>
      AccountEntity(token: accessToken, expiresIn: expiresIn.toString());
}
