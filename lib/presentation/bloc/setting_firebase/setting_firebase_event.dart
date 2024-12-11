part of 'setting_firebase_bloc.dart';

sealed class SettingFirebaseEvent extends Equatable {
  const SettingFirebaseEvent();

  @override
  List<Object> get props => [];
}

class GetSettingFirebaseAndroidEvent extends SettingFirebaseEvent {
  const GetSettingFirebaseAndroidEvent();

  @override
  List<Object> get props => [];
}

class SetSettingFirebaseAndroidEvent extends SettingFirebaseEvent {
  final FirebaseOptionsAndroidModel firebaseOptionsAndroidModel;
  const SetSettingFirebaseAndroidEvent(this.firebaseOptionsAndroidModel);

  @override
  List<Object> get props => [];
}

class GetSettingFirebaseIOSEvent extends SettingFirebaseEvent {
  const GetSettingFirebaseIOSEvent();

  @override
  List<Object> get props => [];
}

class SetSettingFirebaseIOSEvent extends SettingFirebaseEvent {
  final FirebaseOptionsIOSModel firebaseOptionsIOSModel;
  const SetSettingFirebaseIOSEvent(this.firebaseOptionsIOSModel);

  @override
  List<Object> get props => [];
}

class GetSettingFirebaseWebEvent extends SettingFirebaseEvent {
  const GetSettingFirebaseWebEvent();

  @override
  List<Object> get props => [];
}

class SetSettingFirebaseWebEvent extends SettingFirebaseEvent {
  final FirebaseOptionsWebModel firebaseOptionsWebModel;
  const SetSettingFirebaseWebEvent(this.firebaseOptionsWebModel);

  @override
  List<Object> get props => [];
}
