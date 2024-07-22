



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/redux/actions/basket_action/basket_action.dart';
import 'package:practice/redux/states/basket_state/basket_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction confirmAddOrderItemAction(
    BuildContext context,
    int? count,
    Product product,
    int productCount,
    RestaurantChain restaurantChain,
    Restaurant? restaurant,
    BasketState basketState
    ) => (Store store) async {

  if ((count == null && productCount == 0) || count == productCount) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Необходимо указать количество'),
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  if (basketState is FilledBasketState) {
    if (basketState.restaurantChain.id == restaurantChain.id) {
      if (basketState.restaurantChain.hasUniqueRestaurants &&
          basketState.restaurant!.id != restaurant!.id) {
        bool? result = await _showConfirmationDialog(context);
        if (result == true) {
          store.dispatch(CreateBasketAction(
              restaurantChain: restaurantChain,
              restaurant: restaurant,
              item: product,
              count: productCount
          ));
        }
      } else {
        store.dispatch(AddBasketAction(
          item: product,
          count: productCount
        ));
      }
    } else {
      bool? result = await _showConfirmationDialog(context);
      if (result == true) {
        store.dispatch(CreateBasketAction(
            restaurantChain: restaurantChain,
            restaurant: restaurant,
            item: product,
            count: productCount
        ));
      }
    }
  } else {
    store.dispatch(CreateBasketAction(
      restaurantChain: restaurantChain,
      restaurant: restaurant,
      item: product,
      count: productCount
    ));
  }
};

Future<bool?> _showConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure you want to proceed?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Отменить
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Подтвердить
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}



