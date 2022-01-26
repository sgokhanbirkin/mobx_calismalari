import 'package:flutter/Material.dart';
import 'package:mobx_calismasi/core/init/navigation/INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // ignore: prefer_function_declarations_over_variables
  final removeOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(String path, Object object) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: object);
  }

  @override
  Future<void> navigateToPageClear(String path, Object object) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, removeOldRoutes, arguments: object);
  }
}
