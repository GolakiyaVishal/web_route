import 'package:flutter/material.dart';
import 'package:web_route/src/common/app_route_configutration.dart';
import 'package:web_route/src/ui/pages/first_page.dart';
import 'package:web_route/src/ui/pages/home_page.dart';
import 'package:web_route/src/ui/pages/nested_first_page.dart';
import 'package:web_route/src/ui/pages/nested_second_page.dart';
import 'package:web_route/src/ui/pages/second_page.dart';

class CustomRouteDelegate extends RouterDelegate<AppRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteConfig> {
  CustomRouteDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _navigatorKey;

  bool _isHomePage = false;

  bool get isHomePage => _isHomePage;

  set isHomePage(bool value) {
    if (value) {
      _isHomePage = true;
      _isFirstPage = false;
      _isNestedFirstPage = false;
      _isSecondPage = false;
      _isNestedSecondPage = false;

      notifyListeners();
    }
  }

  bool _isFirstPage = false;

  bool get isFirstPage => _isFirstPage;

  set isFirstPage(bool value) {
    if (value) {
      _isHomePage = true;
      _isFirstPage = value;
      _isNestedFirstPage = false;
      _isSecondPage = false;
      _isNestedSecondPage = false;

      notifyListeners();
    }
  }

  bool _isNestedFirstPage = false;

  bool get isNestedFirstPage => _isNestedFirstPage;

  set isNestedFirstPage(bool value) {
    if (value) {
      _isHomePage = true;
      _isFirstPage = true;
      _isNestedFirstPage = value;
      _isSecondPage = false;
      _isNestedSecondPage = false;

      notifyListeners();
    }
  }

  bool _isSecondPage = false;

  bool get isSecondPage => _isSecondPage;

  set isSecondPage(bool value) {
    if (value) {
      _isHomePage = true;
      _isFirstPage = false;
      _isNestedFirstPage = false;
      _isSecondPage = true;
      _isNestedSecondPage = false;

      notifyListeners();
    }
  }

  bool _isNestedSecondPage = false;

  bool get isNestedSecondPage => _isNestedSecondPage;

  set isNestedSecondPage(bool value) {
    if (value) {
      _isHomePage = true;
      _isFirstPage = false;
      _isNestedFirstPage = false;
      _isSecondPage = true;
      _isNestedSecondPage = true;

      notifyListeners();
    }
  }

  final List<Page> _homeStack = [
    const MaterialPage(child: MyHomePage(title: 'Stack home page'))
  ];

  final List<Page> _firstStack = [
    const MaterialPage(child: MyHomePage(title: 'First page stack')),
    const MaterialPage(child: FirstPage()),
  ];

  final List<Page> _nestedFirstStack = [
    const MaterialPage(child: MyHomePage(title: 'Nested First stack')),
    const MaterialPage(child: FirstPage()),
    const MaterialPage(child: NestedFirstPage()),
  ];

  final List<Page> _secondStack = [
    const MaterialPage(child: MyHomePage(title: 'Second page stack')),
    const MaterialPage(child: SecondPage()),
  ];

  final List<Page> _nestedSecondStack = [
    const MaterialPage(child: MyHomePage(title: 'Nested second stack')),
    const MaterialPage(child: SecondPage()),
    const MaterialPage(child: NestedSecondPage())
  ];

  @override
  void addListener(VoidCallback listener) {}

  @override
  Widget build(BuildContext context) {
    List<Page> stack;

    if (isFirstPage) {
      stack = _firstStack;
    } else if (isNestedFirstPage) {
      stack = _nestedFirstStack;
    } else if (isSecondPage) {
      stack = _secondStack;
    } else if (isNestedSecondPage) {
      stack = _nestedSecondStack;
    } else {
      stack = _homeStack;
    }

    return Navigator(
      key: navigatorKey,
      pages: stack,
    );
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  /// in order to get response at [RouteInformation], update the browser's address bar
  /// and browser backward and forward button to work
  @override
  AppRouteConfig? get currentConfiguration {
    if (isFirstPage) {
      return AppRouteConfig.firstPage();
    } else if (isNestedFirstPage) {
      return AppRouteConfig.nestedFirstPage();
    } else if (isSecondPage) {
      return AppRouteConfig.secondPage();
    } else if (isNestedSecondPage) {
      return AppRouteConfig.nestedSecondPage();
    }

    return AppRouteConfig.homePage();
  }

  /// to utilize the [RouteInformationParser], need to override [setNewRoutePath]
  @override
  // TODO: implement setNewRoutePath
  Future<void> setNewRoutePath(AppRouteConfig configuration) async {
    if(configuration.isFirstPage) {
      isFirstPage = true;
    } else if(configuration.isNestedFirstPage){
      isNestedFirstPage = true;
    } else if(configuration.isSecondPage) {
      isSecondPage = true;
    } else if(configuration.isNestedSecondPage){
      isNestedSecondPage = true;
    } else {
      isHomePage = true;
    }
  }

  /// [navigatorKey] override from [PopNavigatorRouterDelegateMixin]
  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
