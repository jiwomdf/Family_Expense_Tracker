part of 'fcm_bloc.dart';

sealed class FcmState extends Equatable {
  const FcmState();

  @override
  List<Object> get props => [];
}

final class FcmInitial extends FcmState {}

final class FcmLoading extends FcmState {}

final class FcmHasData extends FcmState {
  final bool result;
  const FcmHasData(this.result);
  @override
  List<Object> get props => [result];
}

final class FcmError extends FcmState {
  final String message;
  const FcmError(this.message);
  @override
  List<Object> get props => [message];
}
