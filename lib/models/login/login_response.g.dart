// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse()
      ..email = json['email'] as String?
      ..accessToken = json['accessToken'] as String?
      ..refreshToken = json['refreshToken'] as String?
      ..tenantId = json['tenantId'] as String?
      ..username = json['username'] as String?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tenantId': instance.tenantId,
      'username': instance.username,
    };
