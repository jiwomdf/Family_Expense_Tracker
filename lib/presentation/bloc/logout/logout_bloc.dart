import 'package:bloc/bloc.dart';
import 'package:core/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepository authRepository;

  LogoutBloc(this.authRepository) : super(LogoutInitial()) {
    on<GetLogoutEvent>((event, emit) async {
      emit(LogoutLoading());
      await authRepository.logout();
      emit(const LogoutHasData());
    });
  }
}
