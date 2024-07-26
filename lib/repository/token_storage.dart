import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _storage;

  TokenStorage({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<String?> get accessToken async =>
      await _storage.read(key: TokenStorageKeys.access.key);

  Future<String?> get refreshToken async =>
      await _storage.read(key: TokenStorageKeys.refresh.key);


  Future<void> updateTokens({
    required String accessToken,
    required String refreshToken,
}) async {
    await _storage.write(
        key: TokenStorageKeys.access.key,
      value: accessToken
    );
    await _storage.write(
        key: TokenStorageKeys.refresh.key,
        value: refreshToken
    );
  }

  Future<void> deleteTokens() async{
    await _storage.delete(key: TokenStorageKeys.access.key);
    await _storage.delete(key: TokenStorageKeys.refresh.key);
  }
}


enum TokenStorageKeys {
  access('access_token'),
  refresh('refresh_token');

  final String key;


  const TokenStorageKeys(this.key);
}
