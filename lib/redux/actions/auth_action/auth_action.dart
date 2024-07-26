


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/profile/profile.dart';

part 'auth_action.freezed.dart';

@freezed
class AuthAction with _$AuthAction {
  const factory AuthAction.startRegistration() = StartRegistration;

  const factory AuthAction.authBack() = AuthBack;

  const factory AuthAction.sendEmail({required String email}) = SendEmail;

  const factory AuthAction.confirmEmail({
    required String email,
}) = EmailConfirmAction;

  const factory AuthAction.registration() = RegistrationAction;

  const factory AuthAction.authorization({
    required Profile profile,
}) = AuthorizationAction;

  const factory AuthAction.logout() = LogoutAction;

  const factory AuthAction.error({required String error}) = ReturnErrorAction;
}
