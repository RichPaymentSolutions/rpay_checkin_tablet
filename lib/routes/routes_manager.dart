import 'package:flutter/material.dart';
import 'package:rp_checkin/screens/fill_phone/views/fill_phone_screen.dart';
import 'package:rp_checkin/screens/login/views/login_screen.dart';

class RoutesManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Widget screen = Container();
    switch (settings.name) {
      case RouteNames.login:
        screen = const LoginScreen();
        break;
      case RouteNames.fillPhone:
        screen = const FillPhoneScreen();
        break;
    }
    return MaterialPageRoute(builder: (_) => screen);
  }
}

class RouteNames {
  static const login = '/login';
  static const fillPhone = '/fill_phone';
}
