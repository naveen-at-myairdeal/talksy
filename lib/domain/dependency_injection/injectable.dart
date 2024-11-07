import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

final getItLocator = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getItLocator, environment: Environment.prod);
}
