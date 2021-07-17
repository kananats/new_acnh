// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs_key_enum.dart';

// **************************************************************************
// RawPresentableGenerator
// **************************************************************************

extension $SharedPrefsKeyEnumExtension on SharedPrefsKeyEnum {
  String get rawValue {
    switch (this) {
      case SharedPrefsKeyEnum.language:
        return "language";
      case SharedPrefsKeyEnum.dateTimeOffset:
        return "dateTimeOffset";
      case SharedPrefsKeyEnum.freezedDateTime:
        return "freezedDateTime";
    }
  }

  static SharedPrefsKeyEnum? fromRawValue(String rawValue) {
    try {
      return SharedPrefsKeyEnum.values.firstWhere(
        (element) => element.rawValue == rawValue,
      );
    } on StateError {
      return null;
    }
  }
}
