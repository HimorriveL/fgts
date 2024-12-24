import '../../../domain/helpers/all.dart';
import '../../../domain/usecases/all.dart';
import '../../http/all.dart';

class DownloadFile implements IDownloadFile {
  final CustomHttpClient httpClient;
  final String url;

  DownloadFile({required this.httpClient, required this.url});
  @override
  Future<dynamic> execute(String fileName) async {
    try {
      final httpResponse =
          await httpClient.request(url: url + fileName, method: 'get');
      return httpResponse;
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}
