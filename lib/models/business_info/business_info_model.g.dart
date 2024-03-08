// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessInfoModel _$BusinessInfoModelFromJson(Map<String, dynamic> json) =>
    BusinessInfoModel()
      ..bookingHours = json['bookingHours'] == null
          ? null
          : BookingHoursModel.fromJson(
              json['bookingHours'] as Map<String, dynamic>)
      ..currency = json['currency'] as String?
      ..countryCode = json['countryCode'] as String?
      ..industry = json['industry'] as String?
      ..subscription = json['subscription'] as String?
      ..status = json['status'] as String?
      ..createdAt = json['createdAt'] as String?
      ..businessName = json['businessName'] as String?
      ..language = json['language'] as String?
      ..data = json['data'] as String?
      ..adminUsername = json['adminUsername'] as String?
      ..phoneCode = json['phoneCode'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..adminEmail = json['adminEmail'] as String?
      ..timezone = json['timezone'] as String?
      ..sK = json['sK'] as String?
      ..adminId = json['adminId'] as String?
      ..pK = json['pK'] as String?
      ..businessPhone = json['businessPhone'] as String?
      ..showChecking = json['showChecking'] as bool?;

Map<String, dynamic> _$BusinessInfoModelToJson(BusinessInfoModel instance) =>
    <String, dynamic>{
      'bookingHours': instance.bookingHours,
      'currency': instance.currency,
      'countryCode': instance.countryCode,
      'industry': instance.industry,
      'subscription': instance.subscription,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'businessName': instance.businessName,
      'language': instance.language,
      'data': instance.data,
      'adminUsername': instance.adminUsername,
      'phoneCode': instance.phoneCode,
      'updatedAt': instance.updatedAt,
      'adminEmail': instance.adminEmail,
      'timezone': instance.timezone,
      'sK': instance.sK,
      'adminId': instance.adminId,
      'pK': instance.pK,
      'businessPhone': instance.businessPhone,
      'showChecking': instance.showChecking,
    };

BookingHoursModel _$BookingHoursModelFromJson(Map<String, dynamic> json) =>
    BookingHoursModel()
      ..sunday = json['sunday'] == null
          ? null
          : DayModel.fromJson(json['sunday'] as Map<String, dynamic>)
      ..saturday = json['saturday'] == null
          ? null
          : DayModel.fromJson(json['saturday'] as Map<String, dynamic>)
      ..tuesday = json['tuesday'] == null
          ? null
          : DayModel.fromJson(json['tuesday'] as Map<String, dynamic>)
      ..wednesday = json['wednesday'] == null
          ? null
          : DayModel.fromJson(json['wednesday'] as Map<String, dynamic>)
      ..thursday = json['thursday'] == null
          ? null
          : DayModel.fromJson(json['thursday'] as Map<String, dynamic>)
      ..friday = json['friday'] == null
          ? null
          : DayModel.fromJson(json['friday'] as Map<String, dynamic>)
      ..monday = json['monday'] == null
          ? null
          : DayModel.fromJson(json['monday'] as Map<String, dynamic>);

Map<String, dynamic> _$BookingHoursModelToJson(BookingHoursModel instance) =>
    <String, dynamic>{
      'sunday': instance.sunday,
      'saturday': instance.saturday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'monday': instance.monday,
    };

DayModel _$DayModelFromJson(Map<String, dynamic> json) => DayModel()
  ..close = json['close'] as String?
  ..open = json['open'] as String?
  ..isOpen = json['isOpen'] as bool?;

Map<String, dynamic> _$DayModelToJson(DayModel instance) => <String, dynamic>{
      'close': instance.close,
      'open': instance.open,
      'isOpen': instance.isOpen,
    };
