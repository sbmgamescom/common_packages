import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  OnboardingService._();
  factory OnboardingService() => instance;
  static final instance = OnboardingService._();
  static const prefsKey = 'isFirstOpen';

  Future<bool> get isFirstOpen async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey(prefsKey);
  }

  void setFirstOpen() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(prefsKey, true);
  }
}
