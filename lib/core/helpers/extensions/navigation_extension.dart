import 'package:flutter/material.dart';

/// Extension on BuildContext to simplify navigation and snackbar usage
extension NavigationExtension on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  /// Safe pop: only pop if navigator can pop
  void popIfCan<T>([T? result]) {
    if (Navigator.of(this).canPop()) Navigator.of(this).pop(result);
  }

  /// Provides access to [ScaffoldMessengerState] for showing SnackBars.
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

