

import 'package:dio/dio.dart';
import 'package:practice/api_clients/auth_client/auth_client.dart';
import 'package:practice/api_clients/catalog_client/catalog_client.dart';

initApiClient(){
  ApiClient.client;
}

class ApiClient {
  static ApiClient? _apiClient;

  final Dio _dio;

  final AuthClient authClient;
  final CatalogClient catalogClient;

  ApiClient._(this._dio, {required this.authClient, required this.catalogClient});

  static ApiClient get client {
    if (_apiClient == null) {
      final dio = _initDio();

      _apiClient = ApiClient._(
        dio,
        authClient: AuthClient(dio),
        catalogClient: CatalogClient(dio)
  );
    }

    return _apiClient!;
  }

}

Dio _initDio() {
  const timeout = Duration(seconds: 30);

  final dio = Dio();
  const String baseUrl = "https://restaurant-seven-beryl.vercel.app";

  dio.options
    ..baseUrl = baseUrl
    ..connectTimeout = timeout
    ..receiveTimeout = timeout
    ..sendTimeout = timeout
    ..contentType = Headers.jsonContentType;

  dio.interceptors.add(LogInterceptor(requestBody: true,
      responseBody: true)); // Можно указать true, чтобы видеть и тело ответа

/*
  dio.interceptors.add(AuthInterceptor());

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ),
  );
*/

  return dio;
}