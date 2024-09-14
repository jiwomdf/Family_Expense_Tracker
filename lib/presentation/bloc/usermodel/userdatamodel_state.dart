part of 'userdatamodel_bloc.dart';

sealed class UserDataModelState extends Equatable {
  const UserDataModelState();

  @override
  List<Object> get props => [];
}

final class UserDataModelLoading extends UserDataModelState {}

class UserDataModelError extends UserDataModelState {
  final String message;
  const UserDataModelError(this.message);
  @override
  List<Object> get props => [message];
}

class UserDataModelHasData extends UserDataModelState {
  final UserDataModel result;
  const UserDataModelHasData(this.result);
  @override
  List<Object> get props => [result];
}
