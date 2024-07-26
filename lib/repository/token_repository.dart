





import 'package:practice/repository/token_storage.dart';

class TokenRepository {
  TokenStorage _tokenStorage;

  TokenRepository({required TokenStorage tokenStorage}) :
      _tokenStorage = tokenStorage;

  Future<String> get accessToken async {
    final value = await _tokenStorage.accessToken;
    return value ?? '';
  }
  Future<String> get refreshToken async {
    final value = await _tokenStorage.refreshToken;
    return value ?? '';
  }

  Future<void> updateTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _tokenStorage.updateTokens(
        accessToken: accessToken,
        refreshToken: refreshToken
    );
  }

  Future<void> deleteTokens() async{
    await _tokenStorage.deleteTokens();
  }

}