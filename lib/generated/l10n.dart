// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `For saving the firestore usage, we're not showing any data yet, you may press the reload button or change the filter to load the data`
  String get forSavingTheFirestoreUsageWereNotShowingAnyData {
    return Intl.message(
      'For saving the firestore usage, we\'re not showing any data yet, you may press the reload button or change the filter to load the data',
      name: 'forSavingTheFirestoreUsageWereNotShowingAnyData',
      desc: '',
      args: [],
    );
  }

  /// `Group Expense Tracker`
  String get appTitle {
    return Intl.message(
      'Group Expense Tracker',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `No record yet, please create one`
  String get noRecordYetPleaseCreateOne {
    return Intl.message(
      'No record yet, please create one',
      name: 'noRecordYetPleaseCreateOne',
      desc: '',
      args: [],
    );
  }

  /// `Data updated, data not showed yet inorder to save the firestore usage`
  String get dataUpdatedDataNotShowedYetInorderToSaveThe {
    return Intl.message(
      'Data updated, data not showed yet inorder to save the firestore usage',
      name: 'dataUpdatedDataNotShowedYetInorderToSaveThe',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// ` has been modified, data not showed yet inorder to save the firestore usage`
  String get hasBeenModifiedDataNotShowedYetInorderToSave {
    return Intl.message(
      ' has been modified, data not showed yet inorder to save the firestore usage',
      name: 'hasBeenModifiedDataNotShowedYetInorderToSave',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Total Data `
  String get totalData {
    return Intl.message(
      'Total Data ',
      name: 'totalData',
      desc: '',
      args: [],
    );
  }

  /// ` data`
  String get data {
    return Intl.message(
      ' data',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `Budget / Month`
  String get budgetMonth {
    return Intl.message(
      'Budget / Month',
      name: 'budgetMonth',
      desc: '',
      args: [],
    );
  }

  /// `Import Expense`
  String get importExpense {
    return Intl.message(
      'Import Expense',
      name: 'importExpense',
      desc: '',
      args: [],
    );
  }

  /// `Step 1. Create data.json file`
  String get step1CreateDatajsonFile {
    return Intl.message(
      'Step 1. Create data.json file',
      name: 'step1CreateDatajsonFile',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to access your account below`
  String get loginToAccessYourAccountBelow {
    return Intl.message(
      'Login to access your account below',
      name: 'loginToAccessYourAccountBelow',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email..`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email..',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter an email`
  String get enterAnEmail {
    return Intl.message(
      'Enter an email',
      name: 'enterAnEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password..`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password..',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a password 6+ chars long`
  String get enterAPassword6CharsLong {
    return Intl.message(
      'Enter a password 6+ chars long',
      name: 'enterAPassword6CharsLong',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Dont have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create ->`
  String get create {
    return Intl.message(
      'Create ->',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Login success`
  String get loginSuccess {
    return Intl.message(
      'Login success',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again`
  String get somethingWentWrongPleaseTryAgain {
    return Intl.message(
      'Something went wrong, please try again',
      name: 'somethingWentWrongPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Create your account below.`
  String get createYourAccountBelow {
    return Intl.message(
      'Create your account below.',
      name: 'createYourAccountBelow',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is not same as password`
  String get confirmPasswordIsNotSameAsPassword {
    return Intl.message(
      'Confirm password is not same as password',
      name: 'confirmPasswordIsNotSameAsPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `<- Already have account?`
  String get alreadyHaveAccount {
    return Intl.message(
      '<- Already have account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Update all expense`
  String get updateAllExpense {
    return Intl.message(
      'Update all expense',
      name: 'updateAllExpense',
      desc: '',
      args: [],
    );
  }

  /// `click the Update all expense button to update each table scheme`
  String get clickTheUpdateAllExpenseButtonToUpdateEachTable {
    return Intl.message(
      'click the Update all expense button to update each table scheme',
      name: 'clickTheUpdateAllExpenseButtonToUpdateEachTable',
      desc: '',
      args: [],
    );
  }

  /// `Update all subCategory`
  String get updateAllSubcategory {
    return Intl.message(
      'Update all subCategory',
      name: 'updateAllSubcategory',
      desc: '',
      args: [],
    );
  }

  /// `Export Expense Data to Spreadsheet`
  String get exportExpenseDataToSpreadsheet {
    return Intl.message(
      'Export Expense Data to Spreadsheet',
      name: 'exportExpenseDataToSpreadsheet',
      desc: '',
      args: [],
    );
  }

  /// `Easily track and manage your expenses with our “Export to Spreadsheet” feature! This tool allows you to export all recorded expenses into a structured Excel spreadsheet, ensuring seamless organization and accessibility. Each expense entry, including details like date, name, category, amount, and parent category, is automatically formatted into a readable table.`
  String get easilyTrackAndManageYourExpensesWithOurExportTo {
    return Intl.message(
      'Easily track and manage your expenses with our “Export to Spreadsheet” feature! This tool allows you to export all recorded expenses into a structured Excel spreadsheet, ensuring seamless organization and accessibility. Each expense entry, including details like date, name, category, amount, and parent category, is automatically formatted into a readable table.',
      name: 'easilyTrackAndManageYourExpensesWithOurExportTo',
      desc: '',
      args: [],
    );
  }

  /// `Download Spread Sheet`
  String get downloadSpreadSheet {
    return Intl.message(
      'Download Spread Sheet',
      name: 'downloadSpreadSheet',
      desc: '',
      args: [],
    );
  }

  /// `The feature currently only works on web`
  String get theFeatureCurrentlyOnlyWorksOnWeb {
    return Intl.message(
      'The feature currently only works on web',
      name: 'theFeatureCurrentlyOnlyWorksOnWeb',
      desc: '',
      args: [],
    );
  }

  /// `Export the Json Formatted expense`
  String get exportTheJsonFormattedExpense {
    return Intl.message(
      'Export the Json Formatted expense',
      name: 'exportTheJsonFormattedExpense',
      desc: '',
      args: [],
    );
  }

  /// `Export the expense data`
  String get exportTheExpenseData {
    return Intl.message(
      'Export the expense data',
      name: 'exportTheExpenseData',
      desc: '',
      args: [],
    );
  }

  /// `Export Expense to Json`
  String get exportExpenseToJson {
    return Intl.message(
      'Export Expense to Json',
      name: 'exportExpenseToJson',
      desc: '',
      args: [],
    );
  }

  /// `Export Expense as Spread Sheet`
  String get exportExpenseAsSpreadSheet {
    return Intl.message(
      'Export Expense as Spread Sheet',
      name: 'exportExpenseAsSpreadSheet',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Group Expense Tracker, this app is designed to simplify tracking expense and enable effortless sharing \nof expenses among multiple users. It is available across Android, iOS, and Web platforms.`
  String get welcomeToGroupExpenseTrackerThisAppIsDesignedTo {
    return Intl.message(
      'Welcome to Group Expense Tracker, this app is designed to simplify tracking expense and enable effortless sharing \\nof expenses among multiple users. It is available across Android, iOS, and Web platforms.',
      name: 'welcomeToGroupExpenseTrackerThisAppIsDesignedTo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
