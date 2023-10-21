import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rp_checkin/theme/color_constant.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: const Center(
        child: SizedBox(
          height: 60,
          child: LoadingIndicator(
            indicatorType: Indicator.ballBeat,
            colors: _kDefaultRainbowColors,
            strokeWidth: 5.0,
            pathBackgroundColor: null,
          ),
        ),
      ),
    );
  }
}

const List<Color> _kDefaultRainbowColors = const [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];
