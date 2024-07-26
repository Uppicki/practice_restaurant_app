import 'package:auto_route/auto_route.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    if(ApiClient.client.authProvider.isLoggedIn) {
      resolver.next(true);
    } else {
      resolver.redirect(
        const ProfileRoute()
      );
    }
  }
}