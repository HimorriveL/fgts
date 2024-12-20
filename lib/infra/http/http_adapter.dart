import '../../data/http/all.dart';

import 'package:http/http.dart';
import 'dart:convert';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    dynamic body,
    Map<String, dynamic>? query,
    Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});

    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    Future<Response>? futureResponse;

    final uriParams = query != null
        ? Uri.parse(url).replace(queryParameters: query)
        : Uri.parse(url);
    try {
      if (method == 'post') {
        futureResponse =
            client.post(uriParams, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'get') {
        futureResponse = client.get(uriParams, headers: defaultHeaders);
      } else if (method == 'put') {
        futureResponse =
            client.put(uriParams, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'patch') {
        futureResponse =
            client.patch(uriParams, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'delete') {
        futureResponse =
            client.delete(uriParams, headers: defaultHeaders, body: jsonBody);
      }

      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
        //TODO
        await Future.delayed(const Duration(seconds: 0));
      }
    } catch (error) {
      print(error);
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.headers["content-type"] == "application/pdf" ||
                response.headers["content-type"] == "text/csv; charset=UTF-8"
            ? response.bodyBytes
            : response.body.isEmpty
                ? null
                : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
