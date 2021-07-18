import 'package:new_acnh/data/database/dao.dart';
import 'package:new_acnh/data/database/entity/availability_entity.dart';
import 'package:new_acnh/data/database/entity/fish_entity.dart';
import 'package:new_acnh/data/database/entity/name_entity.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  final fishDao = Dao<FishEntity>("fishes");

  Future<void> deleteAll() async {
    await fishDao.deleteAll();
  }

  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(FishEntityAdapter());
    Hive.registerAdapter(NameEntityAdapter());
    Hive.registerAdapter(AvailabilityEntityAdapter());
  }
}
