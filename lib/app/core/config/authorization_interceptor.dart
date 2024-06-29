import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class AuthorizationInterceptor extends Interceptor {
  Logger logger = Modular.get();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Modular.to.pushReplacementNamed('/tmdb/error');

    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i(
        'Request: ${options.method} | ${options.baseUrl}${options.path} \n QueryParams:  ${options.queryParameters}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('Response: ${response.statusCode} | ${response.data}');

    super.onResponse(response, handler);
  }
}
