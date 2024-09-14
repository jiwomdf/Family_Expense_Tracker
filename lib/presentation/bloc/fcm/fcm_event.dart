part of 'fcm_bloc.dart';

sealed class FcmEvent extends Equatable {
  const FcmEvent();

  @override
  List<Object> get props => [];
}

class PostFcmEvent extends FcmEvent {
  final SendFcmRequest sendFcmRequest;

  const PostFcmEvent(this.sendFcmRequest);

  @override
  List<Object> get props => [sendFcmRequest];
}
