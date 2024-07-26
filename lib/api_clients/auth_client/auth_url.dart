

class AuthUrl {
  static const String register = '/api/v1/users/register/';
  static const String sendEmail = '/api/v1/users/send-verification-code/';
  static const String sendCode = '/api/v1/users/verify-email/';

  static const String login = '/api/v1/users/jwt/create/';

  static const String refresh = '/api/v1/users/jwt/refresh/';
  static const String profile = '/api/v1/users/profile/';
}