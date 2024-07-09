


import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_action.freezed.dart';

@freezed
class AuthAction with _$AuthAction {
  const factory AuthAction.startRegistration() = StartRegistration;

  const factory AuthAction.authBack() = AuthBack;

  const factory AuthAction.sendEmail({required String email}) = SendEmail;

  const factory AuthAction.confirmEmail({
    required String email,
    required String code,
}) = ConfirmEmail;

  const factory AuthAction.registration({
    required String name,
    required String email,
    required String password,
    required String repeatPassword,
}) = Registration;

  const factory AuthAction.authorization({
    required String email,
    required String password
}) = Authorization;

  const factory AuthAction.logout() = Logout;
}
