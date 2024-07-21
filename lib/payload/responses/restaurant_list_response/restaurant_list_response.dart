

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/restaurant/restaurant.dart';

part 'restaurant_list_response.freezed.dart';
part 'restaurant_list_response.g.dart';


@freezed
class RestaurantListResponse with _$RestaurantListResponse {
  const factory RestaurantListResponse({
    required List<Restaurant> items,
}) = _RestaurantListResponse;


  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantListResponseFromJson(json);
}
