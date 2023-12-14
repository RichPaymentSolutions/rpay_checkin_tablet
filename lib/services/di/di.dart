import 'package:get_it/get_it.dart';
import 'package:rp_checkin/config/env_config.dart';
import 'package:rp_checkin/services/api_client/api_client.dart';
import 'package:rp_checkin/services/network/dio_client.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt injector = GetIt.instance;

class DependencyInjection {
  static Future<void> inject() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    injector.registerSingleton(SharedManager(sharedPreferences));
    if (injector.get<SharedManager>().getString(SharedKey.env.name) == null) {
      injector.get<SharedManager>().setString(SharedKey.env.name, 'PROD');
    }
    final _dio = await DioClient.setup(
      baseUrl: EnvConfig.baseUrl(),
    );
    injector.registerSingleton<ApiClient>(ApiClient(_dio));
  }

  static setupDio() async {
    injector.unregister<ApiClient>();
    final _dio = await DioClient.setup(
      baseUrl: EnvConfig.baseUrl(),
    );
    injector.registerSingleton<ApiClient>(ApiClient(_dio));
  }
}
