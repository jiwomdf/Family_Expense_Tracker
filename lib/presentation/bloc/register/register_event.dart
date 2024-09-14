part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class GetRegisterEvent extends RegisterEvent {
  final String email;
  final String password;

  const GetRegisterEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
