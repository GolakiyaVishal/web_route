import 'package:flutter/material.dart';
import 'package:web_route/src/common/app_route_configutration.dart';

enum PageName {
  homePage,
  firstPage,
  nestedFirstPage,
  secondPage,
  nestedSecondPage
}

/// reference from VelocityX
class CustomRouteInformation extends RouteInformationParser<AppRouteConfig> {

  /// [parseRouteInformation]
  /// OS to router widget
  /// generate configuration from RouteInformation that provided by the default
  /// RouteInformationProvider delegate
  ///
  @override
  Future<AppRouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (1 == uri.pathSegments.length) {
      final p0 = uri.pathSegments[0];
      if (PageName.firstPage.name == p0) {
        return AppRouteConfig.firstPage();
      } else if (PageName.secondPage.name == p0) {
        return AppRouteConfig.firstPage();
      }
    } else if (2 == uri.pathSegments.length) {
      final p0 = uri.pathSegments[0];
      final p1 = uri.pathSegments[1];
      if (PageName.firstPage.name == p0 && PageName.nestedFirstPage.name == p1) {
        return AppRouteConfig.nestedFirstPage();
      } else if(PageName.secondPage.name == p0 && PageName.nestedSecondPage.name == p1){
        return AppRouteConfig.nestedSecondPage();
      }
    }
    return AppRouteConfig.homePage();
  }

  /// Router widget to OS
  ///
  @override
  RouteInformation restoreRouteInformation(AppRouteConfig configuration) {
    if(configuration.isHomePage){
      return const RouteInformation(location: '/');
    } else if(configuration.isFirstPage){
      return RouteInformation(location: '/${PageName.firstPage.name}');
    } else if(configuration.isNestedFirstPage){
      return RouteInformation(location: '/${PageName.nestedFirstPage.name}');
    } else if(configuration.isSecondPage) {
      return RouteInformation(location: '/${PageName.secondPage.name}');
    } else if(configuration.isNestedSecondPage) {
      return RouteInformation(location: '/${PageName.nestedSecondPage.name}');
    } else {
      return const RouteInformation(location: '/');
    }
  }
}
