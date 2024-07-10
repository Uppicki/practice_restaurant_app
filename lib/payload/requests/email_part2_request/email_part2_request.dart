import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_part2_request.freezed.dart';
part 'email_part2_request.g.dart';


@freezed
class EmailPart2Request with _$EmailPart2Request {
  const factory EmailPart2Request({
    required String email,
    required String code,
  }) = _EmailPart2Request;

  factory EmailPart2Request.fromJson(Map<String, dynamic> json) =>
      _$EmailPart2RequestFromJson(json);
}