import 'package:connects_app/core/theming/colorsManager/color_manager.dart';
import 'package:connects_app/core/theming/styleManager/text_style.dart';
import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  /// Displays a [SnackBar] with consistent styling.
  ///
  /// - Duration: 2 seconds
  /// - Floating behavior
  /// - Uses [ColorManager.accentBlueColor] as background
  /// - Text styled using [titleMedium] with [primaryBlue]
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
    TextStyle? textStyle,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        backgroundColor: backgroundColor ?? ColorManager.accentBlueColor,
        content: Text(
          message,
          style:
              textStyle ??
              AppTextStyleManager.medium14(this, color: ColorManager.mainBlue),
        ),
      ),
    );
  }
}
