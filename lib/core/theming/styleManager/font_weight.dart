import 'package:flutter/material.dart';

/// A centralized helper for defining font weights
/// to ensure consistency throughout the application.
class FontWeightHelper {
  /// Very thin – rarely used, for subtle UIs.
  static const FontWeight thin = FontWeight.w100;

  /// Extra light – very lightweight content.
  static const FontWeight extraLight = FontWeight.w200;

  /// Light – good for secondary text.
  static const FontWeight light = FontWeight.w300;

  /// Normal – standard body text.
  static const FontWeight regular = FontWeight.w400;

  /// Medium – slightly stronger than regular.
  static const FontWeight medium = FontWeight.w500;

  /// Semi-bold – good for emphasized labels and titles.
  static const FontWeight semiBold = FontWeight.w600;

  /// Bold – commonly used for headers.
  static const FontWeight bold = FontWeight.w700;

  /// Extra bold – more aggressive emphasis.
  static const FontWeight extraBold = FontWeight.w800;

  /// Black – strongest bold, use sparingly.
  static const FontWeight black = FontWeight.w900;
}
