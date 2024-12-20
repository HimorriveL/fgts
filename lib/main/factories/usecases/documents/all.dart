import '../../../../data/usecases/all.dart';
import '../../../../domain/usecases/all.dart';
import '../../http/all.dart';

IFindAllDocuments makeFindDocuments() => FindAllDocuments(
    httpClient: makeAuthorizeHttpClientDecorator(),
    url: makeApiBackendUrl('fgts/consultar-cpf'));

IDownloadFile makeDownloadFile() => DownloadFile(
    httpClient: makeAuthorizeHttpClientDecorator(),
    url: makeApiBackendUrl('fgts/download-csv/'));
