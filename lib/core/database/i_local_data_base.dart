abstract class ILocalDataBase {
  Future deleteValue(String key);
  Future deleteAll();
  Future get(String key);
  Future getAll();
  Future set(String key, dynamic value);
}
