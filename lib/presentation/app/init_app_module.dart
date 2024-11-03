import 'package:core/di/deps_injection.dart' as di_deps;
import 'package:core/di/network_injection.dart' as di_network;
import 'package:core/di/repository_injection.dart' as di_repository;
import 'package:family_expense_tracker/di/bloc_injection.dart' as di_bloc;

Future<void> initAppModule() async {
  await di_network.init();
  await di_deps.init();
  di_repository.init();
  di_bloc.init();
}
