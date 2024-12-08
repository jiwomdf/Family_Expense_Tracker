import 'package:core/domain/model/user_model.dart';
import 'package:core/repository/auth_repository.dart';
import 'package:family_expense_tracker/di/bloc_injection.dart' as di;
import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/category/category_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/fcm/fcm_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/holidays/holiday_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/login/login_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/logout/logout_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/register/register_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/usermodel/userdatamodel_bloc.dart';
import 'package:family_expense_tracker/presentation/page/auth_wrapper.dart';
import 'package:family_expense_tracker/router.dart';
import 'package:family_expense_tracker/util/app_color_util.dart';
import 'package:family_expense_tracker/util/route_observers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();

  static AppState of(BuildContext context) =>
      context.findAncestorStateOfType<AppState>()!;
}

class AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.light;
  final _getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_themeMode == ThemeMode.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light);

    return StreamProvider<UserModel?>.value(
      value: _getIt<AuthRepository>().user,
      initialData: null,
      child: MultiProvider(
        providers: [
          BlocProvider(create: (_) => di.locator<LoginBloc>()),
          BlocProvider(create: (_) => di.locator<RegisterBloc>()),
          BlocProvider(create: (_) => di.locator<LogoutBloc>()),
          BlocProvider(create: (_) => di.locator<UserDataModelBloc>()),
          BlocProvider(create: (_) => di.locator<ExpenseBloc>()),
          BlocProvider(create: (_) => di.locator<CategoryBloc>()),
          BlocProvider(create: (_) => di.locator<SubcategoryBloc>()),
          BlocProvider(create: (_) => di.locator<FcmBloc>()),
          BlocProvider(create: (_) => di.locator<HolidayBloc>()),
        ],
        child: initMaterialApp(),
      ),
    );
  }

  MaterialApp initMaterialApp() {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: const [
        Locale('en'), // English
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.blue.bgDarkBlue,
        scaffoldBackgroundColor: AppColors.white.primary,
        cardColor: AppColors.purple.bgLightPurple,
        canvasColor: AppColors.purple.bgLightPurple,
        dialogBackgroundColor: AppColors.white.primary,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: AppColors.blue.bgDarkBlue,
        cardColor: AppColors.blue.bgCardDarkBlue,
        canvasColor: AppColors.blue.bgCardDarkBlue,
        dialogBackgroundColor: AppColors.blue.bgDarkBlue,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark, // <-- the only line added
          seedColor: AppColors.blue.bgDarkBlue,
        ),
      ),
      themeMode: _themeMode,
      home: const AuthWrapper(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) => router(settings),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  bool isLightMode() => _themeMode == ThemeMode.light;
}
