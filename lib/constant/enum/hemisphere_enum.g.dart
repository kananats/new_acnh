// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hemisphere_enum.dart';

// **************************************************************************
// RawPresentableGenerator
// **************************************************************************

extension $HemisphereEnumExtension on HemisphereEnum {
  String get rawValue {
    switch (this) {
      case HemisphereEnum.northern:
        return "Northern";
      case HemisphereEnum.southern:
        return "Southern";
    }
  }

  static HemisphereEnum? fromRawValue(String rawValue) {
    try {
      return HemisphereEnum.values.firstWhere(
        (element) => element.rawValue == rawValue,
      );
    } on StateError {
      return null;
    }
  }
}
