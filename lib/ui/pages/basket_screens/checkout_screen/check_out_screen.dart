



import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оформление заказа'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              leading: Image.network(restaurantChain.imageUrl),
              title: Text(restaurantChain.name),
            ),
            Segment

            SizedBox(
              child: ElevatedButton(
                onPressed: () {  },
                child: Text('Оформить'),
              ),
            )
          ],
        ),
      )
    );
  }
}
