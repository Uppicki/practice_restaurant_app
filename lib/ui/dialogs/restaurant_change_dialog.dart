import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/bloc/list_loading_bloc/list_loading_bloc.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/payload/empty_payload.dart';
import 'package:practice/payload/requests/restaurant_get_request/restaurant_get_request.dart';
import 'package:practice/ui/fragment/progress_indicator_fragment.dart';

Future<Restaurant?> restaurantChangeDialog({
  required BuildContext context,
  required RestaurantChain restaurantChain,
  Restaurant? restaurant,
}) async =>
    showDialog<Restaurant?>(
        context: context,
        builder: (innerContext) {
          final changeRest, returnRest;
          [changeRest, returnRest] = _createCallbacks(restaurant);

          return BlocProvider(
            create: (context) {
              final bloc = ListLoadingBloc<Restaurant>(
                  requestCallback: ({dynamic request}) => ApiClient.client.catalogClient.getRestaurant(request: request),
              );

              bloc.add(ListLoadingEvent.loadItems(loadingRequest: RestaurantGetRequest(restaurantChainId: restaurantChain.id)));

              return bloc;
            },


            child: AlertDialog(
              title: Text('Выберите ресторан'),
              content: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 1)),
                  width: double.maxFinite,
                  height: 300,
                  child: BlocBuilder<ListLoadingBloc<Restaurant>,
                      ListLoadingState<Restaurant>>(
                    builder: (context, state) {
                      return state.map(
                          initial: (_) => _emptyList(),
                          loading: (_) => const ProgressIndicatorFragment(),
                          loaded: (state) => _ListFragment(
                              restaurants: state.list,
                              restaurant: restaurant,
                            callback: changeRest
                          ),
                          empty: (_) => _emptyList()
                      );
                    },
                  )
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(innerContext).pop(returnRest());
                  },
                  child: Text('Выбрать'),
                ),
              ],
            ),
          );
        });


Widget _emptyList() {
  return const Center(
    child: Text('Список ресторанов пуст.'),
  );
}

class _ListFragment extends StatefulWidget {
  final List<Restaurant> restaurants;
  final Restaurant? restaurant;

  final Function callback;

  const _ListFragment({required this.restaurants, this.restaurant, required this.callback});

  @override
  _ListFragmentState createState() => _ListFragmentState();
}


class _ListFragmentState extends State<_ListFragment> {
  Restaurant? _selectedRestaurant;

  @override
  void initState() {
    super.initState();
    _selectedRestaurant = widget.restaurant;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (ctx, index) {
              final restaurant = widget.restaurants[index];
              final isActive = restaurant.id == _selectedRestaurant?.id;
              return ListTile(
                title: Text(
                  restaurant.toString(),
                  style: TextStyle(
                    color: isActive ? Colors.blue : Colors.black,
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.callback(restaurant);
                    _selectedRestaurant = restaurant;
                  });
                },
              );
            },
            childCount: widget.restaurants.length,
          ),
        ),
      ],
    );
  }
}


List<Function> _createCallbacks(Restaurant? restaurant) {
  Restaurant? r = restaurant;

  changeRestaurant(Restaurant? restaurant) {
    r = restaurant;
  }

  returnRestaurant() {
    return r;
  }

  return [changeRestaurant, returnRestaurant];
}