import 'package:bloc/bloc.dart';
import 'package:core/data/pref/firebase_options_pref.dart';
import 'package:core/domain/model/firebase_options_android_model.dart';
import 'package:core/domain/model/firebase_options_ios_model.dart';
import 'package:core/domain/model/firebase_options_web_model.dart';
import 'package:equatable/equatable.dart';

part 'setting_firebase_event.dart';
part 'setting_firebase_state.dart';

class SettingFirebaseBloc
    extends Bloc<SettingFirebaseEvent, SettingFirebaseState> {
  final FirebaseOptionsPref _firebaseOptionsPref;

  SettingFirebaseBloc(this._firebaseOptionsPref)
      : super(SettingFirebaseInitial()) {
    on<GetSettingFirebaseAndroidEvent>((event, emit) async {
      var data = await _firebaseOptionsPref.getFirebaseOptionsModelAndroid();

      data.fold((l) {
        emit(SettingFirebaseInitial());
      }, (r) {
        emit(SettingFirebaseAndroidHasData(r));
      });
    });

    on<SetSettingFirebaseAndroidEvent>((event, emit) async {
      var result = await _firebaseOptionsPref
          .setFirebaseOptionsModelAndroid(event.firebaseOptionsAndroidModel);

      if (result) {
        emit(SettingFirebaseUpdated());
      }
    });

    on<GetSettingFirebaseIOSEvent>((event, emit) async {
      var data = await _firebaseOptionsPref.getFirebaseOptionsModeliOS();

      data.fold((l) {
        emit(SettingFirebaseInitial());
      }, (r) {
        emit(SettingFirebaseIOSHasData(r));
      });
    });

    on<SetSettingFirebaseIOSEvent>((event, emit) async {
      var result = await _firebaseOptionsPref
          .setFirebaseOptionsModeliOS(event.firebaseOptionsIOSModel);

      if (result) {
        emit(SettingFirebaseUpdated());
      }
    });

    on<GetSettingFirebaseWebEvent>((event, emit) async {
      var data = await _firebaseOptionsPref.getFirebaseOptionsModelWeb();

      data.fold((l) {
        emit(SettingFirebaseInitial());
      }, (r) {
        emit(SettingFirebaseWebHasData(r));
      });
    });

    on<SetSettingFirebaseWebEvent>((event, emit) async {
      var result = await _firebaseOptionsPref
          .setFirebaseOptionsModelWeb(event.firebaseOptionsWebModel);

      if (result) {
        emit(SettingFirebaseUpdated());
      }
    });
  }
}
