import 'package:connects_app/core/helpers/dimensions/dimensions.dart';
import 'package:connects_app/core/helpers/extensions/widget_extension.dart';
import 'package:connects_app/core/helpers/responsive/spacing.dart';
import 'package:connects_app/core/theming/styleManager/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// A customizable widget to display error messages centered on screen.
/// Supports adaptive theming, text style overrides, and retry callback.
class CustomErrorTextWidget extends StatelessWidget {
  const CustomErrorTextWidget({
    super.key,
    required this.errorMessage,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.textColor,
    this.onRetry,
  });
  final String errorMessage;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final Color? textColor;

  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
              textAlign: textAlign,
              style:
                  textStyle ??
                  AppTextStyleManager.bold16(context)
            ),
            if (onRetry != null) ...[
              verticalSpacing(kSpacingMedium),
              GestureDetector(
                onTap: onRetry,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh_outlined,
                      size: kIconSizeDefault.sp,
                    ),
                    horizontalSpacing(4),
                    Text(
                      'Try Again',
                      style:  AppTextStyleManager.semiBold14(context)
                    ),
                  ],
                ),
              ),
            ],
          ],
        )
        .allPadding(
          vPadding: kPaddingDefaultVertical,
          hPadding: kPaddingDefaultHorizontal,
        )
        .center();
  }
}