import 'package:flutter_template/constant/enum/env.dart';
import 'package:flutter_template/data/api/api.dart';
import 'package:flutter_template/data/api/repository/fish_repository.dart';
import 'package:flutter_template/data/database/database.dart';
import 'package:flutter_template/data/storage/secure_storage.dart';
import 'package:flutter_template/data/storage/shared_prefs.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Environment variable
  locator.registerLazySingleton<Env>(() => Env.stg);

  // Http Client
  locator.registerLazySingleton(() => locator.get<Env>().dio);

  // Api Client
  locator.registerLazySingleton(() => Api());

  // Database
  locator.registerLazySingleton(() => Database());

  // Storage
  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(() => SharedPrefs());

  // Repository
  locator.registerLazySingleton(() => FishRepository());
}
