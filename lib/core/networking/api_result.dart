import 'package:connects_app/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

/// Represents the outcome of API calls clearly
/// distinguishing success and failure.
///
/// [ApiResult.success] contains the successful response data.
/// [ApiResult.failure] contains the error details handled by [ErrorHandler].
@freezed
class ApiResult<T> with _$ApiResult<T> {
  /// Successful API call containing [data].
  const factory ApiResult.success(T data) = Success<T>;

  /// Failed API call containing detailed [errorHandler].
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
