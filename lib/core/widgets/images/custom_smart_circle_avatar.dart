import 'package:connects_app/core/widgets/images/custom_smart_image.dart';
import 'package:flutter/material.dart';

class SmartCircleAvatar extends StatelessWidget {
  const SmartCircleAvatar({
    super.key,
    required this.image,
    this.radius = 40,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0,
  });

  final String image;
  final double radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final double size = radius * 2;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.grey.shade200,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipOval(
        child: CustomSmartImage(
          image: image,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
