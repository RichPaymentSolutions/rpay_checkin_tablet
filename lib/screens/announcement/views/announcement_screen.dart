import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 57),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 54,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorConstant.grayECEEF5,
            boxShadow: [
              BoxShadow(
                offset: const Offset(6, 6),
                blurRadius: 36,
                color: Colors.black.withOpacity(0.06),
              ),
              const BoxShadow(
                offset: Offset(-4, -4),
                blurRadius: 13,
                color: Colors.white,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('ic_arrow_left'.iconSvg),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Back',
                style: TextStyleConstant.livvicW500(
                  fontSize: 24,
                  color: ColorConstant.grey637381,
                ),
              )
            ],
          ),
        ),
        GImage.asset(
          name: 'rich_logo'.imgPNG,
          width: 150,
          height: 75,
        ),
        Container(
          height: 54,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorConstant.primary,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 16,
                color: ColorConstant.primary03228F.withOpacity(0.24),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('ic_arrow_right'.iconSvg),
              const SizedBox(
                width: 10,
              ),
              Text(
                'OK',
                style: TextStyleConstant.livvicW500(
                  fontSize: 24,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
