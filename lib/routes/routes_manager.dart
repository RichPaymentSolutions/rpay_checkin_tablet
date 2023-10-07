import 'package:flutter/material.dart';
import 'package:rp_checkin_app/screens/login/views/login_screen.dart';

class RoutesManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Widget screen = Container();
    switch (settings.name) {
      case RouteNames.login:
        screen = const LoginScreen();
    }
    return MaterialPageRoute(builder: (_) => screen);
  }
}

class RouteNames {
  static const login = '/login';
}
