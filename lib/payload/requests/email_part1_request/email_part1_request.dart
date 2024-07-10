import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_part1_request.freezed.dart';
part 'email_part1_request.g.dart';


@freezed
class EmailPart1Request with _$EmailPart1Request {
  const factory EmailPart1Request({
    required String email,
  }) = _EmailPart1Request;

  factory EmailPart1Request.fromJson(Map<String, dynamic> json) =>
      _$EmailPart1RequestFromJson(json);
}