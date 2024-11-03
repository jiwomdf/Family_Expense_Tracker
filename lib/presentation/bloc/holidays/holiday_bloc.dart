import 'package:bloc/bloc.dart';
import 'package:core/data/network/response/holiday_response.dart';
import 'package:core/repository/holiday_repository.dart';
import 'package:equatable/equatable.dart';

part 'holiday_event.dart';
part 'holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  final HolidayRepository _holidayRepository;

  HolidayBloc(this._holidayRepository) : super(HolidayLoading()) {
    on<GetHolidayEvent>((event, emit) async {
      var holidays =
          await _holidayRepository.getHolidays(event.year, event.countryCode);

      holidays.fold((failure) {
        emit(HolidayError(failure.message));
      }, (data) {
        emit(HolidayHasData(data));
      });
    });
  }
}
