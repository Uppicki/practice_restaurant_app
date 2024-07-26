import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:practice/payload/requests/create_order_request/create_order_request.dart';
import 'package:practice/payload/requests/create_order_request/order_type/order_type.dart';
import 'package:practice/payload/requests/create_order_request/short_order_item/short_order_item.dart';
import 'package:practice/redux/actions/basket_action/basket_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/basket_state/basket_state.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/fragment/restaurant_chain_short_fragment.dart';
import 'package:practice/ui/fragment/restaurant_field_fragment.dart';
import 'package:practice/ui/pages/basket_screens/checkout_screen/checkout_fragments/address_field_fragment.dart';
import 'package:practice/ui/pages/basket_screens/checkout_screen/checkout_fragments/type_order.dart';

@RoutePage()
class CheckOutScreen extends StatelessWidget implements AutoRouteWrapper {
  final FilledBasketState basket;

  const CheckOutScreen({super.key, required this.basket});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CheckoutBloc>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Оформление заказа'),
        ),
        body: BlocListener<CheckoutBloc, CheckoutState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is SuccessCheckoutState) {
              final store = StoreProvider.of<AppState>(context);
              store.dispatch(BasketAction.clear());
              AutoRouter.of(context).maybePop();
            } else if ((state is PickupChechoutState) &&
                (state.error != null)) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error!),
                    duration: Duration(seconds: 2),
                  )
              );
              bloc.add(CheckoutEvent.clearError());
            } else if ((state is PickupChechoutState) &&
                (state.error != null)) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error!),
                    duration: Duration(seconds: 2),
                  )
              );
              bloc.add(CheckoutEvent.clearError());
            }
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      RestaurantChainShortFragment(
                          restaurantChain: basket.restaurantChain),
                      BlocBuilder<CheckoutBloc, CheckoutState>(
                          bloc: bloc,
                          builder: (context, state) =>
                              TypeOrder(bloc: bloc, state: state)),
                      BlocBuilder<CheckoutBloc, CheckoutState>(
                          bloc: bloc,
                          builder: (_, state) =>
                              _fragmentFieldManager(bloc, state)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Text('Итого: ${basket.totalCost} P')),
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (_, state) =>
                          ElevatedButton(
                            onPressed: state.mapOrNull(
                              delivery: (state) =>
                                  () =>
                                  bloc.add(const CheckoutEvent.creteCheckout()),
                              pickup: (state) =>
                                  () =>
                                  bloc.add(
                                      const CheckoutEvent.creteCheckout()),),
                            child: Text('Оформить'),
                          ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CheckoutBloc(
              restaurantChain: basket.restaurantChain,
              items: basket.items,
              restaurant: basket.restaurant),
      child: this,
    );
  }
}

Widget _fragmentFieldManager(CheckoutBloc bloc, CheckoutState state) =>
    state.map(
        delivery: (state) =>
            AddressFieldFragment(
                blocFunction: bloc.add,
                eventFunction: CheckoutEvent.changeAddress,
                address: state.address),
        pickup: (state) =>
            Flexible(
              child: CustomScrollView(
                slivers: [RestaurantFieldFragment(
                  restaurantChain: state.restaurantChain,
                  blocFunction: bloc.add,
                  eventFunction: CheckoutEvent.changeRestaurant,
                  restaurant: state.restaurant,
                ),]
              ),
            ),
        upload: (_) => Container(),
        success: (_) => Container());
