import 'package:mineral_contract/mineral_contract.dart';
import 'package:mineral_environment/environment.dart';
import 'package:mineral_redis/src/connections/redis_gateway.dart';

class RedisService extends MineralPackageContract {
  late RedisGateway redisGateway;

  RedisService(): super ('Redis', 'The redis module was designed exclusively for the Mineral framework.');

  @override
  Future<void> init () async {
    final environment = container.use<MineralEnvironment>();
    redisGateway = RedisGateway(
        environment.getOrFail('REDIS_URL', message: 'The redis url was not provided'),
        int.parse(environment.getOrFail('REDIS_PORT', message: 'The redis port was not provided'))
    );

    await open();
  }

  Future<void> open () async {
    await redisGateway.open();
    print('Redis connected !');
  }

}