part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
  @override
  List<Object> get props => [message];
}

class LoginHasData extends LoginState {
  final UserDataModel result;
  const LoginHasData(this.result);
  @override
  List<Object> get props => [result];
}
