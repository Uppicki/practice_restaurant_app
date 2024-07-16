import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/restaurant_chains_bloc/restaurant_chains_bloc.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/pages/restaurant_category_product_screen/restaurant_category_product_screen.dart';
import 'package:practice/ui/pages/restaurant_chains_screen/restaurant_chains_fragment_manager.dart';
import 'package:practice/ui/pages/restaurant_chains_screen/restaurant_chains_fragments/chain_list_fragment.dart';


@RoutePage()
class RestaurantChainsScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const RestaurantChainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RestaurantChainsBloc>();
    bloc.add(RestaurantChainsEvent.loadChains());

    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
      ),
      body: BlocBuilder<RestaurantChainsBloc, RestaurantChainsState>(
        bloc: bloc,
        builder: (context, state) {
          return fragmentManager(state);
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantChainsBloc(),
      child: this,
    );
  }
}




