import 'package:family_expense_tracker/di/bloc_injection.dart' as di;
import 'package:family_expense_tracker/presentation/bloc/login/login_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/register/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var listPovider = [
  BlocProvider(create: (_) => di.locator<LoginBloc>()),
  BlocProvider(create: (_) => di.locator<RegisterBloc>()),
];
