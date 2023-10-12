import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/components/radio_button.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/screens/fill_phone/widgets/number_keyboar_view.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class FillPhoneScreen extends StatefulWidget {
  const FillPhoneScreen({super.key});

  @override
  State<FillPhoneScreen> createState() => _FillPhoneScreenState();
}

class _FillPhoneScreenState extends State<FillPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    // bottom: 53,
                    left: 40,
                    right: 24,
                    top: 24,
                    bottom: 53,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GImage.asset(
                          name: 'rich_logo'.imgPNG,
                          width: 150,
                          height: 75,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: GImage.asset(
                            name: 'checkin'.imgPNG,
                            width: MediaQuery.of(context).size.width / 3,
                            // height: MediaQuery.of(context).size.height / 3,
                            // boxFit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioButton(
                              value: '',
                            ),
                            Expanded(
                              child: Text(
                                'By checking this box and clicking OK, I agree to receive RichPOS as well as "Business name" notifications via auto text! Unsubscribe anytime and still participate in RichPOS',
                                style: TextStyleConstant.livvicW500(
                                  fontSize: 16,
                                  color: ColorConstant.grey637281,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.only(
                  left: 27,
                  right: 27,
                ),
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: ColorConstant.grey919EAB.withOpacity(0.2),
                    ),
                    BoxShadow(
                      offset: const Offset(0, 12),
                      blurRadius: 24,
                      spreadRadius: -4,
                      color: ColorConstant.grey919EAB.withOpacity(0.2),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Business name',
                            style:
                                TextStyleConstant.publicSansW600(fontSize: 32),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          NumberKeyboardView(),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 24,
                      right: 0,
                      child: Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              color: ColorConstant.grey919EAB.withOpacity(0.43),
                            )
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset('ic_logout'.iconSvg),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
