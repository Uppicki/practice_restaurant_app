



import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/restaurant_chains_bloc/restaurant_chains_bloc.dart';
import 'package:practice/router/app_router.dart';

class ChainsListFragment extends StatelessWidget {
  const ChainsListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RestaurantChainsBloc>();
    print('asd');
    LoadedState state = bloc.state as LoadedState;


    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) => InkWell(
              onTap: () async => await AutoRouter.of(context).push(RestaurantCategoryProductRoute()),
              child: Card.filled(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Image.network(state.restaurantChains[index].imageUrl),
                      ),
                      SizedBox(height: 8),
                      Text(state.restaurantChains[index].name),
                    ],
                  ),
                ),
              ),
            ),
            childCount: state.restaurantChains.length,
          ),
        ),
      ],
    );
  }
}