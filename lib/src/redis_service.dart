import 'package:mineral_environment/environment.dart';
import 'package:mineral_package/mineral_package.dart';
import 'package:mineral_redis/src/connections/redis_gateway.dart';
import 'package:mineral_redis/src/contracts/redis_contract.dart';

class RedisService extends MineralPackage {
  @override
  String namespace = 'Mineral/Plugins/Redis';

  @override
  String label = 'Redis';

  @override
  String description = 'The redis module was designed exclusively for the Mineral framework.';

  late RedisGateway redisGateway;



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