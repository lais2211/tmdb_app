import 'package:dio/dio.dart';

import 'authorization_interceptor.dart';
import 'config_env.dart';

Dio registerDio() {
  final dio = Dio();
  dio.interceptors.add(AuthorizationInterceptor());
  dio.options.baseUrl = ConfigEnv.basePath;
  dio.options.queryParameters = {'api_key': ConfigEnv.apiKey, 'language': 'pt-BR'};

  return dio;
}
