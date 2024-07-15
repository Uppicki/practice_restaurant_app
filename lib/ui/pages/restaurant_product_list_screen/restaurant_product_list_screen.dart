import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice/router/app_router.dart';

@RoutePage()
class RestaurantProductListScreen extends StatelessWidget {
  const RestaurantProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) => InkWell(
                onTap: () async => await AutoRouter.of(context).push(ProductRoute()),
                child: Card.filled(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network('https://example.com/image$index.jpg'),
                        SizedBox(height: 8),
                        Text('Элемент $index'),
                      ],
                    ),
                  ),
                ),
              ),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}