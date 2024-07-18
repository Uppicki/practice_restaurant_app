


import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_chain.g.dart';
part 'restaurant_chain.freezed.dart';


@freezed
class RestaurantChain with _$RestaurantChain {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RestaurantChain({
    required int id,
    required String imageUrl,
    required String name,
    required bool hasUniqueRestaurants
  }) = _RestaurantChain;

  factory RestaurantChain.fromJson(Map<String, dynamic> json) => _$RestaurantChainFromJson(json);
}
