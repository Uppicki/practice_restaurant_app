


import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_request.g.dart';
part 'refresh_token_request.freezed.dart';

@freezed
class RefreshRequest with _$RefreshRequest {
  const factory RefreshRequest({
    required String refresh
  }) = _RefreshRequest;

  factory RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);
}