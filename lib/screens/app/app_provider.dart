import 'package:flutter/material.dart';
import 'package:rp_checkin/models/category/category_model.dart';
import 'package:rp_checkin/models/customer/customer_model.dart';
import 'package:rp_checkin/models/staff/staff_model.dart';

class AppProvider with ChangeNotifier {
  CustomerModel? customer;
  List<StaffModel> listStaffSelected = [];
  List<String> listStaffIdSelected = [];
  List<CategoryModel> catalogs = [];
  late StaffModel staffSelected;
  addStaff(StaffModel staff) {
    staffSelected = staff;
    listStaffSelected.add(staff);
    listStaffIdSelected.add(staff.staffId!);
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
}
