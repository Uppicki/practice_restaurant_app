import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_category/restaurant_category.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

part 'catalog_state.dart';
part 'catalog_event.dart';

part 'catalog_bloc.freezed.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogState.initial()) {
    on<CatalogEvent>((event, emitter) {
      final currentState = state;

      event.map(
          changeRestaurantChain: (event) => emitter(ChangedChainState(
                restaurantChain: event.restaurantChain,
              )),

          changeCategory: (event) {
            emitter(currentState.map(
                initial: (state) => InitialState(),
                changeChains: (state) => ChangedCategoryState(
                    restaurantChain: state.restaurantChain,
                    category: event.category),
                changeCategory: (state) => ChangedCategoryState(
                    restaurantChain: state.restaurantChain,
                    category: state.category),
                changeProduct: (state) => state.copyWith()
            ));
          },

          back: (event) => emitter(currentState.map(
              initial: (state) => InitialState(),
              changeChains: (state) => InitialState(),
              changeCategory: (state) =>
                  ChangedChainState(
                      restaurantChain: state.restaurantChain,
                      restaurant: state.restaurant
                  ),
              changeProduct: (state) =>
                  ChangedCategoryState(
                      restaurantChain: state.restaurantChain,
                      category: state.category,
                    restaurant: state.restaurant
                  )
          )),

          changeRestaurant: (event) => emitter(
              currentState.map(
                  initial: (state) => InitialState(),
                  changeChains: (state) => ChangedChainState(restaurantChain: state.restaurantChain, restaurant: event.restaurant),
                  changeCategory: (state) => state.copyWith(restaurant: event.restaurant),
                  changeProduct: (state) => state.copyWith(restaurant: event.restaurant)
              )
          ),

          changedProduct: (event) => emitter(
              currentState.map(
                  initial: (state) => const InitialState(),
                  changeChains: (state) => state.copyWith(),
                  changeCategory: (state) =>
                      ChangedProductState(
                          restaurantChain: state.restaurantChain,
                          category: state.category,
                          restaurant: state.restaurant,
                          product: event.product
                      ),
                  changeProduct: (state) => state.copyWith()
              )
          )
      );
    });
  }
}
