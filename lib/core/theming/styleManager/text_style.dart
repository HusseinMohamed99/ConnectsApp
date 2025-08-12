import 'package:connects_app/core/helpers/responsive/responsive_font_size.dart';
import 'package:connects_app/core/theming/colorsManager/color_manager.dart';
import 'package:connects_app/core/theming/styleManager/font_size.dart';
import 'package:connects_app/core/theming/styleManager/font_weight.dart';
import 'package:flutter/material.dart';

/// Manages app-wide text styles with dynamic font family based on locale.
abstract class AppTextStyleManager {
// ============== NEEDED =============== //

  static TextStyle semibold16(BuildContext context, {Color? color}) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: color ?? ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle regular16(BuildContext context, {Color? color}) =>
      buildStyle(
        context,
        fontSize: FontSizeHelper.s16,
        color: color ?? ColorManager.mainBlack,
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
  static TextStyle regularTextGrey12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.textGrey,
  );
  // ============ Bold Text ============ //

  static TextStyle boldTextBlack30(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s30,
    color: ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle boldWhiteColor24(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s20,
    color: ColorManager.mainWhite,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle boldWhiteColor20(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s20,
    color: ColorManager.mainWhite,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle bold16(BuildContext context, {Color? color}) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: color ?? ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle boldParagraphColor14(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s14,
    color: ColorManager.paragraphColor,
    fontWeight: FontWeightHelper.bold,
  );

  // =========== SemiBold Text ============ //

  static TextStyle semiBoldTextBlack12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.semiBold,
  );

 

  static TextStyle semiBoldMainBlue16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.mainBlue,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldWhite16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.mainWhite,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldBlack16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.blackColor,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldDarkColor20(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s20,
    color: ColorManager.darkColor,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldHeaderTextStyle20(BuildContext context) =>
      buildStyle(
        context,
        fontSize: FontSizeHelper.s20,
        color: ColorManager.headerColor,
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle semiBoldHeaderColor24(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s24,
    color: ColorManager.headerColor,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldHeaderColor32(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s32,
    color: ColorManager.blackColor,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldTextBlack26(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s26,
    color: ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.semiBold,
  );

  // =========== Medium Text ============ //
  static TextStyle mediumMainBlueColor10(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s10,
    color: ColorManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle mediumRed12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.redColor,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle mediumMainWhite12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.mainWhite,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle mediumMainBlueColor12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle mediumMainBlueColor14(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s14,
    color: ColorManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle mediumMainDarkBlue14(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s14,
    color: ColorManager.darkBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle medium14(BuildContext context, {Color? color}) => buildStyle(
    context,
    fontSize: FontSizeHelper.s14,
    color: color ?? ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.medium,
  );


  static TextStyle mediumMainBlue16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle medium18(BuildContext context, {Color? color}) => buildStyle(
    context,
    fontSize: FontSizeHelper.s18,
    color: color ?? ColorManager.textBlackColor,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle medium20(BuildContext context, {Color? color}) => buildStyle(
    context,
    fontSize: FontSizeHelper.s20,
    color: color ?? ColorManager.mainBlack,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle mediumMainBlack81(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s81,
    color: ColorManager.mainBlack,
    fontWeight: FontWeightHelper.medium,
  );

  // =========== Regular Text ============ //
  static TextStyle regularDarkGrey12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.darkGreyColor,
  );


  static TextStyle regularMainBlue12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.mainBlue,
  );

  static TextStyle regularParagraphColor12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.paragraphColor,
  );

  static TextStyle regularTextBlack12(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s12,
    color: ColorManager.textBlackColor,
  );
  static TextStyle regularDarkColor14(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s14,
    color: ColorManager.darkColor,
  );

  static TextStyle regularDarkGrey16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.darkGreyColor,
  );

  static TextStyle regularWhiteColor16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.mainWhite,
  );
  static TextStyle regularTextGrey16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.textGreyColor,
  );
  static TextStyle regularSubHeadColor16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.subHeaderColor,
  );

  static TextStyle regularTextBlack16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.textBlackColor,
  );

  static TextStyle regularMainBlue16(BuildContext context) => buildStyle(
    context,
    fontSize: FontSizeHelper.s16,
    color: ColorManager.mainBlue,
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
