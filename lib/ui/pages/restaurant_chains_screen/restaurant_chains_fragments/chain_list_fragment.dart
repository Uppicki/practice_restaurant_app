import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/bloc/list_loading_bloc/list_loading_bloc.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/cards/short_card.dart';

class ChainListFragment extends StatelessWidget {
  final LoadedState state;

  const ChainListFragment({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    print("asd 2");
    final catalogBloc = context.read<CatalogBloc>();


    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => InkWell(
              onTap: () async {
                catalogBloc.add(CatalogEvent.changeRestaurantChain(
                    restaurantChain: state.list[index]));

                await AutoRouter.of(context)
                    .push(RestaurantCategoryProductRoute());

                catalogBloc.add(CatalogEvent.back());
              },
              child: shortCard(
                  imageUrl: state.list[index].imageUrl,
                  title: state.list[index].name
              ),
            ),
            childCount: state.list.length,
          ),
        ),
      ],
    );
  }
}
