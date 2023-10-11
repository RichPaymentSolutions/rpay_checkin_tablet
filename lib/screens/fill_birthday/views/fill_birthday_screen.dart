import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
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
  int _selectedFruit = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: 'What’s your birthday?',
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        magnification: 1.22,

                        useMagnifier: true,
                        itemExtent: 57,
                        // This sets the initial item.
                        scrollController: FixedExtentScrollController(
                          initialItem: _selectedFruit,
                        ),
                        // This is called when selected item is changed.
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            _selectedFruit = selectedItem;
                          });
                        },
                        children: List<Widget>.generate(
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
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        magnification: 1.22,

                        useMagnifier: true,
                        itemExtent: 32,
                        // This sets the initial item.
                        scrollController: FixedExtentScrollController(
                          initialItem: _selectedFruit,
                        ),
                        // This is called when selected item is changed.
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            _selectedFruit = selectedItem;
                          });
                        },
                        children: List<Widget>.generate(30, (int index) {
                          return Center(
                            child: Text(
                              '${index + 1}',
                            ),
                          );
                        }),
                      ),
                    ),
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
