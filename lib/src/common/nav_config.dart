import 'package:flutter/material.dart';

typedef PageBuilder = Function(Uri uri, dynamic params);

class NavConfig extends ChangeNotifier {
  NavConfig({required this.routes});

  final Map<Pattern, PageBuilder> routes;


}