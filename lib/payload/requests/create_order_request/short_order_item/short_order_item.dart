




import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_order_item.g.dart';
part 'short_order_item.freezed.dart';


@freezed
class ShortOrderItem with _$ShortOrderItem {
  const factory ShortOrderItem({
    required int product,
    required int quantity
  }) = _ShortOrderItem;




  factory ShortOrderItem.fromJson(Map<String, dynamic> json) =>
      _$ShortOrderItemFromJson(json);
}
