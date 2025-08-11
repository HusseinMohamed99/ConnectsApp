import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connects_app/core/theming/colorsManager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class CustomSmartImage extends StatelessWidget {
  const CustomSmartImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.customLoadingWidget,
    this.customErrorWidget,
  });

  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? customLoadingWidget;
  final Widget? customErrorWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: _buildNetworkImage(),
    );
  }

  Widget _buildNetworkImage() => CachedNetworkImage(
    imageUrl: image,
    fit: fit,
    width: width,
    height: height,
    placeholder: (_, _) => customLoadingWidget ?? _loading(),
    errorWidget: (_, url, error) => FutureBuilder<Uint8List?>(
      future: _fetchImageBytes(url),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _loading();
        }
        if (snapshot.hasData) {
          return Image.memory(
            snapshot.data!,
            fit: fit,
            width: width,
            height: height,
          );
        }
        return _errorWidget();
      },
    ),
  );

  Widget _loading() =>
      customLoadingWidget ??
      Center(
        child: SpinKitDoubleBounce(
          color: ColorManager.mainBlue,
          size: 40.sp,
          duration: const Duration(milliseconds: 1500),
        ),
      );

  Widget _errorWidget() =>
      customErrorWidget ??
      Container(
        color: Colors.grey.shade300,
        alignment: Alignment.center,
        child: Icon(
          Icons.broken_image,
          color: ColorManager.darkGreyColor,
          size: 30.sp,
        ),
      );

  Future<Uint8List?> _fetchImageBytes(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) return response.bodyBytes;
    } catch (e) {
      debugPrint('❌ Failed to fetch image bytes: $e');
    }
    return null;
  }
}

ImageProvider<Object>? getImageProvider(String? image) {
  if (image == null || image.trim().isEmpty) return null;
  if (image.startsWith('http')) {
    return NetworkImage(image);
  }
  return null;
}
