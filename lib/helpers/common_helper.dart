import 'package:flutter/material.dart';
import 'package:rp_checkin/components/app_progress_indicator.dart';

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
}