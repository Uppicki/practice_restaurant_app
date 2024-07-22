import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/bloc/list_loading_bloc/list_loading_bloc.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/payload/requests/restaurant_get_request/restaurant_get_request.dart';
import 'package:practice/ui/fragment/progress_indicator_fragment.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_chains_screen/restaurant_chains_fragments/chain_empty_list.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_chains_screen/restaurant_chains_fragments/chain_list_fragment.dart';

@RoutePage()
class RestaurantChainsScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const RestaurantChainsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Сеть ресторанов'),
        ),
        body: BlocBuilder<ListLoadingBloc<RestaurantChain>,
            ListLoadingState<RestaurantChain>>(
          bloc: context.read<ListLoadingBloc<RestaurantChain>>(),
          builder: (context, state) => _fragmentManager(state),
        ));
  }

  @override
  Widget wrappedRoute(BuildContext context) {

    final bloc = ListLoadingBloc<RestaurantChain>(
        requestCallback: ({dynamic request}) => ApiClient.client.catalogClient.getRestaurantChains(request:request)
    );
    bloc.add(const ListLoadingEvent.loadItems(loadingRequest: RestaurantGetRequest()));

    return BlocProvider(
      create: (_) => bloc,
      child: this,
    );
  }
}

Widget _fragmentManager(ListLoadingState<RestaurantChain> state) => state.map(
    initial: (_) => const ChainEmptyList(),
    loading: (_) => const ProgressIndicatorFragment(),
    loaded: (state) => ChainListFragment(state: state),
    empty: (_) => const ChainEmptyList());
