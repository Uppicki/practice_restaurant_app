







import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/restaurant_category/restaurant_category.dart';
import 'package:decimal/decimal.dart';

part 'product.g.dart';
part 'product.freezed.dart';


@freezed
class Product with _$Product {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Product({
    required int id,
    required String imageUrl,
    required List<RestaurantCategory> categories,
    required String name,
    required String description,
    required Decimal price,
}) = _Product;


  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
