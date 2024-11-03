class ResponseMessage {
  static const String success = "AppStrings.strSuccess"; // success with data
  static const String noContent =
      "AppStrings.strNoContent"; // success with no data (no content)
  static const String badRequest =
      "AppStrings.strBadRequestError"; // failure, API rejected request
  static const String unauthorised =
      "AppStrings.strUnauthorizedError"; // failure, user is not authorised
  static const String forbidden =
      "AppStrings.strForbiddenError"; //  failure, API rejected request
  static const String internalServerError =
      "AppStrings.strInternalServerError"; // failure, crash in server side
  static const String notFound =
      "AppStrings.strNotFoundError"; // failure, crash in server side

  // local status code
  static const String connectTimeout = "AppStrings.strTimeoutError";
  static const String cancel = "AppStrings.strDefaultError";
  static const String receiveTimeout = "AppStrings.strTimeoutError";
  static const String sendTimeout = "AppStrings.strTimeoutError";
  static const String cacheError = "AppStrings.strCacheError";
  static const String noInternetConnection = "AppStrings.strNoInternetError";
  static const String defaultError = "AppStrings.strDefaultError";
  static const String connectionError = "AppStrings.strDefaultError";
}
