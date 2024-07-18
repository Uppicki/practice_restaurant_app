

import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_category.freezed.dart';
part 'restaurant_category.g.dart';

@freezed
class RestaurantCategory with _$RestaurantCategory {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RestaurantCategory({
    required int id,
    required String name,
    required String imageUrl,
  }) = _RestaurantCategory;

  factory RestaurantCategory.fromJson(Map<String, dynamic> json) => _$RestaurantCategoryFromJson(json);
}