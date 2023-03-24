abstract class RedisContract {
  Future<dynamic> get (String key);
  Future<void> set (String key, String value);
  Future<void> del (String key);
  Future<void> incr (String key, value);
}