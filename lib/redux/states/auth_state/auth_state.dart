


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/profile/profile.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial({
    required String email,
    required String password,
    String? error
  }) = UnAuthorized;

  const factory AuthState.emailCodeConfirm({
    required String email,
    String? error
  }) = EmailCodeConfirm;

  const factory AuthState.emailConfirm({
    required String email,
    String? error
  }) = EmailConfirm;

  const factory AuthState.registration({
    required String name,
    required String secondName,
    required String email,
    required String password,
    required String repeatPassword,
    String? error,
  }) = RegistrationState;

  const factory AuthState.authorize({
    required Profile profile,
  }) = Authorized;
}