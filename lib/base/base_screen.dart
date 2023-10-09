import 'package:flutter/material.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/extensions/string_ext.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.body,
  });
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GImage.asset(name: 'login_bg'.imgPNG),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            child: body,
          ),
        ],
      ),
    );
  }
}
