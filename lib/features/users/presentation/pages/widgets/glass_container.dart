import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.blur = 20,
    this.opacity = .18,
    this.strokeOpacity = .25,
    this.padding,
  });

  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;
  final double strokeOpacity;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(219, 219, 219, 0.14),
            borderRadius: BorderRadius.circular(borderRadius.r),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
