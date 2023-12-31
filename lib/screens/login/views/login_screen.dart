import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin_app/components/app_button.dart';
import 'package:rp_checkin_app/components/app_form_field.dart';
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 53,
                        left: 24,
                        right: 24,
                        top: 24,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                            GImage.asset(
                              name: 'checkin'.imgPNG,
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
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
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                          ),
                          Text(
                            'Login',
                            style:
                                TextStyleConstant.publicSansW600(fontSize: 32),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Enter your username and password to login',
                            style: TextStyleConstant.publicSansW400(
                              fontSize: 16,
                              color: ColorConstant.grey637381,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppFormField(
                                labelText: 'Email or Username (*)',
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              AppFormField(
                                labelText: 'Password (*)',
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              AppButton(
                                height: 54,
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Signin',
                                      style: TextStyleConstant.livvicW600(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SvgPicture.asset('ic_login'.iconSvg),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
