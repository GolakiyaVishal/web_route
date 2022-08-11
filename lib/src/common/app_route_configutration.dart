/// app route configuration

class AppRouteConfig {
  final bool _isFirstPage;
  final bool _isNestedFirstPage;
  final bool _isSecondPage;
  final bool _isNestedSecondPage;

  AppRouteConfig.homePage()
      : _isFirstPage = false,
        _isNestedFirstPage = false,
        _isSecondPage = false,
        _isNestedSecondPage = false;

  AppRouteConfig.firstPage()
      : _isFirstPage = true,
        _isNestedFirstPage = false,
        _isSecondPage = false,
        _isNestedSecondPage = false;

  AppRouteConfig.nestedFirstPage()
      : _isFirstPage = true,
        _isNestedFirstPage = true,
        _isSecondPage = false,
        _isNestedSecondPage = false;

  AppRouteConfig.secondPage()
      : _isFirstPage = false,
        _isNestedFirstPage = false,
        _isSecondPage = true,
        _isNestedSecondPage = false;

  AppRouteConfig.nestedSecondPage()
      : _isFirstPage = false,
        _isNestedFirstPage = false,
        _isSecondPage = true,
        _isNestedSecondPage = true;

  bool get isHomePage => !_isFirstPage && !_isNestedFirstPage;

  bool get isFirstPage =>
      _isFirstPage &&
      !_isNestedFirstPage &&
      !_isSecondPage &&
      !_isNestedSecondPage;

  bool get isNestedFirstPage =>
      _isFirstPage &&
      _isNestedFirstPage &&
      !_isSecondPage &&
      !_isNestedSecondPage;

  bool get isSecondPage =>
      _isSecondPage &&
      !_isNestedSecondPage &&
      !_isFirstPage &&
      !_isNestedFirstPage;

  bool get isNestedSecondPage =>
      _isSecondPage &&
      _isNestedSecondPage &&
      !_isFirstPage &&
      !_isNestedFirstPage;
}
