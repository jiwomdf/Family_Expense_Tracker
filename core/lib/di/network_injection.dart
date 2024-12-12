import 'package:core/data/network/api_service.dart';
import 'package:core/data/network/dio_factory.dart';
import 'package:core/data/network/network_info.dart';
import 'package:core/di/repository_injection.dart';
import 'package:core/util/platform_util.dart';
import 'package:core/util/poultry_registery.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> init() async {
  PoultryRegistry.safeRegisterSingleton<Client>(http.Client());

  if (!PlatformUtil.isWeb()) {
    PoultryRegistry.safeRegisterSingleton<NetworkInfo>(
        NetworkInfoImpl(InternetConnectionChecker()));
  }

  PoultryRegistry.safeRegisterSingleton<DioFactory>(DioFactory());

  final dio = await locator<DioFactory>().getDio();
  PoultryRegistry.safeRegisterSingleton<ApiService>(ApiService(dio));
}
