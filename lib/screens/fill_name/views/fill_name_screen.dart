import 'package:flutter/material.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/app_form_field.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class FillNameScreen extends StatefulWidget {
  const FillNameScreen({
    super.key,
    this.isEmail = false,
  });
  final bool isEmail;
  @override
  State<FillNameScreen> createState() => _FillNameScreenState();
}

class _FillNameScreenState extends State<FillNameScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: widget.isEmail
                  ? 'what’s your best email ?'
                  : 'Please enter your name',
              onNext: () => Navigator.of(context).pushNamed(widget.isEmail
                  ? RouteNames.chooseService
                  : RouteNames.fillBirthday),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: AppFormField(
                fillColor: Colors.transparent,
                textstyle: TextStyleConstant.livvicW500(
                    fontSize: 32, color: ColorConstant.primary),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstant.primary,
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
