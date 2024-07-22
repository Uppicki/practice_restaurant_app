import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/order_item_bloc/order_item_bloc.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

class OrderItemFragment extends StatelessWidget {
  final RestaurantChain restaurantChain;
  final Restaurant? restaurant;
  final Product product;
  final int? count;

  const OrderItemFragment({
    super.key,
    required this.restaurantChain,
    required this.restaurant,
    required this.product,
    this.count
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
              Expanded(child: Image.network(
                product.imageUrl,
                fit: BoxFit.fitWidth,
              )),
              Expanded(
                child: SingleChildScrollView(
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
                    )
                ),
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
                                    onPressed: () => productBloc.add(const OrderItemEvent.changeCount(delta: -1)),
                                    icon: const Icon(Icons.remove)
                                ),
                                BlocBuilder<OrderItemBloc, OrderItemState>(
                                  bloc: productBloc,
                                    builder: (_, state) {
                                      return state.map(
                                          count: (state) => Text(state.count.toString())
                                      );
                                    }
                                ),
                                IconButton(
                                    onPressed: () => productBloc.add(const OrderItemEvent.changeCount(delta: 1)),
                                    icon: const Icon(Icons.add)
                                ),
                              ],
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: BlocBuilder<OrderItemBloc, OrderItemState>(
                                bloc: productBloc,
                                builder: (_, state) {
                                  return state.map(
                                      count: (state) => Text('${(product.price * Decimal.fromInt(state.count))} Р')
                                  );
                                }
                            ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Добавить в корзину'),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
