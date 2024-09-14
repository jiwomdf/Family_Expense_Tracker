part of 'userdatamodel_bloc.dart';

sealed class UserDataModelEvent extends Equatable {
  const UserDataModelEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataModelEvent extends UserDataModelEvent {
  const GetUserDataModelEvent();

  @override
  List<Object> get props => [];
}
