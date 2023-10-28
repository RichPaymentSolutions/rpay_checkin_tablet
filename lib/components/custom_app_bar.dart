import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onNext,
    this.title,
    this.isDisable = false,
    this.isHideNext = false,
  });
  final Function()? onNext;
  final String? title;
  final bool isDisable;
  final bool isHideNext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: Navigator.of(context).pop,
            child: Container(
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
                      color: ColorConstant.grey637281,
                    ),
                  )
                ],
              ),
            ),
          ),
          title != null
              ? Text(
                  title!,
                  style: TextStyleConstant.publicSansW600(
                    fontSize: 32,
                  ),
                )
              : GImage.asset(
                  name: 'rich_logo'.imgPNG,
                  width: 150,
                  height: 75,
                ),
          isHideNext
              ? Container(
                  width: 160,
                )
              : InkWell(
                  onTap: isDisable ? null : onNext,
                  child: Container(
                    height: 54,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: isDisable
                          ? ColorConstant.grey919EAB
                          : ColorConstant.primary,
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
                ),
        ],
      ),
    );
  }
}
