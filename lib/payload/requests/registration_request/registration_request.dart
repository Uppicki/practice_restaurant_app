import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_request.freezed.dart';
part 'registration_request.g.dart';



@freezed
class RegistrationRequest with _$RegistrationRequest {
  const factory RegistrationRequest({
    required String email,
    required String password,
    String? firs_name,
    String? last_name,
  }) = _RegistrationRequest;

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);
}