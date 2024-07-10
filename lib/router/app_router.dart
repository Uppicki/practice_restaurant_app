


import 'package:auto_route/auto_route.dart';
import 'package:practice/ui/pages/catalog_screen/catalog_screen.dart';
import 'package:practice/ui/pages/history_screen/history_screen.dart';
import 'package:practice/ui/pages/home_screen/home_screen.dart';
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
            AutoRoute(
                page: ReservationRoute.page
            ),
            AutoRoute(
                page: CatalogRoute.page,
            ),
            AutoRoute(
                page: HistoryRoute.page
            ),
            AutoRoute(
                page: ProfileRoute.page,
              initial: true
            ),
          ],
        )
      ];
}