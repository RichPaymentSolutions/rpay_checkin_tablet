import 'package:flutter/material.dart';
import 'package:rp_checkin/components/app_progress_indicator.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

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
    DateTime date,
  ) {
    var detroit = tz.getLocation(
        injector.get<SharedManager>().getString(SharedKey.timezone.name) ?? '');
    var l = tz.TZDateTime.now(detroit);

    return tz.TZDateTime(detroit, l.year, l.month, l.day, 23, 59, 59);
  }

  static DateTime getBeginInDay(DateTime date) {
    var detroit = tz.getLocation(
        injector.get<SharedManager>().getString(SharedKey.timezone.name) ?? '');
    var l = tz.TZDateTime.now(detroit);

    return tz.TZDateTime(detroit, l.year, l.month, l.day);
  }

  static Tuple<int, int> getStartEndDate() {
    var startDay = getBeginInDay(DateTime.now());

    var endDay = getTheEndInDay(DateTime.now());

    return Tuple(
      startDay.millisecondsSinceEpoch,
      endDay.millisecondsSinceEpoch,
    );
  }

  static launchCaller() async {
    Uri url = Uri(scheme: "tel", path: '17754387424');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
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
