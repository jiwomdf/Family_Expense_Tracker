import 'package:bloc/bloc.dart';
import 'package:core/domain/model/user_model.dart';
import 'package:core/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'userdatamodel_event.dart';
part 'userdatamodel_state.dart';

class UserDataModelBloc extends Bloc<UserDataModelEvent, UserDataModelState> {
  final AuthRepository _authRepository;

  UserDataModelBloc(this._authRepository) : super(UserDataModelLoading()) {
    on<GetUserDataModelEvent>((event, emit) async {
      emit(UserDataModelLoading());
      final result = await _authRepository.getUserDataModel();
      result.fold(
        (failure) {
          emit(UserDataModelError(failure.message));
        },
        (data) {
          emit(UserDataModelHasData(data));
        },
      );
    });
  }
}
