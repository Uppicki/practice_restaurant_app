


import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice/router/app_router.dart';


@RoutePage()
class RestaurantCategoryProductScreen extends StatelessWidget {
  const RestaurantCategoryProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: _MySliverAppBar(expandedHeight: 300),
            pinned: true,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) => InkWell(
                onTap: () async => await AutoRouter.of(context).push(RestaurantProductListRoute()),
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


class _MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  _MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}




