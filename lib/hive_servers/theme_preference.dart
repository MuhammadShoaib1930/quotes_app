

import 'package:hive/hive.dart';
import 'package:quotes_app/app_constant/app_constant.dart';

class ThemePreference {
  static final ThemePreference _instance = ThemePreference._internal();
  ThemePreference._internal();
  factory ThemePreference()=>_instance;
  static const _keyIsDark = 'isDark';
  static const _sliderKey = 'sliderValue';
  late final Box _box;
  Future<void> init() async {
    _box = await Hive.openBox(AppConstant.settingsDatabaseName);
  }
  bool get isDark {
    if (!_box.isOpen) {
      
      return false; 
    }
    return _box.get(_keyIsDark, defaultValue: false);
  }

  Future<void> setDark(bool value) async {
    await _box.put(_keyIsDark, value);
  }
  double get slider {
    if (!_box.isOpen) {
      return 10; 
    }
    return _box.get(_sliderKey, defaultValue: 10);
  }

  Future<void> setSliderValue(double value) async {
    await _box.put(_sliderKey, value);
  }
}