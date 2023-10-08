import 'package:flutter/material.dart';
import 'package:rp_checkin_app/theme/color_constant.dart';
import 'package:rp_checkin_app/theme/text_style_constant.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.onTap,
      this.hideBorder = false,
      this.radius,
      this.isLoading = false,
      this.titleStyle,
      this.borderColor,
      this.disable = false,
      this.titleText,
      this.title});
  final double? height;
  final double? width;
  final Color? color;

  final Function()? onTap;
  final bool hideBorder;
  final double? radius;
  final TextStyle? titleStyle;
  final bool isLoading;
  final Color? borderColor;
  final bool disable;
  final Widget? title;
  final String? titleText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || disable ? null : onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 16,
              color: ColorConstant.blue0D72E3.withOpacity(0.24),
            )
          ],
          color:
              (color ?? ColorConstant.primary).withOpacity(disable ? 0.6 : 1),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 8.0),
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : title ??
                  Text(
                    titleText ?? '',
                    style: titleStyle ??
                        TextStyleConstant.livvicW600(fontSize: 18),
                  ),
        ),
      ),
    );
  }
}
