

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:practice/api_clients/auth_client/auth_client.dart';
import 'package:practice/api_clients/catalog_client/catalog_client.dart';
import 'package:practice/api_clients/order_client/order_client.dart';
import 'package:practice/app/recourse_strings.dart';
import 'package:practice/models/profile/profile.dart';
import 'package:practice/payload/requests/refresh_token_request/refresh_token_request.dart';
import 'package:practice/payload/responses/login_response/login_response.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/repository/token_repository.dart';
import 'package:practice/repository/token_storage.dart';
import 'package:redux/redux.dart';



initApiClient({required Store<AppState> store}){
  final client = ApiClient.client;

  client.store = store;
}

class ApiClient {
  static ApiClient? _apiClient;

  final Dio _dio;

  late final Store<AppState> _store;

  final AuthProvider _authProvider;

  final TokenRepository _tokenRepository;

  final AuthClient authClient;
  final CatalogClient catalogClient;
  final OrderClient orderClient;

  ApiClient._(this._dio, {
    required TokenRepository tokenRepository,
    required this.authClient,
    required this.catalogClient,
    required this.orderClient
  }) : _tokenRepository = tokenRepository,
        _authProvider = AuthProvider(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await _tokenRepository.accessToken;
        if (accessToken != '') {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          try {
            await _refreshToken();
            return;
          } catch (e) {
            await deleteTokens();
          }
        }
        return handler.next(error);
      },
    ));
  }

  AuthProvider get authProvider => _authProvider;

  set store (Store<AppState> store) {
    _store = store;
    _initAuthState();
  }

  static ApiClient get client {
    if (_apiClient == null) {
      final dio = _initDio();

      final storage = FlutterSecureStorage();
      final tokenStorage = TokenStorage(storage: storage);
      final tokenRepository = TokenRepository(tokenStorage: tokenStorage);


      _apiClient = ApiClient._(
        dio,
        tokenRepository: tokenRepository,
        authClient: AuthClient(dio),
        catalogClient: CatalogClient(dio),
        orderClient:  OrderClient(dio)
  );

    }

    return _apiClient!;
  }

  Future<void> _refreshToken() async {
    String refreshToken = await _tokenRepository.refreshToken;

    final tokens = await authClient.refreshToken(
        request: RefreshRequest(
            refresh: refreshToken
        )
    );

    await _updateTokens(tokens.access, refreshToken);
  }

  Future<void> _updateTokens(String access, String refresh) async {
    await _tokenRepository.updateTokens(
        accessToken: access,
        refreshToken: refresh
    );
  }

  Future<Profile> setTokens(LoginResponse tokens) async {
    await _tokenRepository.updateTokens(
        accessToken: tokens.access,
        refreshToken: tokens.refresh
    );

    final response = await authClient.getProfile();
    _authProvider.login();

    return response.user;
  }

  Future<void> deleteTokens() async {
    await _tokenRepository.deleteTokens();

    authProvider.logout();
    _store.dispatch(const AuthAction.logout());
  }



  Future<void> _initAuthState() async {
    final token = await _tokenRepository.accessToken;

    if (token == '') {
      return;
    }

    final response = await authClient.getProfile();

    _authProvider.login();
    _store.dispatch(AuthAction.authorization(profile: response.user));
  }




}

Dio _initDio() {
  const timeout = Duration(seconds: 30);

  final dio = Dio();
  const String baseUrl = RecourseStrings.baseUrl;

  dio.options
    ..baseUrl = baseUrl
    ..connectTimeout = timeout
    ..receiveTimeout = timeout
    ..sendTimeout = timeout
    ..contentType = Headers.jsonContentType
  ..headers['Referer'] = baseUrl;

  dio.interceptors.add(LogInterceptor(requestBody: true,
      responseBody: true));
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

class AuthProvider extends ChangeNotifier{
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}