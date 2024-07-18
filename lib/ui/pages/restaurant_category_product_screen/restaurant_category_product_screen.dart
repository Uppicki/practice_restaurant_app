


import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/cards/short_card.dart';
import 'package:practice/ui/fragment/restaurant_field_fragment.dart';


@RoutePage()
class RestaurantCategoryProductScreen extends StatelessWidget {
  const RestaurantCategoryProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("asd 3");
    final bloc = context.read<CatalogBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text((bloc.state as ChangedChainState).restaurantChain.name),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            flexibleSpace: Image.network(
              (bloc.state as ChangedChainState).restaurantChain.imageUrl,
                      fit: BoxFit.fitWidth,
            )
          ),
          BlocBuilder<CatalogBloc, CatalogState>(
            bloc: bloc,
              builder: (_, state) {
              if (state is ChangedChainState ) {
                return RestaurantFieldFragment(
                  restaurantChain: state.restaurantChain,
                  blocFunction: bloc.add,
                  eventFunction: CatalogEvent.changeRestaurant,
                  restaurant: state.restaurant,
                );
              } else {
                return SliverToBoxAdapter(child: Center());
              }
            }
          )

        ],
      ),
    );
  }
}




