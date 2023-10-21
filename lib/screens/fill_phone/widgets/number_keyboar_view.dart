import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class NumberKeyboardView extends StatefulWidget {
  const NumberKeyboardView({
    super.key,
    this.onNext,
  });
  final Function(String)? onNext;
  @override
  State<NumberKeyboardView> createState() => _NumberKeyboardViewState();
}

class _NumberKeyboardViewState extends State<NumberKeyboardView> {
  final _keyboard = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'x',
    '0',
    'v',
  ];
  String _num = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _num == ''
              ? 'Please enter your phone number to continue.'
              : _num.format(),
          style: _num == ''
              ? TextStyleConstant.livvicW400(
                  fontSize: 16,
                  color: ColorConstant.grey637281,
                )
              : TextStyleConstant.livvicW600(
                  fontSize: 32,
                  color: ColorConstant.primary,
                ),
        ),
        const SizedBox(
          height: 43,
        ),
        SizedBox(
          width: 348,
          // height: 472,
          // color: Colors.red,
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: _keyboard.map((e) => _buildNumView(e)).toList(),
          ),
        )
      ],
    );
  }

  Widget _buildNumView(String title) {
    Widget child = Container();
    Color borderColor = ColorConstant.primary;
    if (title == 'x') {
      child = SvgPicture.asset('ic_delete'.iconSvg);
      borderColor = ColorConstant.error;
    } else if (title == 'v') {
      child = SvgPicture.asset(
        'ic_next'.iconSvg,
        color: _num.length < 10 ? ColorConstant.grey919EAB : null,
      );
      borderColor = _num.length < 10
          ? ColorConstant.grey919EAB
          : ColorConstant.green84C81B;
    } else {
      child = Text(
        title,
        style: TextStyleConstant.publicSansW700(
          fontSize: 27,
          color: ColorConstant.primary,
        ),
      );
    }

    return InkWell(
      onTap: () => _handleClick(title),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }

  _handleClick(String title) {
    if (title == 'x') {
      if (_num != '') {
        _num = _num.substring(0, _num.length - 1);
      }
    } else if (title == 'v') {
      if (_num.length != 10) {
        return;
      }
      widget.onNext?.call(_num);
    } else {
      if (_num.length == 10) {
        return;
      }
      _num += title;
    }
    setState(() {});
  }
}

extension NumberTextExt on String {
  String format() {
    if (length <= 3) {
      return '+1 ($this)';
    }
    if (length <= 6) {
      return '+1 (${substring(0, 3)}) ${substring(3, length)}';
    }
    return '+1 (${substring(0, 3)}) ${substring(3, 6)} - ${substring(6, length)}';
  }
}
