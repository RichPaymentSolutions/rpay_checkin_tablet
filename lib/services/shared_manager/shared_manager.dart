import 'package:shared_preferences/shared_preferences.dart';

enum SharedKey {
  accessToken,
  refreshToken,
  businessName,
  tenantId,
  timezone,
}

class SharedManager {
  final SharedPreferences shared;
  SharedManager(this.shared);

  setString(String key, String value) {
    shared.setString(key, value);
  }

  String? getString(String key) {
    return shared.getString(key);
  }

  clear() {
    shared.clear();
  }
}
