import 'package:core/util/poultry_registery.dart';
import 'package:family_expense_tracker/presentation/bloc/category/category_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/fcm/fcm_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/holidays/holiday_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/login/login_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/logout/logout_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/register/register_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/usermodel/userdatamodel_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  PoultryRegistry.safeRegister<LoginBloc>(LoginBloc(locator()));
  PoultryRegistry.safeRegister<RegisterBloc>(RegisterBloc(locator()));
  PoultryRegistry.safeRegister<LogoutBloc>(LogoutBloc(locator()));
  PoultryRegistry.safeRegister<UserDataModelBloc>(UserDataModelBloc(locator()));
  PoultryRegistry.safeRegister<ExpenseBloc>(ExpenseBloc(locator()));
  PoultryRegistry.safeRegister<CategoryBloc>(CategoryBloc(locator()));
  PoultryRegistry.safeRegister<SubcategoryBloc>(SubcategoryBloc(locator()));
  PoultryRegistry.safeRegister<FcmBloc>(FcmBloc(locator()));
  PoultryRegistry.safeRegister<HolidayBloc>(HolidayBloc(locator()));
}
