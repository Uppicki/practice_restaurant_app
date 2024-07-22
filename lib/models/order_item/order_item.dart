import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/product/product.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';


@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required Product product,
    required int count,
    required Decimal totalCost
}) = _OrderItem;


  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}
