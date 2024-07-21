
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/restaurant_category/restaurant_category.dart';


part 'category_list_response.g.dart';
part 'category_list_response.freezed.dart';

@freezed
class CategoryListResponse with _$CategoryListResponse {
  const factory CategoryListResponse({
    required List<RestaurantCategory> items
}) = _CategoryListResponse;


  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
}
