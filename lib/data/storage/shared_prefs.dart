import 'package:flutter_template/constant/enum/language_enum.dart';
import 'package:flutter_template/constant/enum/shared_prefs_key_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> deleteAll() async {
    final sharedPreferences = await this.sharedPreferences;

    await sharedPreferences.clear();
  }

  Future<LanguageEnum?> getLanguage() async {
    final sharedPreferences = await this.sharedPreferences;

    final stringValue =
        sharedPreferences.getString(SharedPrefsKeyEnum.language.rawValue);

    if (stringValue == null) return null;

    return $LanguageEnumExtension.fromRawValue(stringValue);
  }

  Future<void> setLanguage(LanguageEnum value) async {
    final sharedPreferences = await this.sharedPreferences;

    await sharedPreferences.setString(
      SharedPrefsKeyEnum.language.rawValue,
      value.rawValue,
    );
  }

/*
  Future<DateTime?> getAccessTokenExpiredAt() async {
    final sharedPreferences = await this.sharedPreferences;

    final stringValue = sharedPreferences
        .getString(SharedPrefsKeyEnum.accessTokenExpiredAt.rawValue);

    if (stringValue == null) return null;

    return DateTime.parse(stringValue);
  }

  Future<void> setAccessTokenExpiredAt(DateTime value) async {
    final sharedPreferences = await this.sharedPreferences;

    await sharedPreferences.setString(
      SharedPrefsKeyEnum.accessTokenExpiredAt.rawValue,
      value.toIso8601String(),
    );
  }
*/
  Future<SharedPreferences> get sharedPreferences async {
    return await SharedPreferences.getInstance();
  }
}
