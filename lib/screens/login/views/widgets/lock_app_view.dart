import 'package:flutter/material.dart';
import 'package:rp_checkin/components/app_button.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/helpers/common_helper.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class LockAppView extends StatelessWidget {
  const LockAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trial Expired',
                        style: TextStyleConstant.livvicW600(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'You are no longer on a free trial. Help your business grow with 24/7 availability and calendar management through Clover',
                        style: TextStyleConstant.livvicW500(
                            fontSize: 24, color: ColorConstant.grey7a),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AppButton(
                        onTap: CommonHelper.launchCaller,
                        height: 50,
                        width: 200,
                        title: Text(
                          'Phone',
                          style: TextStyleConstant.livvicW500(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: GImage.asset(
                    name: 'call_center'.imgJPG,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
