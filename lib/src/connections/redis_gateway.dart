import 'package:redis/redis.dart';

class RedisGateway {
  final String _uri;
  final int _port;
  late final RedisConnection redisConnection;

  RedisGateway(this._uri, this._port);

  String get uri => _uri;

  Future<void> open () async {
    redisConnection = RedisConnection();
    redisConnection.connect(_uri, _port);
  }

  Future<void> close () async {
    redisConnection.close();
  }
}