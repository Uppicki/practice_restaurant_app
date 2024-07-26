



import 'package:flutter/material.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/app/theme_app.dart';
import 'package:practice/router/app_router.dart';

class RegRouter extends StatelessWidget {
  const RegRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = AppRouter();

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: getTheme(),
      routerConfig: _router.config(
        reevaluateListenable: ApiClient.client.authProvider
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}
