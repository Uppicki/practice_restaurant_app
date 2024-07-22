import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/bloc/list_loading_bloc/list_loading_bloc.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/payload/requests/restaurant_get_request/restaurant_get_request.dart';
import 'package:practice/ui/fragment/progress_indicator_fragment.dart';
import 'package:practice/ui/fragment/restaurant_field_fragment.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_product_list_screen/product_list_fragments/empty_product_list_fragment.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_product_list_screen/product_list_fragments/product_list_fragment.dart';

@RoutePage()
class RestaurantProductListScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const RestaurantProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogBloc = context.read<CatalogBloc>();

    return BlocBuilder<CatalogBloc, CatalogState>(
      bloc: catalogBloc,
      builder: (context, state) {
        if (state is ChangedCategoryState) {
          final productBloc = context.read<ListLoadingBloc<Product>>();

          (state.restaurantChain.hasUniqueRestaurants)
              ? productBloc.add(ListLoadingEvent.loadItems(
                  loadingRequest: RestaurantGetRequest(
                      categoryId: state.category.id,
                      restaurantId: state.restaurant!.id)))
              : productBloc.add(ListLoadingEvent.loadItems(
                  loadingRequest: RestaurantGetRequest(
                  categoryId: state.category.id,
                  restaurantChainId: state.restaurantChain.id,
                )));

          return Scaffold(
            appBar: AppBar(
              title: Text(state.category.name),
            ),
            body: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                RestaurantFieldFragment(
                  restaurantChain: state.restaurantChain,
                  blocFunction: catalogBloc.add,
                  eventFunction: CatalogEvent.changeRestaurant,
                  restaurant: state.restaurant,
                ),
                BlocBuilder<ListLoadingBloc<Product>,
                        ListLoadingState<Product>>(
                    builder: (_, state) => state.map(
                        initial: (_) => const SliverToBoxAdapter(
                              child: EmptyProductListFragment(),
                            ),
                        loading: (_) => const SliverToBoxAdapter(
                              child: ProgressIndicatorFragment(),
                            ),
                        loaded: (state) => ProductListFragment(state: state),
                        empty: (_) => const SliverToBoxAdapter(
                              child: EmptyProductListFragment(),
                            ))),
              ],
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final bloc = ListLoadingBloc<Product>(
        requestCallback: ({dynamic request}) =>
            ApiClient.client.catalogClient.getProducts(request: request));

    return BlocProvider(
      create: (context) => bloc,
      child: this,
    );
  }
}
