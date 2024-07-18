


import 'package:auto_route/auto_route.dart';
import 'package:practice/ui/pages/catalog_navigation_screen/catalog_navigation_screen.dart';
import 'package:practice/ui/pages/order_navigation_screen/order_navigation_screen.dart';
import 'package:practice/ui/pages/restaurant_product_list_screen/restaurant_product_list_screen.dart';
import 'package:practice/ui/pages/order_screen/order_screen.dart';
import 'package:practice/ui/pages/home_screen/home_screen.dart';
import 'package:practice/ui/pages/product_screen/product_screen.dart';
import 'package:practice/ui/pages/profile_screen/profile_screen.dart';
import 'package:practice/ui/pages/reservation_screen/reservation_screen.dart';
import 'package:practice/ui/pages/restaurant_category_product_screen/restaurant_category_product_screen.dart';
import 'package:practice/ui/pages/restaurant_chains_screen/restaurant_chains_screen.dart';

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
            AutoRoute(
                page: ReservationRoute.page
            ),
            _catalogRoutes,
            _orderRoutes,
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
final _orderRoutes = AutoRoute(
  page: OrderNavigationRoute.page,
  children: [
    AutoRoute(page: OrderRoute.page, initial: true),
    AutoRoute(page: ProductRoute.page)
  ]
);