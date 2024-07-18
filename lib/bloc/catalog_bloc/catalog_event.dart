


part of 'catalog_bloc.dart';


@freezed
class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent.changeRestaurantChain({
  required RestaurantChain restaurantChain,
  }) = _ChangeRestaurantChainEvent;

  const factory CatalogEvent.changeCategory({
    required RestaurantCategory category,
  }) = _ChangeCategoryEvent;

  const factory CatalogEvent.changeRestaurant({
    required Restaurant restaurant,
  }) = _ChangeRestaurantEvent;

  const factory CatalogEvent.back() = _BackEvent;
}