



part of 'catalog_bloc.dart';


@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState.initial() = InitialState;

  const factory CatalogState.changeChains({
    required RestaurantChain restaurantChain,
    Restaurant? restaurant,
  }) = ChangedChainState;

  const factory CatalogState.changeCategory({
    required RestaurantChain restaurantChain,
    required RestaurantCategory category,
    Restaurant? restaurant,
  }) = ChangedCategoryState;
}
