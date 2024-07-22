import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/bloc/order_item_bloc/order_item_bloc.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/thunk_actions/basket_thunk_action.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  Product product;
  RestaurantChain restaurantChain;
  Restaurant? restaurant;
  int? count;

  ProductScreen({
    super.key,
    required this.product,
    this.count,
    required this.restaurantChain,
    this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final productBloc = OrderItemBloc(product: product, count: count ?? 0);

    return BlocProvider(
      create: (context) => productBloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text(product.name),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Image.network(
                product.imageUrl,
                fit: BoxFit.fitWidth,
              )),
              Expanded(
                child: _productInformationFragment(product: product),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () => productBloc.add(
                                        const OrderItemEvent.changeCount(
                                            delta: -1)),
                                    icon: const Icon(Icons.remove)),
                                BlocBuilder<OrderItemBloc, OrderItemState>(
                                    builder: (_, state) {
                                  return state.map(
                                      count: (state) =>
                                          Text(state.count.toString()));
                                }),
                                IconButton(
                                    onPressed: () => productBloc.add(
                                        const OrderItemEvent.changeCount(
                                            delta: 1)),
                                    icon: const Icon(Icons.add)),
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<OrderItemBloc, OrderItemState>(
                              builder: (_, state) {
                            return state.map(
                                count: (state) => Text(
                                    '${(product.price * Decimal.fromInt(state.count))} Р'));
                          }),
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final store = StoreProvider.of<AppState>(context);

                          store.dispatch(confirmAddOrderItemAction(
                              context,
                              count,
                              product,
                              productBloc.state.count,
                              restaurantChain,
                            restaurant,
                            StoreProvider.of<AppState>(context).state.basketState
                          ));

                          context.router.maybePop();
                        },
                        child: const Text('Добавить в корзину'),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget _productInformationFragment({required Product product}) =>
    SingleChildScrollView(
        child: Column(
      children: [
        Text(
          product.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          product.description,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Стоимость: ${product.price.toString()} Р',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Категории:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...product.categories.map((category) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                category.name,
                style: const TextStyle(fontSize: 16),
              ),
            )),

        // Add more fields as needed
      ],
    ));
