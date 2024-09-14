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

  /// `Family Expense Tracker`
  String get appTitle {
    return Intl.message(
      'Family Expense Tracker',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Family Expense Tracker`
  String get familyExpenseTracker {
    return Intl.message(
      'Family Expense Tracker',
      name: 'familyExpenseTracker',
      desc: '',
      args: [],
    );
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

  /// `Export Expense`
  String get exportExpense {
    return Intl.message(
      'Export Expense',
      name: 'exportExpense',
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

  /// `Click the button below to export the expense data`
  String get clickTheButtonBelowToExportTheExpenseData {
    return Intl.message(
      'Click the button below to export the expense data',
      name: 'clickTheButtonBelowToExportTheExpenseData',
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

  /// `Export the download expense`
  String get exportTheDownloadExpense {
    return Intl.message(
      'Export the download expense',
      name: 'exportTheDownloadExpense',
      desc: '',
      args: [],
    );
  }

  /// `Category Inserted`
  String get categoryInserted {
    return Intl.message(
      'Category Inserted',
      name: 'categoryInserted',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category name..`
  String get categoryName {
    return Intl.message(
      'Category name..',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `Category cannot be empty`
  String get categoryCannotBeEmpty {
    return Intl.message(
      'Category cannot be empty',
      name: 'categoryCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Insert`
  String get insert {
    return Intl.message(
      'Insert',
      name: 'insert',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category Inserted`
  String get subCategoryInserted {
    return Intl.message(
      'Sub Category Inserted',
      name: 'subCategoryInserted',
      desc: '',
      args: [],
    );
  }

  /// `Add Sub Category`
  String get addSubCategory {
    return Intl.message(
      'Add Sub Category',
      name: 'addSubCategory',
      desc: '',
      args: [],
    );
  }

  /// `Choose color`
  String get chooseColor {
    return Intl.message(
      'Choose color',
      name: 'chooseColor',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category name..`
  String get subCategoryName {
    return Intl.message(
      'Sub Category name..',
      name: 'subCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category cannot be empty`
  String get subCategoryCannotBeEmpty {
    return Intl.message(
      'Sub Category cannot be empty',
      name: 'subCategoryCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get form {
    return Intl.message(
      'Form',
      name: 'form',
      desc: '',
      args: [],
    );
  }

  /// `Update expense`
  String get updateExpense {
    return Intl.message(
      'Update expense',
      name: 'updateExpense',
      desc: '',
      args: [],
    );
  }

  /// `Add expense`
  String get addExpense {
    return Intl.message(
      'Add expense',
      name: 'addExpense',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Expense date`
  String get expenseDate {
    return Intl.message(
      'Expense date',
      name: 'expenseDate',
      desc: '',
      args: [],
    );
  }

  /// `Expense Name..`
  String get expenseName {
    return Intl.message(
      'Expense Name..',
      name: 'expenseName',
      desc: '',
      args: [],
    );
  }

  /// `Note cannot be empty`
  String get noteCannotBeEmpty {
    return Intl.message(
      'Note cannot be empty',
      name: 'noteCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Price..`
  String get price {
    return Intl.message(
      'Price..',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Rp `
  String get rp {
    return Intl.message(
      'Rp ',
      name: 'rp',
      desc: '',
      args: [],
    );
  }

  /// `Price should be grater than Rp 100`
  String get priceShouldBeGraterThanRp100 {
    return Intl.message(
      'Price should be grater than Rp 100',
      name: 'priceShouldBeGraterThanRp100',
      desc: '',
      args: [],
    );
  }

  /// `Category name is empty`
  String get categoryNameIsEmpty {
    return Intl.message(
      'Category name is empty',
      name: 'categoryNameIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Category color is empty`
  String get categoryColorIsEmpty {
    return Intl.message(
      'Category color is empty',
      name: 'categoryColorIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category name is empty`
  String get subCategoryNameIsEmpty {
    return Intl.message(
      'Sub Category name is empty',
      name: 'subCategoryNameIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category color is empty`
  String get subCategoryColorIsEmpty {
    return Intl.message(
      'Sub Category color is empty',
      name: 'subCategoryColorIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Date is empty`
  String get dateIsEmpty {
    return Intl.message(
      'Date is empty',
      name: 'dateIsEmpty',
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

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `has been modified, data not showed yet inorder to save the firestore usage`
  String get hasBeenModifiedDataNotShowedYetInorderToSave {
    return Intl.message(
      'has been modified, data not showed yet inorder to save the firestore usage',
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

  /// `Sub Category`
  String get subCategory {
    return Intl.message(
      'Sub Category',
      name: 'subCategory',
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

  /// `create a file name`
  String get createAFileName {
    return Intl.message(
      'create a file name',
      name: 'createAFileName',
      desc: '',
      args: [],
    );
  }

  /// `data.json`
  String get datajson {
    return Intl.message(
      'data.json',
      name: 'datajson',
      desc: '',
      args: [],
    );
  }

  /// `, then make sure to fill the json format like this markdown below`
  String get thenMakeSureToFillTheJsonFormatLikeThis {
    return Intl.message(
      ', then make sure to fill the json format like this markdown below',
      name: 'thenMakeSureToFillTheJsonFormatLikeThis',
      desc: '',
      args: [],
    );
  }

  /// `Step 2. Place the data.json file in the assets/import folder`
  String get step2PlaceTheDatajsonFileInTheAssetsimportFolder {
    return Intl.message(
      'Step 2. Place the data.json file in the assets/import folder',
      name: 'step2PlaceTheDatajsonFileInTheAssetsimportFolder',
      desc: '',
      args: [],
    );
  }

  /// `Place your json file in`
  String get placeYourJsonFileIn {
    return Intl.message(
      'Place your json file in',
      name: 'placeYourJsonFileIn',
      desc: '',
      args: [],
    );
  }

  /// `./assets/import/data.json \n\n`
  String get assetsimportdatajsonNn {
    return Intl.message(
      './assets/import/data.json \\n\\n',
      name: 'assetsimportdatajsonNn',
      desc: '',
      args: [],
    );
  }

  /// `Step 3. Press this import button below`
  String get step3PressThisImportButtonBelow {
    return Intl.message(
      'Step 3. Press this import button below',
      name: 'step3PressThisImportButtonBelow',
      desc: '',
      args: [],
    );
  }

  /// `If the above requirement already complete, press the below button to start import the data`
  String get ifTheAboveRequirementAlreadyCompletePressTheBelowButton {
    return Intl.message(
      'If the above requirement already complete, press the below button to start import the data',
      name: 'ifTheAboveRequirementAlreadyCompletePressTheBelowButton',
      desc: '',
      args: [],
    );
  }

  /// `Import data.json from /assets/import`
  String get importDatajsonFromAssetsimport {
    return Intl.message(
      'Import data.json from /assets/import',
      name: 'importDatajsonFromAssetsimport',
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

  /// `Confirm your password..`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm your password..',
      name: 'confirmYourPassword',
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

  /// `Update Collection Scheme`
  String get updateCollectionScheme {
    return Intl.message(
      'Update Collection Scheme',
      name: 'updateCollectionScheme',
      desc: '',
      args: [],
    );
  }

  /// `You can update scheme objects in the Firestore collection by modifying the content of the func() in lib/util/scheme/ classes`
  String get youCanUpdateSchemeObjectsInTheFirestoreCollectionBy {
    return Intl.message(
      'You can update scheme objects in the Firestore collection by modifying the content of the func() in lib/util/scheme/ classes',
      name: 'youCanUpdateSchemeObjectsInTheFirestoreCollectionBy',
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

  /// `Update all expense`
  String get updateAllExpense {
    return Intl.message(
      'Update all expense',
      name: 'updateAllExpense',
      desc: '',
      args: [],
    );
  }

  /// `click the Update all category button to update each table scheme`
  String get clickTheUpdateAllCategoryButtonToUpdateEachTable {
    return Intl.message(
      'click the Update all category button to update each table scheme',
      name: 'clickTheUpdateAllCategoryButtonToUpdateEachTable',
      desc: '',
      args: [],
    );
  }

  /// `Update all category`
  String get updateAllCategory {
    return Intl.message(
      'Update all category',
      name: 'updateAllCategory',
      desc: '',
      args: [],
    );
  }

  /// `click the Update all subCategory button to update each table scheme`
  String get clickTheUpdateAllSubcategoryButtonToUpdateEachTable {
    return Intl.message(
      'click the Update all subCategory button to update each table scheme',
      name: 'clickTheUpdateAllSubcategoryButtonToUpdateEachTable',
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

  /// `Choose one`
  String get chooseOne {
    return Intl.message(
      'Choose one',
      name: 'chooseOne',
      desc: '',
      args: [],
    );
  }

  /// `Import Data`
  String get importData {
    return Intl.message(
      'Import Data',
      name: 'importData',
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
