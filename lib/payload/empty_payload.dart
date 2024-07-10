


import 'package:freezed_annotation/freezed_annotation.dart';

part 'empty_payload.g.dart';
part 'empty_payload.freezed.dart';


@freezed
class EmptyPayload with _$EmptyPayload {
  const factory EmptyPayload() = _EmptyPayload;

  factory EmptyPayload.fromJson(Map<String, dynamic> json) =>
      _$EmptyPayloadFromJson(json);
}
