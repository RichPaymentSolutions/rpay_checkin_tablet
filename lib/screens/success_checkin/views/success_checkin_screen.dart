import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class SuccessCheckinScreen extends StatefulWidget {
  const SuccessCheckinScreen({super.key});

  @override
  State<SuccessCheckinScreen> createState() => _SuccessCheckinScreenState();
}

class _SuccessCheckinScreenState extends State<SuccessCheckinScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.fillPhone, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GImage.asset(
            name: 'success_checkin'.imgPNG,
            width: 342,
            height: 330,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Text(
            'Check in Successful !',
            style: TextStyleConstant.livvicW500(
              fontSize: 45,
              color: ColorConstant.green009747,
            ),
          )
        ],
      ),
    );
  }
}
