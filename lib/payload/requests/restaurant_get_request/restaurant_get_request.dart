import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_get_request.freezed.dart';
part 'restaurant_get_request.g.dart';



@freezed
class RestaurantGetRequest with _$RestaurantGetRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RestaurantGetRequest({
    int? restaurantId,
    int? restaurantChainId
}) = _RestaurantGetRequest;


  factory RestaurantGetRequest.fromJson(Map<String, dynamic> json) =>
      _$RestaurantGetRequestFromJson(json);
}
