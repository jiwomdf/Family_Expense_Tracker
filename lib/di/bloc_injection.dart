import 'package:family_expense_tracker/presentation/bloc/category/category_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/fcm/fcm_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/login/login_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/logout/logout_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/register/register_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/usermodel/userdatamodel_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => RegisterBloc(locator()));
  locator.registerFactory(() => LogoutBloc(locator()));
  locator.registerFactory(() => UserDataModelBloc(locator()));
  locator.registerFactory(() => ExpenseBloc(locator()));
  locator.registerFactory(() => CategoryBloc(locator()));
  locator.registerFactory(() => SubcategoryBloc(locator()));
  locator.registerFactory(() => FcmBloc(locator()));
}
