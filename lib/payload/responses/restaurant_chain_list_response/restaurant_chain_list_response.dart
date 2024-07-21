


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

part 'restaurant_chain_list_response.g.dart';
part 'restaurant_chain_list_response.freezed.dart';



@freezed
class RestaurantChainListResponse with _$RestaurantChainListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RestaurantChainListResponse({
    required List<RestaurantChain> items,
}) = _RestaurantChainListResponse;

  factory RestaurantChainListResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantChainListResponseFromJson(json);
}
