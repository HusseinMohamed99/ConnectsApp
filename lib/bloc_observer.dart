import 'package:bloc/bloc.dart';
import 'package:connects_app/core/helpers/enum/enum.dart';
import 'package:connects_app/core/helpers/logger/app_logs.dart';

/// ✅ Custom observer for all BLoC events for debugging and error tracking
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogs.log('onCreate -- ${bloc.runtimeType}', type: LogType.success);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogs.log('onChange -- ${bloc.runtimeType}, $change', type: LogType.info);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogs.log(
      'onError -- ${bloc.runtimeType}',
      type: LogType.error,
      error: error, // ✅ Pass the error object itself
      stackTrace: stackTrace, // ✅ Pass the stack trace
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogs.log('onClose -- ${bloc.runtimeType}', type: LogType.close);
  }
}
