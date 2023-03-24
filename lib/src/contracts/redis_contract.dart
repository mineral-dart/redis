abstract class RedisContract {
  Future<dynamic> get (String key);
  Future<void> set (String key, String value);
}