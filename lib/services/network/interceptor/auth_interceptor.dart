import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rp_checkin/helpers/dialog_helper.dart';
import 'package:rp_checkin/main.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'dart:developer';

class AuthInterceptor extends InterceptorsWrapper {
  Dio dio;
  AuthInterceptor(this.dio);
  var _isExpired = false;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token =
        injector.get<SharedManager>().getString(SharedKey.accessToken.name);
    String? tenantId =
        injector.get<SharedManager>().getString(SharedKey.tenantId.name);
    print(injector.get<SharedManager>().getString(SharedKey.refreshToken.name));
    print(token);
    if (token != null) {
      options.headers['authorizer'] = token;
      options.headers['x-tenant-id'] = tenantId;
    }
    //   options.headers['authorizer'] = user?.accessToken;
    //   options.headers['x-tenant-id'] = user?.tenantId;
    //   options.headers['x-pos-id'] = 'app';
    //   options.headers['x-clover-device-id'] = DataPrefsConstant
    //       .checkoutSetting?.cloverSettings?.cloud?.deviceIds?.first;
    //   options.headers['x-clover-access-token'] =
    //       DataPrefsConstant.checkoutSetting?.cloverSettings?.cloud?.apiToken;
    // }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data is Map) {
      if (response.data['messageKey'] == 'TokenIsExpired') {
        print('refreshToken');

        if (!_isExpired) {
          _isExpired = true;
          final res = await refreshToken();
          if (res) {
            final retry = await _retry(response.requestOptions, dio);
            return handler.resolve(retry);
          }
          final error = DioException(
              requestOptions: response.requestOptions,
              type: DioExceptionType.unknown);

          return handler.reject(error);
        }
      } else if (response.statusCode == 502) {
        if (_isExpired) {
          DialogHelper.showOkDialog(navigatorKey.currentContext!,
              'Your session is expired, please login again!', okAction: () {
            injector.get<SharedManager>().clear();
            Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
              RouteNames.login,
              (route) => false,
            );
            _isExpired = false;
          });
        }

        response.requestOptions.extra["tokenErrorType"] = 'token expired';
        final error = DioException(
            requestOptions: response.requestOptions,
            type: DioExceptionType.unknown);

        return handler.reject(error);
      }
    }

    super.onResponse(response, handler);
  }

  Future<Response<dynamic>> _retry(
      RequestOptions requestOptions, Dio dio) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    final result = await dio.request<dynamic>('${requestOptions.path}',
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
    return result;
  }

  Future<bool> refreshToken() async {
    final refreshToken =
        injector.get<SharedManager>().getString(SharedKey.refreshToken.name);
    if (refreshToken == null) {
      return false;
    }
    final data = {
      "refreshToken": refreshToken,
    };
    try {
      final res = await injector.get<ApiClient>().refreshToken(data);
      if (res != null && res.data != null) {
        injector
            .get<SharedManager>()
            .setString(SharedKey.accessToken.name, res.data!);
        return true;
      }
    } catch (_) {
      DialogHelper.showOkDialog(navigatorKey.currentContext!,
          'Your session is expired, please login again!', okAction: () {
        injector.get<SharedManager>().clear();
        Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
          RouteNames.login,
          (route) => false,
        );
        _isExpired = false;
      });
    }
    return false;
  }
}
