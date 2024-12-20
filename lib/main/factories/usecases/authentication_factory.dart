import '../../../data/usecases/all.dart';
import '../../../domain/usecases/all.dart';
import '../http/all.dart';

IAuthentication makeRemoteAuthentication() => RemoteAuthentication(
    httpClient: makeHttpAdapter(), url: makeApiBackendUrl('auth/login'));
