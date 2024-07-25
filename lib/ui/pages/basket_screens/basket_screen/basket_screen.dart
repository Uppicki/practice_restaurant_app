import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/basket_state/basket_state.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/fragment/order_list_fragment.dart';
import 'package:practice/ui/pages/basket_screens/basket_screen/basket_fragments/empty_basket_fragment.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Корзина')),
      body: StoreConnector<AppState, BasketState>(
        distinct: true,
        converter: (store) => store.state.basketState,
        builder: (context, state) {
          return state.map(
              initial: (_) => const EmptyBasketFragment(),
              filled: (state) => OrderListFragment(
                basket: state,
              ),
          );
        }
      )
    );
  }
}

