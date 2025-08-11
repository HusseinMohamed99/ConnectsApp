import 'package:connects_app/core/networking/api_error.dart';
import 'package:connects_app/core/networking/api_error_model.dart';
import 'package:connects_app/core/networking/api_result.dart';
import 'package:dio/dio.dart';

class ResponseCode {
  static const int unauthorized = 401;
  static const int defaultError = -7;
}

class ErrorHandler implements Exception {

  ErrorHandler.handle(dynamic error, String lang) {
    if (error is DioException) {
      apiErrorModel = _handleDioError(error, lang);
    } else if (error is String) {
      apiErrorModel = ApiErrorModel(error: error);
    } else if (error is Exception) {
      apiErrorModel = ApiErrorModel(error: error.toString());
    } else {
      apiErrorModel = ApiErrorModel(error: 'Unknown error');
    }
  }
  late final ApiErrorModel apiErrorModel;

  static ApiResult<T> asFailure<T>(dynamic error, String lang) {
    return ApiResult.failure(ErrorHandler.handle(error, lang));
  }
}

ApiErrorModel _handleDioError(DioException error, String lang) {
  final statusCode = error.response?.statusCode;
  final data = error.response?.data;

  if (statusCode == ResponseCode.unauthorized &&
      data is Map<String, dynamic> &&
      data['error']?.toString() == 'Missing API key') {
    return _missingApiKey(lang);
  }

  return ApiErrorModel(
    error: data is Map<String, dynamic> ? data['error']?.toString() ?? '' : '',
  );
}

ApiErrorModel _missingApiKey(String lang) =>
    ApiErrorModel(error: ApiErrors.missingApiKeyError(lang));
