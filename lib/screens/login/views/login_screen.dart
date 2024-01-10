// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/app_button.dart';
import 'package:rp_checkin/components/app_form_field.dart';
import 'package:rp_checkin/components/g_image.dart';
import 'package:rp_checkin/components/radio_button.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/helpers/dialog_helper.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final _emailTxtController = TextEditingController();
  final _passTxtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _count = 0;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _emailTxtController.text = 'stage';
      _passTxtController.text = 'a12345678';
    }
  }

  _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    final data = {
      'password': _passTxtController.text,
      'role': "TenantAdmin",
      'username': _emailTxtController.text,
    };

    final res = await injector.get<ApiClient>().login(data);

    if (res == null) {
      return;
    }
    if (res.messageKey == 'IncorrectUsernameOrPassword') {
      setState(() {
        _isLoading = false;
      });
      DialogHelper.showOkDialog(context, 'Incorrect username or password!');
      return;
    }

    injector
        .get<SharedManager>()
        .setString(SharedKey.accessToken.name, res.data!.accessToken!);
    injector
        .get<SharedManager>()
        .setString(SharedKey.tenantId.name, res.data!.tenantId!);
    injector
        .get<SharedManager>()
        .setString(SharedKey.refreshToken.name, res.data!.refreshToken!);
    _getBusinessInfo();
  }

  _getBusinessInfo() async {
    final res = await injector.get<ApiClient>().getBusinessInfo();
    setState(() {
      _isLoading = false;
    });
    if (res != null && res.data != null) {
      injector
          .get<SharedManager>()
          .setString(SharedKey.businessName.name, res.data!.businessName!);
      injector
          .get<SharedManager>()
          .setString(SharedKey.timezone.name, res.data!.timezone!);
      Navigator.of(context).pushNamed(RouteNames.fillPhone);
    }
  }

  _showBottomSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: const Text('Choose Environment'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          isDestructiveAction: true,
          child: const Text('Cancel'),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              injector
                  .get<SharedManager>()
                  .setString(SharedKey.env.name, 'PROD');
              DependencyInjection.setupDio();
              Navigator.of(context).pop();
            },
            child: const Text(
              'PROD',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              injector
                  .get<SharedManager>()
                  .setString(SharedKey.env.name, 'STAG');
              DependencyInjection.setupDio();
              Navigator.of(context).pop();
            },
            child: const Text(
              'STAG',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              injector
                  .get<SharedManager>()
                  .setString(SharedKey.env.name, 'DEV');
              DependencyInjection.setupDio();
              Navigator.of(context).pop();
            },
            child: const Text(
              'DEV',
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BaseScreen(
        body: Row(
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
                        child: Visibility(
                          visible: false,
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
                      InkWell(
                        onTap: () {
                          _count++;
                          if (_count == 7) {
                            _showBottomSheet();
                            _count = 0;
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyleConstant.publicSansW600(fontSize: 32),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Enter your username and password to login',
                        style: TextStyleConstant.publicSansW400(
                          fontSize: 16,
                          color: ColorConstant.grey637281,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 7,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppFormField(
                              labelText: 'Email or Username (*)',
                              controller: _emailTxtController,
                              validator: (v) {
                                if (v == null || v == '') {
                                  return 'Please fill username!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            AppFormField(
                              labelText: 'Password (*)',
                              obscureText: true,
                              controller: _passTxtController,
                              validator: (v) {
                                if (v == null || v == '') {
                                  return 'Please fill password!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            AppButton(
                              isLoading: _isLoading,
                              onTap: _login,
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
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
