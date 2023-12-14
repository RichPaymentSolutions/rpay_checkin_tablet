import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';

class EnvConfig {
  static String baseUrl() {
    final v = injector.get<SharedManager>().getString(SharedKey.env.name);
    if (v == 'PROD') {
      return 'https://api.getrichpos.com';
    } else if (v == 'DEV') {
      return 'https://api.devrpay.com';
    }
    return 'https://api-stage.devrpay.com';
  }
}
// https://api.getrichpos.com