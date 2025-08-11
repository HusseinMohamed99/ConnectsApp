import 'package:flutter/material.dart';

/// Extension on BuildContext to simplify navigation and snackbar usage
extension NavigationExtension on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushWidget<T>(Widget page) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  /// Safe pop: only pop if navigator can pop
  void popIfCan<T>([T? result]) {
    if (Navigator.of(this).canPop()) Navigator.of(this).pop(result);
  }

  /// Provides access to [ScaffoldMessengerState] for showing SnackBars.
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

/// Extension for nullable Strings
extension NullableStringExtension on String? {
  bool get isEmptyOrNull => this == null || this!.trim().isEmpty;
}

/// Extension for nullable booleans
extension NullableBoolExtension on bool? {
  bool get isFalseOrNull => this == null || this == false;
}

/// Extension for nullable lists
extension NullableListExtension<T> on List<T>? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;
}

/// Extension for nullable maps
extension NullableMapExtension<K, V> on Map<K, V>? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;
}

extension IfEmptyOrNullExtension on String? {
  String? ifEmptyOrNull() => this == null || this!.trim().isEmpty ? null : this;
}
