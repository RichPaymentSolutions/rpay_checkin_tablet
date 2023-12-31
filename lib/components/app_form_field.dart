import 'package:flutter/material.dart';
import 'package:rp_checkin_app/theme/color_constant.dart';
import 'package:rp_checkin_app/theme/text_style_constant.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    this.hint,
    this.suffixIcon,
    this.labelText,
    this.border,
    this.validator,
    this.fillColor,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.prefixIcon,
    this.maxLines = 1,
    this.contentPadding,
    this.onChanged,
    this.onFieldSubmitted,
  });
  final int? maxLines;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final InputBorder? border;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyleConstant.livvicW400(
        fontSize: 16,
        color: ColorConstant.heading,
      ),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? Colors.white,
        filled: true,
        labelText: labelText,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
            const EdgeInsets.only(top: 16, bottom: 16, left: 16),
        labelStyle: TextStyleConstant.publicSansW400(
          fontSize: 12,
          color: ColorConstant.grey7a,
        ),
        hintStyle: TextStyleConstant.publicSansW400(
          fontSize: 12,
          color: ColorConstant.grey7a,
        ),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorConstant.grey919EAB.withOpacity(0.24),
              ),
            ),
        focusedBorder: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorConstant.primary,
              ),
            ),
        enabledBorder: border ??
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorConstant.grey919EAB.withOpacity(0.24),
              ),
            ),
      ),
    );
  }
}
