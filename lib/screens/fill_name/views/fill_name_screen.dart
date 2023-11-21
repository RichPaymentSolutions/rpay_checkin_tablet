import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/app_form_field.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
import 'package:rp_checkin/helpers/common_helper.dart';
import 'package:rp_checkin/models/customer/customer_model.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/screens/app/app_provider.dart';
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
  final _txtController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  bool _isValidEmail = true;
  final _formatList = [
    '@gmail.com',
    '@hotgmail.com',
    '@icloud.com',
    '@aol.com',
  ];
  @override
  void initState() {
    super.initState();
    if (widget.isEmail) {
      _isValidEmail = false;
    }
  }

  _onNext() {
    if (widget.isEmail) {
      if (widget.isEmail && !_isValidEmail) {
        return;
      }
      context.read<AppProvider>().customer?.email = _txtController.text;
    } else {
      context.read<AppProvider>().customer?.lastName = _lastNameController.text;
      context.read<AppProvider>().customer?.firstName =
          _firstNameController.text;
    }

    Navigator.of(context).pushNamed(
        widget.isEmail ? RouteNames.chooseStaff : RouteNames.fillBirthday);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BaseScreen(
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: widget.isEmail
                    ? 'what’s your best email ?'
                    : 'Please enter your name',
                onNext: _onNext,
                isDisable: widget.isEmail
                    ? !_isValidEmail
                    : (_firstNameController.text.isEmpty ||
                        _lastNameController.text.isEmpty),
              ),
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: widget.isEmail
                    ? AppFormField(
                        controller: _txtController,
                        autoFocus: true,
                        onChanged: (v) {
                          if (widget.isEmail) {
                            setState(() {
                              _isValidEmail = CommonHelper.emailIsValid(v);
                            });
                            return;
                          }
                          setState(() {});
                        },
                        fillColor: Colors.transparent,
                        textstyle: TextStyleConstant.livvicW500(
                            fontSize: 32, color: ColorConstant.primary),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstant.primary,
                          ),
                        ),
                      )
                    : _buildFullNameView(),
              ),
              const SizedBox(
                height: 50,
              ),
              if (widget.isEmail)
                SizedBox(
                  height: 54,
                  child: ListView.builder(
                    itemCount: _formatList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          if (_txtController.text.isEmpty) {
                            _txtController.text = _formatList[index];
                            setState(() {
                              _isValidEmail = true;
                            });
                            return;
                          }
                          final l = _txtController.text.split('@');
                          _txtController.text = l.first + _formatList[index];
                          setState(() {
                            _isValidEmail = true;
                          });
                        },
                        child: Container(
                          height: 54,
                          width: 203,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(27),
                            border: Border.all(
                              color: ColorConstant.grey919EAB.withOpacity(0.24),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _formatList[index],
                              style: TextStyleConstant.livvicW400(
                                  fontSize: 24,
                                  color: ColorConstant.gray707585),
                            ),
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
    );
  }

  Widget _buildFullNameView() {
    return Row(
      children: [
        Expanded(
          child: AppFormField(
            hint: 'Fist name',
            controller: _firstNameController,
            fillColor: Colors.transparent,
            textstyle: TextStyleConstant.livvicW500(
                fontSize: 32, color: ColorConstant.primary),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstant.primary,
              ),
            ),
            onChanged: (v) {
              setState(() {});
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: AppFormField(
            hint: 'Last name',
            controller: _lastNameController,
            fillColor: Colors.transparent,
            textstyle: TextStyleConstant.livvicW500(
                fontSize: 32, color: ColorConstant.primary),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstant.primary,
              ),
            ),
            onChanged: (v) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
