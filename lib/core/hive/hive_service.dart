import 'package:hive_flutter/hive_flutter.dart';


class HiveService {
  static const String _settingsBox = 'app_settings';
  static const String _userBox = 'user_data';

  static Future<void> init() async {

    await Hive.initFlutter();
    await _openBoxes();
  }


  static Future<void> _openBoxes() async {
    try {
      if (!Hive.isBoxOpen(_settingsBox)) {
        await Hive.openBox(_settingsBox);
      }

      if (!Hive.isBoxOpen(_userBox)) {
        await Hive.openBox(_userBox);
      }
    } catch (e) {
      print('Error opening Hive boxes: $e');
    }
  }

  static Box getSettingsBox() {
    if (!Hive.isBoxOpen(_settingsBox)) {
      throw Exception('Settings box is not open');
    }
    return Hive.box(_settingsBox);
  }

  static Box getUserBox() {
    if (!Hive.isBoxOpen(_userBox)) {
      throw Exception('User box is not open');
    }
    return Hive.box(_userBox);
  }

  static Future<void> closeAllBoxes() async {
    await Hive.close();
  }
  static Future<void> clearAllData() async {
    try {
      if (Hive.isBoxOpen(_settingsBox)) {
        await Hive.box(_settingsBox).clear();
      }

      if (Hive.isBoxOpen(_userBox)) {
        await Hive.box(_userBox).clear();
      }
    } catch (e) {
      print('Error clearing Hive data: $e');
    }
  }

  static Future<void> deleteAllBoxes() async {
    try {
      await Hive.deleteBoxFromDisk(_settingsBox);
      await Hive.deleteBoxFromDisk(_userBox);
    } catch (e) {
      print('Error deleting Hive boxes: $e');
    }
  }
}