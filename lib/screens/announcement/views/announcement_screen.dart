import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              onNext: () =>
                  Navigator.of(context).pushNamed(RouteNames.fillName),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 57),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.only(
                    top: 43,
                    left: 50,
                    right: 50,
                    bottom: 50,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(
                      color: ColorConstant.grey919EAB.withOpacity(0.24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: ColorConstant.grey919EAB.withOpacity(0.2),
                      ),
                      BoxShadow(
                        offset: const Offset(0, 12),
                        blurRadius: 24,
                        spreadRadius: -4,
                        color: ColorConstant.grey919EAB.withOpacity(0.12),
                      )
                    ],
                  ),
                  child: Text(
                    'asasas',
                    style: TextStyleConstant.livvicW400(
                      fontSize: 20,
                      color: ColorConstant.heading,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
