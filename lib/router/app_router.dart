


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/product/product.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/redux/states/basket_state/basket_state.dart';
import 'package:practice/ui/pages/basket_screens/basket_navigation_screen/basket_navigation_screen.dart';
import 'package:practice/ui/pages/basket_screens/basket_screen/basket_screen.dart';
import 'package:practice/ui/pages/basket_screens/checkout_screen/check_out_screen.dart';
import 'package:practice/ui/pages/catalog_screens/catalog_navigation_screen/catalog_navigation_screen.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_category_product_screen/restaurant_category_product_screen.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_chains_screen/restaurant_chains_screen.dart';
import 'package:practice/ui/pages/catalog_screens/restaurant_product_list_screen/restaurant_product_list_screen.dart';
import 'package:practice/ui/pages/home_screen/home_screen.dart';
import 'package:practice/ui/pages/product_screen/product_screen.dart';
import 'package:practice/ui/pages/profile_screen/profile_screen.dart';
import 'package:practice/ui/pages/reservation_screen/reservation_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes =>
      [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            _catalogRoutes,
            _basketRoutes,
            AutoRoute(
                page: ReservationRoute.page
            ),
            AutoRoute(
                page: ProfileRoute.page
            ),
          ],
        )
      ];
}


final _catalogRoutes = AutoRoute(
  initial: true,
    page: CatalogNavigationRoute.page,
    children: [
      AutoRoute(
          initial: true,
          page: RestaurantChainsRoute.page
      ),
      AutoRoute(
          page: RestaurantCategoryProductRoute.page
      ),
      AutoRoute(
          page: RestaurantProductListRoute.page
      ),
      AutoRoute(
          page: ProductRoute.page
      ),
    ]
);
final _basketRoutes = AutoRoute(
  page: BasketNavigationRoute.page,
  children: [
    AutoRoute(page: BasketRoute.page, initial: true),
    AutoRoute(page: ProductRoute.page)
  ]
);