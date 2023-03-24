# 📦 Redis

The redis module was designed exclusively for the Mineral framework.

## Install module
```sh
dart pub add mineral_redis_context.dart
```

## Environment
```dotenv
REDIS_HOST: 127.0.0.1
REDIS_PORT: 6379
REDIS_PASSWORD:
```

## Register module
After installing the module, please register it within `./src/main.dart` following the scheme below

```dart
import 'package:mineral_mongodb/mineral_redis_context.dart.dart';

Future<void> main() async {
  final redis = Redis();

  Kernel kernel = Kernel()
    ..intents.defined(all: true)
    ..plugins.register([redis]);

  await kernel.init();
}
```

## Usage

Here is a sample code that shows how to use Mineral Dart's Redis library:

```dart
import 'dart:async';

import 'package:mineral/core/api.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/events.dart';
import 'package:mineral_redis/mineral_redis.dart';

class Ready extends MineralEvent<ReadyEvent> with Redis {
  
  // Registers a new key-value
  await redis.set('name', 'Toto');

  // Get the value for the 'name' key
  final value = await redis.get('name');
  print(value)
  
  // Deleted a key
  await redis.del('name');
}

```