import 'package:redis/redis.dart';

class RedisGateway {
  final String _uri;
  final int _port;
  late final redisConnection;

  RedisGateway(this._uri, this._port);

  String get uri => _uri;

  Future<void> open () async {
    redisConnection = await RedisConnection().connect(_uri, _port);
  }

  Future<Object> get (String key) async {
    return redisConnection.get(key);
  }

  Future<void> close () async {
    redisConnection.close();
  }
}