



import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';


@freezed
class Profile with _$Profile {

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Profile({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
  }) = _Profile;


  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}