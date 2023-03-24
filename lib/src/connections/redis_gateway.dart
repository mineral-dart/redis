import 'package:mineral_redis/src/contracts/redis_contract.dart';
import 'package:redis/redis.dart';

class RedisGateway implements RedisContract {
  final String _uri;
  final int _port;
  late final redisConnection;

  RedisGateway(this._uri, this._port);

  String get uri => _uri;

  Future<void> open () async {
    redisConnection = await RedisConnection().connect(_uri, _port);
  }

  Future<void> close () async {
    redisConnection.close();
  }

  @override
  Future<dynamic> get(String key) async {
    return await redisConnection.get(key);
  }
}