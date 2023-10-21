import 'package:flutter/material.dart';
import 'package:rp_checkin/theme/color_constant.dart';

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorConstant.primary,
      ),
    );
  }
}
