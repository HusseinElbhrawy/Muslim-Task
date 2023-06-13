import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'i_local_data_base.dart';

class HiveLocalDataBaseImplementation implements ILocalDataBase {
  late Box box;
  HiveLocalDataBaseImplementation() {
    box = Hive.box(
      'bookmarks',
    );
  }

  @override
  Future deleteAll() async {
    final path = await getApplicationDocumentsDirectory();
    return await Hive.deleteBoxFromDisk(
      'bookmarks',
      path: path.path,
    );
  }

  @override
  Future deleteValue(String key) async {
    return await box.delete(key);
  }

  @override
  Future getAll() async {
    return box.values.toList();
  }

  @override
  Future set(String key, dynamic value) async {
    return await box.put(key, value);
  }

  @override
  Future get(String key) async {
    return await box.get(key);
  }
}
