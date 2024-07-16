

part of 'restaurant_chains_bloc.dart';



@freezed
class RestaurantChainsEvent with _$RestaurantChainsEvent {
  const factory RestaurantChainsEvent.loadChains() = _LoadChainsEvent;
}


