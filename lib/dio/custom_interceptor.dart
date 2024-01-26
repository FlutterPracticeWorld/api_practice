import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 요청 보낼 때
    if (!options.headers.containsKey("Authorization")) {
      options.headers.addAll({
        "Authorization" : "Bearer eyw1231238901284908193248902sdfidaohjdoifa"
      });
    }
    print(options.uri);
    print(options.data);
    print(options.headers);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 인증 오류, 500에러
    print(err);
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 응답 왔을 때
    print(response);
    super.onResponse(response, handler);
  }
}