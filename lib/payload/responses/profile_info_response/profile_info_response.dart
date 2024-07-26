


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/profile/profile.dart';

part 'profile_info_response.g.dart';
part 'profile_info_response.freezed.dart';


@freezed
class ProfileInfoResponse with _$ProfileInfoResponse {
  const factory ProfileInfoResponse({
    required Profile user,
  }) = _ProfileInfoResponse;


  factory ProfileInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoResponseFromJson(json);
}
