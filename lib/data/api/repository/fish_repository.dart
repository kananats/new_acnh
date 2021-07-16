import 'package:flutter_template/data/api/api.dart';
import 'package:flutter_template/data/database/database.dart';
import 'package:flutter_template/data/database/entity/fish_entity.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:flutter_template/util/locator.dart';

class FishRepository {
  final api = locator.get<Api>();
  final database = locator.get<Database>();

  Future<void> fetchFishes() async {
    final responses = await api.getV1Fish();

    for (final response in responses) {
      final entity = FishEntity.fromResponse(response);

      await database.fishDao.insert(entity.id, entity);
    }
  }

  Future<List<Fish>> findFishes() async {
    final entities = await database.fishDao.findAll();

    return entities.map((entity) {
      return Fish.fromEntity(entity);
    }).toList();
  }
}
