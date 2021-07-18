import 'package:new_acnh/constant/enum/language_enum.dart';
import 'package:new_acnh/constant/enum/shared_prefs_key_enum.dart';
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

  Future<Duration?> getDateTimeOffset() async {
    final sharedPreferences = await this.sharedPreferences;

    final intValue =
        sharedPreferences.getInt(SharedPrefsKeyEnum.dateTimeOffset.rawValue);

    if (intValue == null) return null;

    return Duration(microseconds: intValue);
  }

  Future<void> setDateTimeOffset(Duration? value) async {
    final sharedPreferences = await this.sharedPreferences;

    if (value != null)
      await sharedPreferences.setInt(
        SharedPrefsKeyEnum.dateTimeOffset.rawValue,
        value.inMicroseconds,
      );
    else
      await sharedPreferences
          .remove(SharedPrefsKeyEnum.dateTimeOffset.rawValue);
  }

  Future<DateTime?> getFreezedDateTime() async {
    final sharedPreferences = await this.sharedPreferences;

    final stringValue = sharedPreferences
        .getString(SharedPrefsKeyEnum.freezedDateTime.rawValue);

    if (stringValue == null) return null;
    return DateTime.parse(stringValue);
  }

  Future<void> setFreezedDateTime(DateTime? value) async {
    final sharedPreferences = await this.sharedPreferences;

    if (value != null)
      await sharedPreferences.setString(
        SharedPrefsKeyEnum.freezedDateTime.rawValue,
        value.toIso8601String(),
      );
    else
      await sharedPreferences
          .remove(SharedPrefsKeyEnum.freezedDateTime.rawValue);
  }

  Future<SharedPreferences> get sharedPreferences async {
    return await SharedPreferences.getInstance();
  }
}
