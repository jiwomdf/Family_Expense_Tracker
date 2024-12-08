import 'package:bloc/bloc.dart';
import 'package:core/data/network/request/send_fcm_request.dart';
import 'package:core/repository/fcm_repository.dart';
import 'package:equatable/equatable.dart';

part 'fcm_event.dart';
part 'fcm_state.dart';

class FcmBloc extends Bloc<FcmEvent, FcmState> {
  final FcmRepository _fcmRepository;

  FcmBloc(this._fcmRepository) : super(FcmLoading()) {
    on<PostFcmEvent>((event, emit) async {
      emit(FcmLoading());
      final result = await _fcmRepository.sendFcm(event.sendFcmRequest);

      result.fold(
        (failure) {
          emit(FcmError(failure.message));
        },
        (data) {
          emit(FcmHasData(data));
        },
      );
    });
  }
}
