import 'package:json_annotation/json_annotation.dart';
part 'business_info_model.g.dart';

@JsonSerializable()
class BusinessInfoModel {
  BookingHoursModel? bookingHours;
  String? currency;
  String? countryCode;
  String? industry;
  String? subscription;
  String? status;
  String? createdAt;
  String? businessName;
  String? language;
  String? data;
  String? adminUsername;
  String? phoneCode;
  String? updatedAt;
  String? adminEmail;
  String? timezone;
  String? sK;
  String? adminId;
  String? pK;
  String? businessPhone;
  bool? showChecking;
  BusinessInfoModel();

  factory BusinessInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessInfoModelFromJson(json);
}

@JsonSerializable()
class BookingHoursModel {
  DayModel? sunday;
  DayModel? saturday;
  DayModel? tuesday;
  DayModel? wednesday;
  DayModel? thursday;
  DayModel? friday;
  DayModel? monday;
  BookingHoursModel();

  factory BookingHoursModel.fromJson(Map<String, dynamic> json) =>
      _$BookingHoursModelFromJson(json);
}

@JsonSerializable()
class DayModel {
  String? close;
  String? open;
  bool? isOpen;
  DayModel();
  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);
}
