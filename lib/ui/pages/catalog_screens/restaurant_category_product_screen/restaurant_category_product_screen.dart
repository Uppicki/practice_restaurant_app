import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/bloc/list_loading_bloc/list_loading_bloc.dart';
import 'package:practice/models/restaurant_category/restaurant_category.dart';
import 'package:practice/payload/requests/restaurant_get_request/restaurant_get_request.dart';
import 'package:practice/ui/fragment/progress_indicator_fragment.dart';
import 'package:practice/ui/fragment/restaurant_field_fragment.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_category_product_screen/restaurant_category_fragments/category_empty_list.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_category_product_screen/restaurant_category_fragments/category_list_fragment.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_category_product_screen/restaurant_category_fragments/restaurant_notification_fragment.dart';


@RoutePage()
class RestaurantCategoryProductScreen extends StatelessWidget {
  const RestaurantCategoryProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                if (state is ChangedChainState) {
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
          ),
          BlocBuilder<CatalogBloc, CatalogState>(
              bloc: bloc,
              builder: (_, state) {
                if (state is ChangedChainState) {
                  return _fragmentManager(state);
                }
                return SliverToBoxAdapter(child: Center());
              }
          ),
        ],
      ),
    );
  }
}


Widget _fragmentManager(ChangedChainState state) {
  if (state.restaurantChain.hasUniqueRestaurants && state.restaurant == null) {
    return const RestaurantNotificationFragment();
  } else {
    final bloc = ListLoadingBloc<RestaurantCategory>(
        requestCallback: ({dynamic request}) =>
            ApiClient.client.catalogClient.getCategory(request: request)
    );


    state.restaurantChain.hasUniqueRestaurants ?
    bloc.add(ListLoadingEvent.loadItems(loadingRequest: RestaurantGetRequest(
        restaurantId: state.restaurant!.id))) :
    bloc.add(ListLoadingEvent.loadItems(loadingRequest: RestaurantGetRequest(
        restaurantChainId: state.restaurantChain.id)));

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<ListLoadingBloc<RestaurantCategory>,
          ListLoadingState<RestaurantCategory>>(
          bloc: bloc,
          builder: (context, state) {
            return state.map(
                initial: (_) =>
                const SliverToBoxAdapter(
                  child: CategoryEmptyList(),
                ),
                loading: (_) =>
                const SliverToBoxAdapter(
                  child: ProgressIndicatorFragment(),
                ),
                loaded: (state) => CategoryListFragment(state: state),
                empty: (_) =>
                const SliverToBoxAdapter(
                  child: CategoryEmptyList(),
                )
            );
          }
      ),
    );
  }
}