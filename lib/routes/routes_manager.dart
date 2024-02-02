import 'package:flutter/material.dart';
import 'package:rp_checkin/screens/announcement/views/announcement_screen.dart';
import 'package:rp_checkin/screens/choose_service/views/choose_service_screen.dart';
import 'package:rp_checkin/screens/fill_birthday/views/fill_birthday_screen.dart';
import 'package:rp_checkin/screens/fill_name/views/fill_name_screen.dart';
import 'package:rp_checkin/screens/fill_phone/views/fill_phone_screen.dart';
import 'package:rp_checkin/screens/list_staff/views/list_staff_screen.dart';
import 'package:rp_checkin/screens/login/views/login_screen.dart';
import 'package:rp_checkin/screens/success_checkin/views/success_checkin_screen.dart';

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
      case RouteNames.announcement:
        screen = const AnnouncementScreen();
        break;
      case RouteNames.fillName:
        screen = FillNameScreen(
          isEmail: settings.arguments != null ? true : false,
        );
        break;
      case RouteNames.fillBirthday:
        screen = const FillBirthdayScreen();
        break;
      case RouteNames.chooseService:
        screen = const ChooseServiceScreen();
        break;
      case RouteNames.chooseStaff:
        screen = const ListStaffsScreen();
        break;
      case RouteNames.successCheckin:
        double? points;
        if (settings.arguments != null) {
          points = settings.arguments as double;
        }
        screen = SuccessCheckinScreen(
          point: points,
        );
        break;
    }
    return MaterialPageRoute(builder: (_) => screen);
  }
}

class RouteNames {
  static const login = '/login';
  static const fillPhone = '/fill_phone';
  static const announcement = '/announcement';
  static const fillName = '/fill_name';
  static const fillBirthday = '/fill_birthday';
  static const chooseService = '/choose_service';
  static const chooseStaff = '/choose_staff';
  static const successCheckin = '/success_checkin';
}
