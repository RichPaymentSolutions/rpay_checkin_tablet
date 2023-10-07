import 'package:flutter/material.dart';
import 'package:rp_checkin_app/components/g_image.dart';
import 'package:rp_checkin_app/components/radio_button.dart';
import 'package:rp_checkin_app/extensions/string_ext.dart';
import 'package:rp_checkin_app/theme/color_constant.dart';
import 'package:rp_checkin_app/theme/text_style_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GImage.asset(name: 'login_bg'.imgPNG),
          ),
          Positioned(
            top: 24,
            left: 40,
            child: GImage.asset(
              name: 'rich_logo'.imgPNG,
              width: 150,
              height: 75,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 53,
                    left: 24,
                    right: 24,
                    top: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      GImage.asset(
                        name: 'checkin'.imgPNG,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Row(
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
                                color: ColorConstant.grey637381,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
