import 'package:core/di/deps_injection.dart' as di_deps;
import 'package:core/di/network_injection.dart' as di_network;
import 'package:core/di/repository_injection.dart' as di_repository;
import 'package:flutter/material.dart';
import 'package:group_expense_tracker/di/bloc_injection.dart' as di_bloc;

Future<void> initAppModule() async {
  try {
    await di_network.init();
    await di_deps.init();
    await di_repository.init();
    await di_bloc.init();
  } catch (e) {
    debugPrint(e.toString());
  }
}
