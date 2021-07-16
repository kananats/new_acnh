import 'package:hive/hive.dart';

class Dao<T> {
  final String tableName;

  late final Future<Box<T>> _box = Hive.openBox<T>(tableName);

  Dao(this.tableName);

  Future<List<T>> findAll() async {
    return (await _box).values.toList();
  }

  Future<T?> findById(dynamic id) async {
    return (await _box).get(id);
  }

  Future<void> insert(dynamic id, T entity) async {
    await (await _box).put(id, entity);
  }

  Future<void> delete(dynamic id) async {
    await (await _box).delete(id);
  }

  Future<void> deleteAll() async {
    (await _box).deleteAll((await _box).keys);
  }
}
