import 'package:dio/dio.dart';

class HttpManager {
  static final Dio dio = Dio();
  static Future<Response> request(
    String url, {
    String method = "get",
    Map<String, dynamic> queryParameters = const {},
    int timeOut = 3000,
  }) {
    // 1.创建配置
    final options = Options(method: method, receiveTimeout: timeOut);
    // 2.发送网络请求
    return dio.request(url, queryParameters: queryParameters, options: options);
  }
}

Future<Response> get(
  url, {
  Map<String, dynamic> queryParameters = const {},
  int timeOut = 3000,
}) {
  return HttpManager.request(
    url,
    queryParameters: queryParameters,
    method: "get",
    timeOut: timeOut,
  );
}
