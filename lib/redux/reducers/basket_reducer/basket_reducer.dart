

import 'package:decimal/decimal.dart';
import 'package:practice/models/order_item/order_item.dart';
import 'package:practice/redux/actions/basket_action/basket_action.dart';
import 'package:practice/redux/states/basket_state/basket_state.dart';
import 'package:redux/redux.dart';

final basketReducer = combineReducers<BasketState>([
  TypedReducer<BasketState, CreateBasketAction>(_createBasketReducer),
  TypedReducer<BasketState, ChangeRestaurantBasketAction>(_changeRestaurantBasketReducer),
  TypedReducer<BasketState, AddBasketAction>(_addBasketReducer),
  TypedReducer<BasketState, RemoveBasketAction>(_removeBasketReducer)
]);


BasketState _createBasketReducer(BasketState state, CreateBasketAction action) {
  List<OrderItem> list = [OrderItem(
    product: action.item,
    count: action.count,
    totalCost: action.item.price * Decimal.fromInt(action.count)
  )];

  Decimal sum = list
      .map((item) => item.totalCost)
      .reduce((res, el) => res +el);

  return BasketState.filled(
      restaurantChain: action.restaurantChain,
      restaurant: action.restaurant,
      items: list,
      totalCost: sum
  );
}

BasketState _changeRestaurantBasketReducer(BasketState state, ChangeRestaurantBasketAction action) {
  return state.map(
      initial: (_) => const BasketState.initial(),
      filled: (state) => state.copyWith(restaurant: action.restaurant)
  );
}

BasketState _addBasketReducer(BasketState state, AddBasketAction action) {
  return state.map(
      initial: (_) => const BasketState.initial(),
      filled: (state) {
        final list = state.items.where((item) => item.product.id != action.item.id).toList();

        if (action.count != 0)
          list.add(OrderItem(
              product: action.item,
              count: action.count,
              totalCost: action.item.price * Decimal.fromInt(action.count)
          ));

        if (list.length > 0) {
          final sum = list
              .map((item) => item.totalCost)
              .reduce((res, el) => res +el);

          return state.copyWith(items: list, totalCost: sum);
        } else {
          return const BasketState.initial();
        }
      }
  );
}

BasketState _removeBasketReducer(BasketState state, RemoveBasketAction action) {
  return state.map(
      initial: (_) => const BasketState.initial(),
      filled: (state) {
        final list = state.items.where((item) => item.product.id != action.item.id).toList();
        if (list.isEmpty) return const BasketState.initial();

        final sum = list
            .map((item) => item.totalCost)
            .reduce((res, el) => res +el);

        return state.copyWith(items: list, totalCost: sum);
      }
  );
}
