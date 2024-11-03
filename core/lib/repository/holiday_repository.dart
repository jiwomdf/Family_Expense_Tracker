import 'package:core/data/network/api_service.dart';
import 'package:core/data/network/error_handler.dart';
import 'package:core/data/network/http_failure.dart';
import 'package:core/data/network/response/holiday_response.dart';
import 'package:dartz/dartz.dart';

class HolidayRepository {
  final ApiService _apiService;

  HolidayRepository(this._apiService);

  Future<Either<HttpFailure, List<HolidayResponse>>> getHolidays(
      int year, String countryCode) async {
    try {
      final response =
          await _apiService.get(endPoint: "PublicHolidays/$year/$countryCode");
      final data = HolidayResponse.toListMap(response.data);
      return Right(data);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
