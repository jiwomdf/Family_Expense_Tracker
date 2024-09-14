import 'package:core/domain/model/user_model.dart';
import 'package:core/repository/auth_repository.dart';
import 'package:family_expense_tracker/di/bloc_injection.dart' as di;
import 'package:family_expense_tracker/di/bloc_injection.dart' as di_bloc;
import 'package:family_expense_tracker/di/deps_injection.dart' as di_deps;
import 'package:family_expense_tracker/di/repository_injection.dart'
    as di_repository;
import 'package:family_expense_tracker/firebase_options.dart';
import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/category/category_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/fcm/fcm_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/login/login_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/logout/logout_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/register/register_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/usermodel/userdatamodel_bloc.dart';
import 'package:family_expense_tracker/presentation/page/auth_wrapper.dart';
import 'package:family_expense_tracker/presentation/page/home/fcm_background_handler.dart';
import 'package:family_expense_tracker/router.dart';
import 'package:family_expense_tracker/util/app_color_util.dart';
import 'package:family_expense_tracker/util/route_observers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "enter_your_api_key",
        authDomain: "enter_your_auth_domain",
        projectId: "enter_your_project_id",
        storageBucket: "enter_your_storage_bucket",
        messagingSenderId: "enter_your_messaging_sender_id",
        appId: "enter_your_app_id",
        measurementId: "enter_your_measurement_id",
      ),
    );
  } else {
    await Firebase.initializeApp(
      name: "test",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  FcmBackgroundHandler().init();

  di_deps.init();
  di_bloc.init();
  di_repository.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  final getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_themeMode == ThemeMode.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light);

    return StreamProvider<UserModel?>.value(
      value: getIt<AuthRepository>().user,
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
