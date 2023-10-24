import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rp_checkin/models/base/base_response.dart';
import 'package:rp_checkin/models/business_info/business_info_model.dart';
import 'package:rp_checkin/models/category/category_model.dart';
import 'package:rp_checkin/models/customer/customer_model.dart';
import 'package:rp_checkin/models/login/login_response.dart';
import 'package:rp_checkin/models/staff/staff_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/auth/auth/login')
  Future<BaseResponse<LoginResponse>?> login(@Body() data);
  @GET('/tenant/tenants/business-info')
  Future<BaseResponse<BusinessInfoModel>?> getBusinessInfo();
  @GET('/customer/customers/info')
  Future<BaseResponse<CustomerModel>?> getCustomerInfo(
    @Query('phone') String phone,
  );
  @GET('/staff/staffs')
  Future<BaseResponse<List<StaffModel>>?> getStaffs();
  @GET('/catalog/catalog/services')
  Future<BaseResponse<List<CategoryModel>>?> getCatalogs();
  @POST('/auth/refresh-token')
  Future<BaseResponse<String>?> refreshToken(@Body() data);
}
