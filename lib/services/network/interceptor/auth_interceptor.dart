import 'package:dio/dio.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';

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
        await refreshToken();
        final retry = await _retry(response.requestOptions, dio);
        return handler.resolve(retry);
      } else if (response.data['messageKey'] == 'RefreshTokenIsExpired' ||
          response.data['messageKey'] == 'Unauthorized') {
        if (!_isExpired) {
          _isExpired = true;
          // MyAlertDialog.show(
          //     message: MessageKey.refreshTokenIsExpired.message,
          //     onFunction: () {
          //       AppUtils.logout();
          //       _isExpired = false;
          //     });
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

  Future<void> refreshToken() async {
    final refreshToken =
        injector.get<SharedManager>().getString(SharedKey.refreshToken.name);
    if (refreshToken == null) {
      return;
    }
    final data = {
      "refreshToken": refreshToken,
    };
    final res = await injector.get<ApiClient>().refreshToken(data);
    if (res != null && res.data != null) {
      injector
          .get<SharedManager>()
          .setString(SharedKey.accessToken.name, res.data!);
    }
  }
}
