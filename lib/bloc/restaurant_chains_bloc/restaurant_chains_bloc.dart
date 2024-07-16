

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

part 'restaurant_chains_event.dart';
part 'restaurant_chains_state.dart';


part 'restaurant_chains_bloc.freezed.dart';

class RestaurantChainsBloc extends Bloc<RestaurantChainsEvent, RestaurantChainsState> {
  RestaurantChainsBloc() : super(RestaurantChainsState.initial()) {
    on<RestaurantChainsEvent>((event, emitter) async {
      await event.map(loadChains: (event) async => await _loadChains(event, emitter));
    });
  }


  _loadChains(_LoadChainsEvent event, Emitter<RestaurantChainsState> emitter) async {
    emitter(RestaurantChainsState.loading());
    final client = ApiClient.client.catalogClient;
    final res = await client.getRests();
    emitter(RestaurantChainsState.loaded(restaurantChains: res));
  }
}



