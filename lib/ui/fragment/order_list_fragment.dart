import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/order_item/order_item.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/redux/states/basket_state/basket_state.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/fragment/restaurant_chain_short_fragment.dart';

class OrderListFragment extends StatelessWidget {
  final FilledBasketState basket;

  const OrderListFragment({
    super.key,
    required this.basket,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              RestaurantChainShortFragment(restaurantChain: basket.restaurantChain),
              Expanded(
                child: ListView.builder(
                    itemCount: basket.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.build),
                        title: Text("Товар ${basket.items[index].product.name}"),
                        subtitle: Row(
                          children: [
                            Expanded(
                                child: Text("Кол-во: ${basket.items[index].count}")),
                            Expanded(
                                child:
                                    Text("Цена: ${basket.items[index].totalCost} P")),
                          ],
                        ),
                        trailing: Icon(Icons.delete),
                        onTap: () async => await AutoRouter.of(context).push(
                            ProductRoute(
                                restaurantChain: basket.restaurantChain,
                                restaurant: basket.restaurant,
                                product: basket.items[index].product,
                                count: basket.items[index].count)),
                      );
                    }),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text('Итого: ${basket.totalCost} P')
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).push(CheckOutRoute(basket: basket));
            },
            child: Text('Оформить заказ'),
          ),
        )
      ],
    );
  }
}
