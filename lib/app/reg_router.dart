



import 'package:flutter/material.dart';
import 'package:practice/router/app_router.dart';

class RegRouter extends StatelessWidget {
  const RegRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = AppRouter();

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
