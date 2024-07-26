

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/payload/requests/create_order_request/order_type/order_type.dart';
import 'package:practice/payload/requests/create_order_request/short_order_item/short_order_item.dart';

part 'create_order_request.freezed.dart';
part 'create_order_request.g.dart';


@freezed
class CreateOrderRequest with _$CreateOrderRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CreateOrderRequest({
    required int restaurantChainId,
    int? restaurantId,
    required List<ShortOrderItem> items,
    required OrderType type,
    String? address,
}) = _CreateOrderRequest;


  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
}
