# 📦 Redis

The redis module was designed exclusively for the Mineral framework.

## Install module
```sh
dart pub add mineral_redis
```

## Register module
After installing the module, please register it within `./src/main.dart` following the scheme below

```dart
import 'package:mineral_mongodb/mineral_redis.dart';

Future<void> main() async {
  final redis = Redis();

  Kernel kernel = Kernel()
    ..intents.defined(all: true)
    ..plugins.register([redis]);

  await kernel.init();
}
```