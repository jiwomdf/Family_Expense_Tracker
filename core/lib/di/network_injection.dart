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
  PoultryRegistry.safeRegister<Client>(http.Client());

  if (!PlatformUtil.isWeb()) {
    PoultryRegistry.safeRegister<NetworkInfo>(
        NetworkInfoImpl(InternetConnectionChecker()));
  }

  PoultryRegistry.safeRegister<DioFactory>(DioFactory());

  final dio = await locator<DioFactory>().getDio();
  PoultryRegistry.safeRegister<ApiService>(ApiService(dio));
}
