import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web_route/src/common/custom_route_delegate.dart';
import 'package:web_route/src/ui/pages/first_page.dart';
import 'package:web_route/src/ui/pages/nested_first_page.dart';
import 'package:web_route/src/ui/pages/nested_second_page.dart';
import 'package:web_route/src/ui/pages/second_page.dart';

import 'common/custom_route_information.dart';
import 'ui/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: CustomRouteInformation(),
      routerDelegate: CustomRouteDelegate(),
    );
  }
}
