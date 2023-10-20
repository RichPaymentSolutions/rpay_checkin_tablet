// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel()
      ..customerId = json['customerId'] as String?
      ..phone = json['phone'] as String?
      ..email = json['email'] as String?
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..birthday = json['birthday'] as String?;

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'phone': instance.phone,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthday': instance.birthday,
    };
