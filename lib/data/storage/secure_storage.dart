import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final secureStorage = const FlutterSecureStorage();

  Future<void> deleteAll() async {
    await secureStorage.deleteAll();
  }
}
