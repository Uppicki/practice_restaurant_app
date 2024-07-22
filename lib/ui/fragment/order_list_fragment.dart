import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/order_item/order_item.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/router/app_router.dart';

class OrderListFragment extends StatelessWidget {
  final RestaurantChain restaurantChain;
  final Restaurant? restaurant;
  final List<OrderItem> items;
  final Decimal totalCost;

  const OrderListFragment({
    super.key,
    required this.restaurantChain,
    required this.restaurant,
    required this.items,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              ListTile(
                leading: Image.network(restaurantChain.imageUrl),
                title: Text(restaurantChain.name),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.build),
                        title: Text("Товар ${items[index].product.name}"),
                        subtitle: Row(
                          children: [
                            Expanded(
                                child: Text("Кол-во: ${items[index].count}")),
                            Expanded(
                                child:
                                    Text("Цена: ${items[index].totalCost} P")),
                          ],
                        ),
                        trailing: Icon(Icons.delete),
                        onTap: () async => await AutoRouter.of(context).push(
                            ProductRoute(
                                restaurantChain: restaurantChain,
                                restaurant: restaurant,
                                product: items[index].product,
                                count: items[index].count)),
                      );
                    }),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text('Итого: ${totalCost} P')
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Оформить заказ'),
          ),
        )
      ],
    );
  }
}
