import 'package:mineral_ioc/ioc.dart';
import 'package:mineral_redis/src/contracts/redis_contract.dart';
import 'package:mineral_redis/src/redis_service.dart';

mixin Redis {
  RedisService _getPlugin() {
    final dynamic pluginManager = ioc.services.entries.firstWhere((element) => element.key.toString() == 'PluginServiceCraft').value;
    return pluginManager.use<RedisService>();
  }

  RedisContract get redis => _getPlugin().redisGateway;
}