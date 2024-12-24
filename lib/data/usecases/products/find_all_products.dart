import '../../../domain/entities/all.dart';
import '../../../domain/helpers/all.dart';
import '../../../domain/usecases/all.dart';
import '../../http/all.dart';
import '../../models/all.dart';

class FindAllProducts implements IFindAllProducts {
  final CustomHttpClient httpClient;
  final String url;

  FindAllProducts({required this.httpClient, required this.url});
  @override
  Future<List<ComboboxEntity>> execute() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post');
      if (httpResponse.isEmpty) {
        return <ComboboxEntity>[];
      }

      return List<ComboboxEntity>.from(httpResponse
          .map((productJson) => ProductModel.fromJson(productJson).toEntity()));
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}
