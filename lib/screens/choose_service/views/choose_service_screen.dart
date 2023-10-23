import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rp_checkin/base/base_screen.dart';
import 'package:rp_checkin/components/app_button.dart';
import 'package:rp_checkin/components/app_circular_indicator.dart';
import 'package:rp_checkin/components/app_form_field.dart';
import 'package:rp_checkin/components/custom_app_bar.dart';
import 'package:rp_checkin/extensions/string_ext.dart';
import 'package:rp_checkin/models/category/category_model.dart';
import 'package:rp_checkin/screens/list_staff/views/list_staff_dialog.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/theme/color_constant.dart';
import 'package:rp_checkin/theme/text_style_constant.dart';

class ChooseServiceScreen extends StatefulWidget {
  const ChooseServiceScreen({super.key});

  @override
  State<ChooseServiceScreen> createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  List<CategoryModel> _catalogs = [];
  List<CategoryModel> _categories = [];
  List<CategoryModel> _catalogsOrigin = [];
  final _searchTxtController = TextEditingController();
  bool _isLoading = true;
  @override
  void initState() {
    _getCatalogs();
    super.initState();
  }

  _getCatalogs() async {
    final res = await injector.get<ApiClient>().getCatalogs();

    setState(() {
      _isLoading = false;
      _catalogs = res?.data ?? [];
      _catalogsOrigin = res?.data ?? [];
      _categories = res?.data ?? [];
    });
  }

  _searchService() {
    final txt = _searchTxtController.text.toLowerCase();
    if (txt == '') {
      _catalogs = _catalogsOrigin;
    }
    _catalogs = _catalogsOrigin.where((e) {
      return e.catName!.toLowerCase().replaceAll(' ', '').contains(txt) ||
          (e.products ?? [])
              .where((s) => s.productName!
                  .toLowerCase()
                  .replaceAll(' ', '')
                  .contains(txt))
              .isNotEmpty;
    }).toList();
    setState(() {});
  }

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
                    _buildCategoriesView(),
                    _buildListServicesView(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildListServicesView() {
    return Expanded(
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
                  color: ColorConstant.grey919EAB.withOpacity(0.1),
                ),
                BoxShadow(
                  blurRadius: 2,
                  color: ColorConstant.grey919EAB.withOpacity(0.16),
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
                  flex: 7,
                  child: AppFormField(
                    hint: 'Search categories or services...',
                    controller: _searchTxtController,
                    onChanged: (v) => _searchService(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset('ic_search'.iconSvg),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: ColorConstant.grey919EAB.withOpacity(0.24),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                AppButton(
                  width: 160,
                  height: 54,
                  radius: 27,
                  color: ColorConstant.grayEBF4FD,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Staff',
                        style: TextStyleConstant.livvicW500(
                          fontSize: 18,
                          color: ColorConstant.primary,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset('ic_plus'.iconSvg),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    height: 50,
                    width: 100,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      border: index == 1
                          ? const Border(
                              bottom: BorderSide(
                                color: ColorConstant.primary,
                                width: 2,
                              ),
                            )
                          : null,
                      color: Colors.white,
                    ),
                    child: Center(child: Text('Staff $index')),
                  );
                }),
          ),
          Expanded(
            child: _isLoading
                ? const AppCircularIndicator()
                : ListView.builder(
                    itemCount: _catalogs.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(24),
                    itemBuilder: (_, index) {
                      final cata = _catalogs[index];
                      return Container(
                        // height: 230,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          // vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
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
                          children: [
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      cata.catName ?? '',
                                      style: TextStyleConstant.livvicW600(
                                        fontSize: 20,
                                      ),
                                    ),
                                    // Transform.rotate(
                                    //   angle:
                                    //       _isPriceDown ? -0 : math.pi,
                                    //   child: SvgPicture.asset(
                                    //       'ic_chevron_up'.iconSvg),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                              itemCount: (cata.products ?? []).length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) {
                                final item = cata.products![index];
                                return Container(
                                  height: 62,
                                  decoration: DottedDecoration(
                                    color: ColorConstant.grey919EAB
                                        .withOpacity(0.24),
                                    strokeWidth: 0.5,
                                    linePosition: LinePosition.bottom,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          value: true,
                                          activeColor: ColorConstant.primary,
                                          onChanged: (bool? value) {
                                            // This is where we update the state when the checkbox is tapped
                                            // setState(() {
                                            //   isChecked = value!;
                                            // });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          item.productName ?? '',
                                          style:
                                              TextStyleConstant.publicSansW400(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          useRootNavigator: true,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (_) =>
                                              const FractionallySizedBox(
                                            heightFactor: 0.9,
                                            child: ListStaffDialog(),
                                          ),
                                        ),
                                        child: Container(
                                          height: 32,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: ColorConstant.primary
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Staff Abc',
                                                style: TextStyleConstant
                                                    .publicSansW500(
                                                        color: ColorConstant
                                                            .primary),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  Expanded _buildCategoriesView() {
    return Expanded(
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
              child: _isLoading
                  ? const AppCircularIndicator()
                  : ListView.builder(
                      itemCount: _categories.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 50),
                      itemBuilder: (_, index) {
                        final item = _categories[index];
                        return Container(
                          padding: const EdgeInsets.all(24),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ColorConstant.primary),
                          ),
                          child: Text(
                            item.catName ?? '',
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
    );
  }
}
