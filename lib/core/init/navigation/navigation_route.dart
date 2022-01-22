import 'package:flutter/material.dart';
import 'package:mobx_calismasi/core/components/button/not_found_navigation_widget.dart';
import 'package:mobx_calismasi/core/constants/navigation_constants.dart/NavigationConstants.dart';
import 'package:mobx_calismasi/features/authenticate/test/view/text_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestsView());
      default:
        return MaterialPageRoute(
            builder: (context) => const NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
