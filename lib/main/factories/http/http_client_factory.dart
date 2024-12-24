import '../../../data/http/all.dart';
import '../../../infra/http/all.dart';

import 'package:http/http.dart';

CustomHttpClient makeHttpAdapter() => HttpAdapter(Client());
