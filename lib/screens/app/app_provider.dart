// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rp_checkin/helpers/common_helper.dart';
import 'package:rp_checkin/models/category/category_model.dart';
import 'package:rp_checkin/models/customer/customer_model.dart';
import 'package:rp_checkin/models/staff/staff_model.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/di/di.dart';

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

  chooseStaff(int index) {
    staffSelected = listStaffSelected[index];
    notifyListeners();
  }

  checkin(BuildContext context) async {
    CommonHelper.showLoading(context);
    final l = listStaffSelected
        .where((e) => e.services != null && e.services!.isNotEmpty)
        .toList();
    final data = {
      "birthday": customer?.birthday,
      "customerName": customer?.lastName,
      "email": customer?.email,
      "endDate": "1698253199999",
      "firstName": customer?.firstName,
      "lastName": customer?.lastName,
      "phone": customer?.phone,
      "startDate": "1698166800000",
      "staffList": l.map((e) => e.toJson()).toList()
    };
    final res = await injector.get<ApiClient>().checkin(data);
    CommonHelper.hideLoading();
    if (res != null && res.success == true) {
      clearData();
      Navigator.of(context).pushNamed(RouteNames.successCheckin);
    }
  }

  clearData() {
    customer = null;
    listStaffSelected.clear();
    listStaffIdSelected.clear();
    staffSelected = StaffModel();
  }
}
