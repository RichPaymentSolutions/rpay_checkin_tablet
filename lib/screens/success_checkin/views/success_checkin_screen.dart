import 'dart:async';

import 'package:confetti/confetti.dart';
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
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Future.delayed(const Duration(milliseconds: 500), () {
    //     _controllerCenter.play();
    //   });
    // });
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.fillPhone, (route) => false);
      },
    );
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
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
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                numberOfParticles: 70,
                shouldLoop:
                    true, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
                // createParticlePath: drawStar, // define a custom shape/path.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
