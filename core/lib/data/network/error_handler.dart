import 'package:core/data/network/http_failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late HttpFailure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handDioleError(error);
    } else {
      // default error
      failure = _handleError(error, DataSource.defaultError);
    }
  }

  HttpFailure _handDioleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return _handleError(error, DataSource.connectTimeout);
      case DioExceptionType.sendTimeout:
        return _handleError(error, DataSource.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return _handleError(error, DataSource.receiveTimeout);
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.cancel:
        return _handleError(error, DataSource.cancel);
      case DioExceptionType.connectionError:
        return _handleError(error, DataSource.connectTimeout);
      default:
        return _handleDefaultError(error);
    }
  }

  _handleBadResponse(DioException error) {
    try {
      final code = error.response?.statusCode ?? ResponseCode.defaultError;
      switch (code) {
        case ResponseCode.unauthorised:
          return _handleError(error, DataSource.unauthorised);
        case ResponseCode.forbidden:
          return _handleError(error, DataSource.forbidden);
        case ResponseCode.notFound:
          return _handleError(error, DataSource.notFound);
        default:
          return HttpFailure(
            error.response?.statusCode ?? ResponseCode.defaultError,
            _extractErrorMessage(error.response?.data),
            DataSource.defaultError,
          );
      }
    } catch (e) {
      return _handleError(error, DataSource.defaultError);
    }
  }

  _handleDefaultError(DioException error) {
    if (error.response?.statusCode == ResponseCode.noInternetConnection) {
      return _handleError(error, DataSource.noInternetConnection);
    } else {
      return _handleError(error, DataSource.defaultError);
    }
  }

  HttpFailure _handleError(DioException error, DataSource dataSource) {
    return HttpFailure(
      error.response?.statusCode ?? ResponseCode.defaultError,
      error.message ?? "",
      dataSource,
    );
  }

  String _extractErrorMessage(dynamic data) {
    if (data is String) return data;
    String message = '';
    if (data is Map) {
      data.forEach((key, value) {
        if (value is List) {
          message += value.join('\n');
        } else if (value is String) {
          message += value;
        } else {
          message += value.toString();
        }
      });
    }
    return message;
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internetServerError,
  connectTimeout,
  connectionError,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int invalidData = 422; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int locationDenied = -7;
  static const int defaultError = -8;
  static const int connectionError = -9;
}
