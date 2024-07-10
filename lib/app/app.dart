



import 'package:flutter/material.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/app/reg_redux.dart';
import 'package:practice/app/reg_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initApiClient();
    Widget app = RegRouter();
    app = regRedux(app: app);

    return app;
  }
}