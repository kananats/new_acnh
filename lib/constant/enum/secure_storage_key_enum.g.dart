// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_storage_key_enum.dart';

// **************************************************************************
// RawPresentableGenerator
// **************************************************************************

extension $SecureStorageKeyEnumExtension on SecureStorageKeyEnum {
  String get rawValue {
    switch (this) {
      case SecureStorageKeyEnum.accessToken:
        return "accessToken";
    }
  }

  static SecureStorageKeyEnum? fromRawValue(String rawValue) {
    try {
      return SecureStorageKeyEnum.values.firstWhere(
        (element) => element.rawValue == rawValue,
      );
    } on StateError {
      return null;
    }
  }
}
