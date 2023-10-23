// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffModel _$StaffModelFromJson(Map<String, dynamic> json) => StaffModel(
      staffColor: json['staffColor'] == null
          ? null
          : StaffColorModel.fromJson(
              json['staffColor'] as Map<String, dynamic>),
      cleanFee: json['cleanFee'] as int?,
      orderIndex: json['orderIndex'] as int?,
      cleanFeeType: json['cleanFeeType'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      tipChargeCheck: json['tipChargeCheck'] as bool?,
      cashAndRatePercentageForTip:
          json['cashAndRatePercentageForTip'] as String?,
      name: json['name'] as String?,
      cashAndCheckPercentage: json['cashAndCheckPercentage'] as String?,
      tipCharge: json['tipCharge'] as int?,
      role: json['role'] as String?,
      data: json['data'] as String?,
      updatedAt: json['updatedAt'] as String?,
      tipChargeCash: json['tipChargeCash'] as bool?,
      sK: json['sK'] as String?,
      commission: json['commission'] as int?,
      passcode: json['passcode'] as String?,
      pK: json['pK'] as String?,
      phone: json['phone'] as String?,
      hardSalary: json['hardSalary'] as int?,
      staffId: json['staffId'] as String?,
    )..services = (json['services'] as List<dynamic>?)
        ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$StaffModelToJson(StaffModel instance) =>
    <String, dynamic>{
      'staffColor': instance.staffColor,
      'cleanFee': instance.cleanFee,
      'orderIndex': instance.orderIndex,
      'cleanFeeType': instance.cleanFeeType,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
      'tipChargeCheck': instance.tipChargeCheck,
      'cashAndRatePercentageForTip': instance.cashAndRatePercentageForTip,
      'name': instance.name,
      'cashAndCheckPercentage': instance.cashAndCheckPercentage,
      'tipCharge': instance.tipCharge,
      'role': instance.role,
      'data': instance.data,
      'updatedAt': instance.updatedAt,
      'tipChargeCash': instance.tipChargeCash,
      'sK': instance.sK,
      'commission': instance.commission,
      'passcode': instance.passcode,
      'pK': instance.pK,
      'phone': instance.phone,
      'hardSalary': instance.hardSalary,
      'staffId': instance.staffId,
      'services': instance.services,
    };

StaffColorModel _$StaffColorModelFromJson(Map<String, dynamic> json) =>
    StaffColorModel(
      secondary: json['secondary'] as String?,
      primary: json['primary'] as String?,
    );

Map<String, dynamic> _$StaffColorModelToJson(StaffColorModel instance) =>
    <String, dynamic>{
      'secondary': instance.secondary,
      'primary': instance.primary,
    };
