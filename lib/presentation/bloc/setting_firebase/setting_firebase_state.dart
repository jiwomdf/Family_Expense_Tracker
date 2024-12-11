part of 'setting_firebase_bloc.dart';

sealed class SettingFirebaseState extends Equatable {
  const SettingFirebaseState();

  @override
  List<Object> get props => [];
}

final class SettingFirebaseInitial extends SettingFirebaseState {}

final class SettingFirebaseUpdated extends SettingFirebaseState {}

final class SettingFirebaseAndroidHasData extends SettingFirebaseState {
  final FirebaseOptionsAndroidModel firebaseOptionsModel;

  const SettingFirebaseAndroidHasData(this.firebaseOptionsModel);

  @override
  List<Object> get props => [firebaseOptionsModel];
}

final class SettingFirebaseIOSHasData extends SettingFirebaseState {
  final FirebaseOptionsIOSModel firebaseOptionsModel;

  const SettingFirebaseIOSHasData(this.firebaseOptionsModel);

  @override
  List<Object> get props => [firebaseOptionsModel];
}

final class SettingFirebaseWebHasData extends SettingFirebaseState {
  final FirebaseOptionsWebModel firebaseOptionsModel;

  const SettingFirebaseWebHasData(this.firebaseOptionsModel);

  @override
  List<Object> get props => [firebaseOptionsModel];
}
