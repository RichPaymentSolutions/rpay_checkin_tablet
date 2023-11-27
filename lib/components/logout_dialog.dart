import 'package:flutter/material.dart';
import 'package:rp_checkin/components/app_button.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 370,
          width: 600,
          padding: const EdgeInsets.only(top: 15, bottom: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              GImage.asset(
                name: 'logout'.imgPNG,
                width: 306,
                height: 176,
              ),
              Expanded(
                child: Text(
                  'Are you sure want to log out ?',
                  style: TextStyleConstant.publicSansW500(fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    onTap: Navigator.of(context).pop,
                    width: 200,
                    height: 54,
                    color: Colors.white,
                    borderColor: ColorConstant.primary,
                    hideShadow: true,
                    title: Text(
                      'No',
                      style: TextStyleConstant.publicSansW700(
                        fontSize: 18,
                        color: ColorConstant.primary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  AppButton(
                    height: 54,
                    width: 200,
                    onTap: () {
                      injector.get<SharedManager>().clear();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteNames.login,
                        (route) => false,
                      );
                    },
                    title: Text(
                      'Yes',
                      style: TextStyleConstant.publicSansW700(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
