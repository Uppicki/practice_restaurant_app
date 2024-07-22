



import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/order_item/order_item.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

part 'basket_state.freezed.dart';


@freezed
class BasketState with _$BasketState {
  const factory BasketState.initial() = EmptyBasketState;


  const factory BasketState.filled({
    required RestaurantChain restaurantChain,
    Restaurant? restaurant,
    required List<OrderItem> items,
    required Decimal totalCost
  }) = FilledBasketState;

}
