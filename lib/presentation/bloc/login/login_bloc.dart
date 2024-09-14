import 'package:bloc/bloc.dart';
import 'package:core/domain/model/user_model.dart';
import 'package:core/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<GetLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await authRepository.login(event.email, event.password);

      result.fold(
        (failure) {
          emit(LoginError(failure.message));
        },
        (data) {
          emit(LoginHasData(data));
        },
      );
    });
  }
}
