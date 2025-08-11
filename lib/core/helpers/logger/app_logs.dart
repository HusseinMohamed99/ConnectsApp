import 'dart:developer' as dev;
import 'package:connects_app/core/helpers/enum/enum.dart';

/// A tool for displaying logs in a clear and formatted way in development mode
class AppLogs {
  AppLogs._();

  /// Current time in minute:second:millisecond format
  static String get _getCurrentTime {
    final DateTime now = DateTime.now();
    return '${now.minute}:${now.second}:${now.millisecond}';
  }

  /// Unified function for logging messages based on their type
  static void log(
    String message, {
    LogType type = LogType.debug,
    String tag = '',
    Object? value,
    Object? error, // ✅ Support passing the error itself
    StackTrace? stackTrace, // ✅ Support stack trace
  }) {
    assert(() {
      late final String prefix;
      late final String ansiColor;
      late final int level;
      final String time = _getCurrentTime;

      switch (type) {
        case LogType.success:
          ansiColor = '\x1B[32m';
          prefix = '✅';
          level = 0;
          tag = tag.isEmpty ? 'Success' : tag;
          break;
        case LogType.debug:
          ansiColor = '\x1B[37m';
          prefix = '🐛';
          level = 0;
          tag = tag.isEmpty ? 'Debug' : tag;
          break;
        case LogType.info:
          ansiColor = '\x1B[33m';
          prefix = '📣';
          level = 200;
          tag = tag.isEmpty ? 'Info' : tag;
          break;
        case LogType.error:
          ansiColor = '\x1B[31m';
          prefix = '❌';
          level = 1000;
          tag = tag.isEmpty ? 'Error' : tag;
          break;
        case LogType.close:
          ansiColor = '\x1B[35m';
          prefix = '🔒';
          level = 900;
          tag = tag.isEmpty ? 'Close' : tag;
          break;
      }

      final String valuePart = value != null
          ? '\n📦 → ${_formatValue(value)}'
          : '';

      final String errorPart = error != null
          ? '\n💥 → Error: ${error.runtimeType}: $error'
          : '';

      dev.log(
        '$ansiColor$tag $prefix: $message$valuePart$errorPart\x1B[0m',
        name: '$tag $time',
        level: level,
        error: error, // ✅ Also passed to external systems like Crashlytics
        stackTrace: type == LogType.error ? stackTrace : null,
      );

      return true;
    }());
  }

  /// Format additional data (like lists or long texts)
  static String _formatValue(Object value) {
    if (value is List) {
      if (value.length > 10) {
        return '[List length: ${value.length}] ${value.take(3).toList()}...';
      } else {
        return value.toString();
      }
    }
    if (value.toString().length > 300) {
      return '${value.toString().substring(0, 300)}...';
    }
    return value.toString();
  }
}
