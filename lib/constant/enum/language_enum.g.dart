// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_enum.dart';

// **************************************************************************
// RawPresentableGenerator
// **************************************************************************

extension $LanguageEnumExtension on LanguageEnum {
  String get rawValue {
    switch (this) {
      case LanguageEnum.USen:
        return "English (US)";
      case LanguageEnum.EUen:
        return "English (Europe)";
      case LanguageEnum.EUde:
        return "Deutsch";
      case LanguageEnum.EUes:
        return "Español (Europe)";
      case LanguageEnum.USes:
        return "Español (Latinoamérica)";
      case LanguageEnum.EUfr:
        return "Français (Europe)";
      case LanguageEnum.USfr:
        return "Français (Canada)";
      case LanguageEnum.EUit:
        return "Italiano";
      case LanguageEnum.EUnl:
        return "Nederlands";
      case LanguageEnum.CNzh:
        return "简体中文";
      case LanguageEnum.TWzh:
        return "繁體中文";
      case LanguageEnum.JPja:
        return "日本語";
      case LanguageEnum.KRko:
        return "한국어";
      case LanguageEnum.EUru:
        return "Русский";
    }
  }

  static LanguageEnum? fromRawValue(String rawValue) {
    try {
      return LanguageEnum.values.firstWhere(
        (element) => element.rawValue == rawValue,
      );
    } on StateError {
      return null;
    }
  }
}
