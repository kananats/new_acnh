import 'package:new_acnh/data/api/api.dart';
import 'package:new_acnh/data/database/database.dart';
import 'package:new_acnh/data/database/entity/fish_entity.dart';
import 'package:new_acnh/model/fish.dart';
import 'package:new_acnh/util/locator.dart';

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

  Future<void> updateFish(Fish fish) async {
    await database.fishDao.insert(fish.id, FishEntity.fromModel(fish));
  }
}
