import 'package:flutter/material.dart';
import 'package:rp_checkin/components/app_progress_indicator.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'package:timezone/standalone.dart' as tz;

class CommonHelper {
  static BuildContext? _loadingContext;
  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        _loadingContext = _;
        return const AppLoadingIndicator();
      },
    );
  }

  static hideLoading() {
    if (_loadingContext != null) {
      Navigator.of(_loadingContext!).pop();
    }
  }

  static bool emailIsValid(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static DateTime getTheEndInDay(
    DateTime date, {
    bool isToTimeZone = false,
  }) {
    var detroit = tz.getLocation(
        injector.get<SharedManager>().getString(SharedKey.timezone.name) ?? '');
    final l = tz.TZDateTime.from(date, detroit);
    if (isToTimeZone) {
      date = l;
    }
    return DateTime(date.year, date.month, date.day, 23, 59);
  }

  static DateTime getBeginInDay(
    DateTime date, {
    bool isToTimeZone = false,
  }) {
    var detroit = tz.getLocation(
        injector.get<SharedManager>().getString(SharedKey.timezone.name) ?? '');
    final l = tz.TZDateTime.from(date, detroit);
    if (isToTimeZone) {
      date = l;
    }
    return DateTime(date.year, date.month, date.day);
  }

  static Tuple<int, int> getStartEndDate() {
    var detroit = tz.getLocation(
        injector.get<SharedManager>().getString(SharedKey.timezone.name) ?? '');
    final l = tz.TZDateTime.from(DateTime.now(), detroit);

    var startDay = getBeginInDay(l);

    var endDay = getTheEndInDay(l);
    // if (DateTime.now().timeZoneOffset.inHours > 0) {
    //   startDay =
    //       startDay.add(Duration(hours: DateTime.now().timeZoneOffset.inHours));
    //   endDay =
    //       endDay.add(Duration(hours: DateTime.now().timeZoneOffset.inHours));
    // } else {
    //   startDay = startDay
    //       .subtract(Duration(hours: DateTime.now().timeZoneOffset.inHours));
    //   endDay = endDay
    //       .subtract(Duration(hours: DateTime.now().timeZoneOffset.inHours));
    // }
    return Tuple(
      startDay.millisecondsSinceEpoch ~/ 1000,
      endDay.millisecondsSinceEpoch ~/ 1000,
    );
  }
}

class Tuple<T1, T2> {
  /// Returns the first item of the tuple
  final T1 item1;

  /// Returns the second item of the tuple
  final T2 item2;

  /// Creates a new tuple value with the specified items.
  const Tuple(this.item1, this.item2);
}

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
