// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rp_checkin/helpers/common_helper.dart';
import 'package:rp_checkin/main.dart';
import 'package:rp_checkin/models/category/category_model.dart';
import 'package:rp_checkin/models/customer/customer_model.dart';
import 'package:rp_checkin/models/staff/staff_model.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/screens/login/views/widgets/lock_app_view.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'package:uuid/uuid.dart';

class AppProvider with ChangeNotifier {
  CustomerModel? customer;
  List<StaffModel> listStaffSelected = [];
  List<String> listStaffIdSelected = [];
  List<CategoryModel> catalogs = [];
  late StaffModel staffSelected;
  addStaff(StaffModel staff) {
    final staffCopy = StaffModel.fromJson(staff.toJson());
    staffSelected = staffCopy;
    listStaffSelected.add(staffCopy);
    listStaffIdSelected.add(staffCopy.staffId!);
    notifyListeners();
  }

  remove(int index) {
    if (staffSelected.staffId == listStaffSelected[index].staffId) {
      if (index > 0 && listStaffSelected.length > 1) {
        staffSelected = listStaffSelected[index - 1];
      }
    }
    listStaffSelected.removeAt(index);
    listStaffIdSelected.removeAt(index);

    notifyListeners();
  }

  bool checkStaffValid() {
    return listStaffSelected
        .where((e) => (e.services ?? []).isNotEmpty)
        .isNotEmpty;
  }

  chooseStaff(int index) {
    staffSelected = listStaffSelected[index];
    notifyListeners();
  }

  checkin(BuildContext context) async {
    CommonHelper.showLoading(context);
    final d = CommonHelper.getStartEndDate();
    final l = listStaffSelected
        .where((e) => e.services != null && e.services!.isNotEmpty)
        .toList();
    final data = {
      "birthday": customer?.birthday ?? '',
      // "customerName": customer?.lastName,
      'customerId': customer?.customerId ?? '',
      "email": customer?.email ?? '',
      "endDate": d.item2.toString(),
      "firstName": customer?.name ?? (customer?.firstName ?? ''),
      "lastName": customer?.lastName ?? '',
      "phone": customer?.phone,
      "startDate": d.item1.toString(),
      "timezone":
          injector.get<SharedManager>().getString(SharedKey.timezone.name) ??
              'US/Central',
      "staffList": l.map((e) {
        final m = e.toJson();
        m['staffName'] = e.name;
        m['staffPK'] = e.PK;
        m['services'] = e.services?.map((e) => e.toJsonData()).toList();
        return m;
      }).toList(),
      "_id": const Uuid().v4(),
    };
    log(data.toString());
    final res = await injector.get<ApiClient>().checkin(data);
    CommonHelper.hideLoading();
    if (res != null && res.success == true) {
      Navigator.of(context)
          .pushNamed(RouteNames.successCheckin, arguments: customer?.points);
      clearData();
    }
  }

  clearData() {
    customer = null;
    listStaffSelected.clear();
    listStaffIdSelected.clear();
    staffSelected = StaffModel();
  }

  getShopInfo() async {
    final res = await injector.get<ApiClient>().getBusinessInfo();

    if (res != null && res.data != null) {
      injector
          .get<SharedManager>()
          .setString(SharedKey.businessName.name, res.data!.businessName!);
      injector
          .get<SharedManager>()
          .setString(SharedKey.timezone.name, res.data!.timezone!);
      if (res.data?.showChecking != true) {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (_) => const LockAppView(),
        );
      }
    }
  }
}
