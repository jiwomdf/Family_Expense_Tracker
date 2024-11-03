part of 'holiday_bloc.dart';

sealed class HolidayState extends Equatable {
  const HolidayState();

  @override
  List<Object> get props => [];
}

final class HolidayLoading extends HolidayState {}

class HolidayError extends HolidayState {
  final String message;

  const HolidayError(this.message);

  @override
  List<Object> get props => [message];
}

class HolidayHasData extends HolidayState {
  final List<HolidayResponse> result;

  const HolidayHasData(this.result);

  @override
  List<Object> get props => [];
}
