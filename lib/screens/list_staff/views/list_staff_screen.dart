import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rp_checkin/components/app_circular_indicator.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/models/staff/staff_model.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/screens/app/app_provider.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class ListStaffsScreen extends StatefulWidget {
  const ListStaffsScreen({super.key});

  @override
  State<ListStaffsScreen> createState() => _ListStaffsScreenState();
}

class _ListStaffsScreenState extends State<ListStaffsScreen> {
  List<StaffModel> _listStaffs = [];
  bool _isLoading = true;
  @override
  void initState() {
    _getListStaff();
    super.initState();
  }

  _getListStaff() async {
    final res = await injector.get<ApiClient>().getStaffs();
    setState(() {
      _isLoading = false;
      _listStaffs = (res?.data ?? []).where((e) => e.role != 'Owner').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AppProvider>(
          builder: (context, app, child) => Column(
            children: [
              CustomAppBar(
                title: context.read<AppProvider>().customer?.customerId != null
                    ? 'Wellcome Back ${context.read<AppProvider>().customer?.firstName ?? ''}!\nPlease choose your Technician'
                    : 'Please choose your Technician',
                isHideNext: true,
              ),
              Expanded(
                child: _isLoading
                    ? const AppCircularIndicator()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: GridView.builder(
                          itemCount: _listStaffs.length,
                          padding: const EdgeInsets.only(
                            top: 70,
                            bottom: 30,
                          ),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.7,
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24,
                          ),
                          itemBuilder: (_, index) {
                            final item = _listStaffs[index];
                            return InkWell(
                              onTap: () {
                                if (context
                                    .read<AppProvider>()
                                    .listStaffSelected
                                    .where((e) => e.staffId == item.staffId)
                                    .isEmpty) {
                                  context.read<AppProvider>().addStaff(item);
                                }

                                Navigator.of(context)
                                    .pushNamed(RouteNames.chooseService);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: context
                                            .read<AppProvider>()
                                            .listStaffIdSelected
                                            .contains(item.staffId)
                                        ? ColorConstant.primary0E73E4
                                        : ColorConstant.heading
                                            .withOpacity(0.7),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'ic_user'.iconSvg,
                                      color: context
                                              .read<AppProvider>()
                                              .listStaffIdSelected
                                              .contains(item.staffId)
                                          ? ColorConstant.primary
                                          : null,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      item.name ?? '',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyleConstant.publicSansW500(
                                        fontSize: 20,
                                        color: context
                                                .read<AppProvider>()
                                                .listStaffIdSelected
                                                .contains(item.staffId)
                                            ? ColorConstant.primary
                                            : ColorConstant.heading,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
