import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/order_item/order_item.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

part 'basket_action.freezed.dart';

@freezed
class BasketAction with _$BasketAction {
  const factory BasketAction.create({
    required RestaurantChain restaurantChain,
    Restaurant? restaurant,
    required Product item,
    required int count,
  }) = CreateBasketAction;

  const factory BasketAction.changeRestaurant({
    Restaurant? restaurant,
  }) = ChangeRestaurantBasketAction;

  const factory BasketAction.add({
    required Product item,
    required int count,
  }) = AddBasketAction;

  const factory BasketAction.remove({
    required Product item,
  }) = RemoveBasketAction;
}
