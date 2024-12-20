import '../../../../data/usecases/all.dart';
import '../../../../domain/usecases/all.dart';
import '../../http/all.dart';

IFindAllProducts makeFindProducts() => FindAllProducts(
    httpClient: makeAuthorizeHttpClientDecorator(),
    url: makeApiBackendUrl('fgts/produtos'));
