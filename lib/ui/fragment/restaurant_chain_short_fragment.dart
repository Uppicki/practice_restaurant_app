






import 'package:flutter/material.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

class RestaurantChainShortFragment extends StatelessWidget {
  final RestaurantChain restaurantChain;

  const RestaurantChainShortFragment({super.key, required this.restaurantChain});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          restaurantChain.imageUrl),
      title: Text(restaurantChain.name),
    );
  }
}
