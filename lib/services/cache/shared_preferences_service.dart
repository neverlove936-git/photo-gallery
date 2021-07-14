// Cores
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static final SharedPreferencesServices _singleton =
      SharedPreferencesServices._internal();
  late SharedPreferences prefInstance;

  factory SharedPreferencesServices() {
    return _singleton;
  }

  SharedPreferencesServices._internal();

  // Set
  Future<void> setPrefInstance() async {
    prefInstance = await SharedPreferences.getInstance();
  }

  Future<void> setContractId(String accessToken) async {
    await prefInstance.setString('accessToken', accessToken);
  }

  // Get

  String? getContractId() {
    return prefInstance.getString('accessToken');
  }

  // Clear
  Future<void> clearLoginBefore() async {
    await prefInstance.remove('accessToken');
  }
}
