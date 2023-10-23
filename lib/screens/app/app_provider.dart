import 'package:flutter/material.dart';
import 'package:rp_checkin/models/customer/customer_model.dart';
import 'package:rp_checkin/models/staff/staff_model.dart';

class AppProvider with ChangeNotifier {
  CustomerModel? customer;
  List<StaffModel> listStaffSelected = [];
}
