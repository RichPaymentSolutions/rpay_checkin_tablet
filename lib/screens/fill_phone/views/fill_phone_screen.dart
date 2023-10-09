import 'package:flutter/material.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/screens/fill_phone/widgets/number_keyboar_view.dart';
import 'package:rp_checkin/theme/color_constant.dart';

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
            Expanded(child: SizedBox.shrink()),
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
                  child: NumberKeyboardView()),
            ),
          ],
        ),
      ),
    );
  }
}
