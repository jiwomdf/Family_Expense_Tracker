import 'package:bloc/bloc.dart';
import 'package:core/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc(this.authRepository) : super(RegisterInitial()) {
    on<GetRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await authRepository.register(event.email, event.password);

      result.fold(
        (failure) {
          emit(RegisterError(failure.message));
        },
        (data) {
          emit(RegisterHasData(data));
        },
      );
    });
  }
}
