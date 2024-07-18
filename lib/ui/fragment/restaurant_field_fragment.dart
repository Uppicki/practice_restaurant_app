import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/ui/dialogs/restaurant_change_dialog.dart';

class RestaurantFieldFragment extends StatelessWidget {
  final RestaurantChain restaurantChain;
  final Restaurant? restaurant;
  final Function blocFunction;
  final Function eventFunction;

  const RestaurantFieldFragment({
    super.key,
    required this.restaurantChain,
    required this.blocFunction,
    required this.eventFunction,
    this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      collapsedHeight: 80,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: Colors.black, width: 1.0),
          ),
          title: Text(restaurant?.id.toString() ?? 'Выберите ресторан'),
          subtitle: Text(restaurant?.id.toString() ?? 'Выберите ресторан'),
          onTap: () async {
            final res = await restaurantChangeDialog(
                context: context,
                restaurantChain: restaurantChain,
                restaurant: restaurant);
            print(res);
            if (res!= null) {
              blocFunction(eventFunction(restaurant: res));
            }
          },
        ),
      ),
      pinned: true,
    );
  }
}
