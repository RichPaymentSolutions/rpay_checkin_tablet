import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/app_form_field.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class ChooseServiceScreen extends StatefulWidget {
  const ChooseServiceScreen({super.key});

  @override
  State<ChooseServiceScreen> createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Please Choose Your Service',
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 57,
                  right: 57,
                ),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstant.grey919EAB.withOpacity(0.24),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: ColorConstant.grey919EAB.withOpacity(0.2),
                    ),
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 24,
                      spreadRadius: -4,
                      color: ColorConstant.grey919EAB.withOpacity(0.12),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        margin: const EdgeInsets.only(bottom: 27),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 12),
                              blurRadius: 24,
                              color: ColorConstant.grey919EAB.withOpacity(0.1),
                            ),
                            BoxShadow(
                              blurRadius: 2,
                              color: ColorConstant.grey919EAB.withOpacity(0.16),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose categories',
                              style: TextStyleConstant.livvicW600(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 50),
                                itemBuilder: (_, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(24),
                                    margin: const EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: ColorConstant.primary),
                                    ),
                                    child: Text(
                                      '1212',
                                      style: TextStyleConstant.publicSansW400(
                                        fontSize: 20,
                                        color: ColorConstant.heading,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Container(
                            height: 82,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 13,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 12),
                                  blurRadius: 24,
                                  color:
                                      ColorConstant.grey919EAB.withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 2,
                                  color: ColorConstant.grey919EAB
                                      .withOpacity(0.16),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'Choose Service',
                                    style: TextStyleConstant.livvicW600(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: AppFormField(
                                    hint: 'Search categories or services...',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child:
                                          SvgPicture.asset('ic_search'.iconSvg),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: ColorConstant.grey919EAB
                                            .withOpacity(0.24),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(24),
                              itemBuilder: (_, index) {
                                return Container(
                                  height: 230,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 12),
                                        blurRadius: 24,
                                        color: ColorConstant.grey919EAB
                                            .withOpacity(0.1),
                                      ),
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: ColorConstant.grey919EAB
                                            .withOpacity(0.16),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
