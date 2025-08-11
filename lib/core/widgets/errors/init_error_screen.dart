import 'package:connects_app/core/helpers/dimensions/dimensions.dart';
import 'package:connects_app/core/helpers/extensions/widget_extension.dart';
import 'package:connects_app/core/theming/colorsManager/color_manager.dart';
import 'package:connects_app/core/theming/styleManager/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// A customizable screen widget shown when the app fails to initialize.
class InitErrorScreen extends StatelessWidget {
  const InitErrorScreen({
    super.key,
    required this.error,
    this.title,
    this.onExit,
    this.iconColor,
    this.textColor,
    this.backgroundColor,
    this.buttonColor,
  });

  /// The main error message to display.
  final String error;

  /// Optional title (fallbacks to localization)
  final String? title;

  /// Optional callback to override the default app close behavior.
  final VoidCallback? onExit;

  /// Optional icon color
  final Color? iconColor;

  /// Optional text color
  final Color? textColor;

  /// Optional background color for scaffold
  final Color? backgroundColor;

  /// Optional button color
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: kPaddingDefaultHorizontal,
            vertical: kPaddingDefaultVertical,
          ),
          child: Column(
            spacing: kSpacingDefault,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: iconColor ?? ColorManager.headerColor,
              ),
              Text(
                'Something went wrong',
                style: AppTextStyleManager.mediumMainWhite12(context),
                textAlign: TextAlign.center,
              ),
              Text(
                error,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyleManager.mediumMainWhite12(context),
                textAlign: TextAlign.center,
              ),
              Text(
                'Unable to initialize the app. Please try again later.',
                style: AppTextStyleManager.mediumMainWhite12(context),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: onExit ?? SystemNavigator.pop,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor ?? ColorManager.headerColor,
                ),
                child: Text(
                  'CLOSE APP',
                  style: AppTextStyleManager.mediumMainWhite12(context),
                ),
              ),
            ],
          ).center(),
        ),
      ),
    );
  }
}
