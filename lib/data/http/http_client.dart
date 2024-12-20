abstract class HttpClient {
  Future<dynamic> request({
    required String url,
    required String method,
    dynamic body,
    Map? headers,
    Map<String, dynamic>? query,
  });
}
