part of 'holiday_bloc.dart';

sealed class HolidayEvent extends Equatable {
  const HolidayEvent();

  @override
  List<Object> get props => [];
}

class GetHolidayEvent extends HolidayEvent {
  final int year;
  final String countryCode;

  const GetHolidayEvent(this.year, this.countryCode);

  @override
  List<Object> get props => [];
}
