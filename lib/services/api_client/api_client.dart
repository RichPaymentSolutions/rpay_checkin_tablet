import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rp_checkin/models/base/base_response.dart';
import 'package:rp_checkin/models/login/login_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/auth/auth/login')
  Future<BaseResponse<LoginResponse>?> login(@Body() data);
}
