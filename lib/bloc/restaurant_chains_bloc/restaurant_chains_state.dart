



part of 'restaurant_chains_bloc.dart';


@freezed
class RestaurantChainsState with _$RestaurantChainsState {
  const factory RestaurantChainsState.initial() = _EmptyState;
  const factory RestaurantChainsState.loading() = _LoadingState;
  const factory RestaurantChainsState.loaded({
    required List<RestaurantChain> restaurantChains,
  }) = LoadedState;
}
