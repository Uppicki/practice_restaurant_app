



import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/router/app_router.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AutoTabsScaffold(
          routes: [ReservationRoute(), CatalogRoute(), HistoryRoute(), ProfileRoute()],
          bottomNavigationBuilder: (_, tabsRouter) =>
          BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                    label: 'Бронь',
                    icon: Icon(Icons.access_alarm)
                ),
                BottomNavigationBarItem(
                  label: 'Каталог',
                  icon: SvgPicture.asset("assets/svg/Catalog.svg"),
                  activeIcon: SvgPicture.asset("assets/svg/ActiveCatalog.svg"),
                ),
                BottomNavigationBarItem(
                  label: 'Избранное',
                  icon: SvgPicture.asset("assets/svg/Favourite.svg"),
                  activeIcon: SvgPicture.asset("assets/svg/ActiveFavourite.svg"),
                ),
                BottomNavigationBarItem(
                  label: 'Профиль',
                  icon: SvgPicture.asset("assets/svg/Profile.svg"),
                  activeIcon: SvgPicture.asset("assets/svg/ActiveProfile.svg"),
                ),
              ]
          ),
        )
    );
  }
}
