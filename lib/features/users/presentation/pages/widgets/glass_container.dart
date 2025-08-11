// lib/core/widgets/glass_container.dart
import 'dart:ui'; // ← for ImageFilter

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable frosted-glass container (Glassmorphism).
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.blur = 20,
    this.opacity = .18, // background tint opacity
    this.strokeOpacity = .25,
    this.padding,
  });

  /// Inner content
  final Widget child;

  /// Card curvature
  final double borderRadius;

  /// Gaussian blur strength
  final double blur;

  /// Fill tint opacity (on top of what's behind)
  final double opacity;

  /// Border (stroke) opacity
  final double strokeOpacity;

  /// Optional inner padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: BackdropFilter(
        // Apply blur to whatever is behind this widget
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            // Subtle gradient helps the glass look
            color: const Color.fromRGBO(219, 219, 219, 0.14),

            borderRadius: BorderRadius.circular(borderRadius.r),
            border: Border.all(
              // Thin frosted stroke
              color: Colors.white,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
