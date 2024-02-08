import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/app_button.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/screens/app/app_provider.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class FillBirthdayScreen extends StatefulWidget {
  const FillBirthdayScreen({super.key});

  @override
  State<FillBirthdayScreen> createState() => _FillBirthdayScreenState();
}

class _FillBirthdayScreenState extends State<FillBirthdayScreen> {
  final List<String> _months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec',
  ];
  int _selectedMonth = 0;
  int _selectedDay = 0;
  int _selectedYear = 0;
  _onNext() {
    context.read<AppProvider>().customer?.birthday =
        '${(_selectedMonth + 1).toString().padLeft(2, "0")}-${(_selectedDay + 1).toString().padLeft(2, "0")}-${_selectedYear + 1930}';
    Navigator.of(context).pushNamed(RouteNames.fillName, arguments: true);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'What’s your birthday?',
              onNext: _onNext,
            ),
            Expanded(
              child: _buildPickerView(context),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: AppButton(
                onTap: () => Navigator.of(context)
                    .pushNamed(RouteNames.fillName, arguments: true),
                width: 260,
                height: 54,
                titleText: 'Skip',
                color: Colors.transparent,
                titleStyle: TextStyleConstant.livvicW500(
                  color: ColorConstant.grey637281,
                  fontSize: 24,
                ),
                hideShadow: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPickerView(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        children: [
          Expanded(
            child: _buildCupertinoPicker(
              List<Widget>.generate(
                _months.length,
                (int index) {
                  return Center(
                    child: Text(
                      _months[index],
                      style: TextStyleConstant.livvicW400(
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
              initialItem: _selectedMonth,
              onChanged: (v) {
                setState(() {
                  _selectedMonth = v;
                });
              },
            ),
          ),
          const SizedBox(
            width: 88,
          ),
          Expanded(
            child: _buildCupertinoPicker(
              List<Widget>.generate(
                31,
                (int index) {
                  return Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyleConstant.livvicW400(
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
              initialItem: _selectedDay,
              onChanged: (v) {
                setState(() {
                  _selectedDay = v;
                });
              },
            ),
          ),
          Expanded(
            child: _buildCupertinoPicker(
              List<Widget>.generate(
                100,
                (int index) {
                  return Center(
                    child: Text(
                      (1930 + index).toString(),
                      style: TextStyleConstant.livvicW400(
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
              initialItem: _selectedDay,
              onChanged: (v) {
                setState(() {
                  _selectedYear = v;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  CupertinoPicker _buildCupertinoPicker(
    List<Widget> children, {
    required int initialItem,
    Function(int)? onChanged,
  }) {
    return CupertinoPicker(
      magnification: 1.22,
      useMagnifier: true,
      itemExtent: 57,
      scrollController: FixedExtentScrollController(
        initialItem: initialItem,
      ),
      onSelectedItemChanged: onChanged,
      children: children,
    );
  }
}
