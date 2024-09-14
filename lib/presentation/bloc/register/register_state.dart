part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);
  @override
  List<Object> get props => [message];
}

class RegisterHasData extends RegisterState {
  final bool result;
  const RegisterHasData(this.result);
  @override
  List<Object> get props => [result];
}
