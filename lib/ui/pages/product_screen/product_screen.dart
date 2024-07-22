import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/ui/fragment/order_item_fragment.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
        builder: (_, state) =>
          (state is ChangedProductState) ?
              OrderItemFragment(
                  restaurantChain: state.restaurantChain,
                  restaurant: state.restaurant,
                  product: state.product
              ) :
              Container(),
    );
  }
}
