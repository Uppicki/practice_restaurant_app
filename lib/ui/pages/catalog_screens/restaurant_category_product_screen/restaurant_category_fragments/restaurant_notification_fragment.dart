





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantNotificationFragment extends StatelessWidget {
  const RestaurantNotificationFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('Необходимо выбрать ресторан'),
      ),
    );
  }
}
