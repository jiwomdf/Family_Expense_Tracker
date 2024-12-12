import 'package:core/di/repository_injection.dart';
import 'package:get_it/get_it.dart';

class PoultryRegistry<T extends Object> {
  static void safeRegisterSingleton<T extends Object>(T model) {
    if (!locator.isRegistered<T>()) {
      locator.registerSingleton<T>(model, signalsReady: true);
    }
  }

  static void safeRegisterFactory<T extends Object>(FactoryFunc<T> model) {
    locator.registerFactory<T>(model);
  }

  static void register<T extends Object>(T model) {
    locator.registerSingleton<T>(model, signalsReady: true);
  }

  static void remove<T extends Object>(T model) {
    locator.unregister<T>(instance: model);
  }

  static T getIt<T extends Object>() {
    return locator.get<T>();
  }
}
