import 'package:connects_app/core/helpers/responsive/responsive_font_size.dart';
import 'package:connects_app/core/theming/colorsManager/color_manager.dart';
import 'package:connects_app/core/theming/styleManager/font_size.dart';
import 'package:connects_app/core/theming/styleManager/font_weight.dart';
import 'package:flutter/material.dart';

/// Manages app-wide text styles with dynamic font family based on locale.
abstract class AppTextStyleManager {
  static TextStyle semibold16(BuildContext context, {Color? color}) =>
      buildStyle(
        context,
        fontSize: FontSizeHelper.s16,
        color: color ?? ColorManager.textBlackColor,
        fontWeight: FontWeightHelper.semiBold,
      );
  static TextStyle semiBold14(BuildContext context, {Color? color}) =>
      buildStyle(
        context,
        fontSize: FontSizeHelper.s14,
        color: color ?? ColorManager.mainBlue,
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle mediumTextBlack16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle regular16(BuildContext context, {Color? color}) =>
      buildStyle(
        context,
        fontSize: FontSizeHelper.s16,
        color: color ?? ColorManager.mainBlack,
      );

  static TextStyle regular12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.textBlackColor,
  );

  // Internal Helper
  static TextStyle buildStyle(
    BuildContext context, {
    required double fontSize,
    FontWeight? fontWeight,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: fontWeight ?? FontWeightHelper.regular,
    );
  }
}
