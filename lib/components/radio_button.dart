import 'package:flutter/material.dart';
import 'package:rp_checkin/theme/color_constant.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
  });
  final String value;
  final String? groupValue;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: ColorConstant.grey7a.withOpacity(0.6),
        ),
        child: Radio(
          value: value,
          groupValue: groupValue,
          activeColor: ColorConstant.primary,
          onChanged: (val) => onChanged?.call(value),
        ));
  }
}
