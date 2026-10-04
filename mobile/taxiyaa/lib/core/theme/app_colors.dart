import 'package:flutter/material.dart';

/// Taxiyaa Brand Design System Colors
/// (Section 2: Brand Design System)
class AppColors {
  AppColors._();

  // Primary Brand Colors (Taxiyaa Yellow)
  static const Color primary = Color(0xFFFFC107); // Taxiyaa Yellow
  static const Color primaryDark = Color(0xFFF4A900); // Dark Yellow
  static const Color primaryLight = Color(0xFFFFF4CC); // Light Yellow
  static const Color darkYellow = Color(0xFFF4A900);
  static const Color lightYellow = Color(0xFFFFF4CC);

  // Neutral Colors
  static const Color black = Color(0xFF111111);
  static const Color darkGray = Color(0xFF242424);
  static const Color textGray = Color(0xFF666666);
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textMuted = Color(0xFF9E9E9E);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color border = Color(0xFFE5E5E5);
  static const Color white = Color(0xFFFFFFFF);

  // Status & Utility Colors
  static const Color success = Color(0xFF16A34A);
  static const Color error = Color(0xFFDC2626);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF2563EB);

  // Backgrounds & Surfaces (Light theme first, as per wireframes)
  static const Color background = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceElevated = Color(0xFFF5F5F5);

  // Dark Theme Equivalents (Supported)
  static const Color darkBackground = Color(0xFF0B0C10);
  static const Color darkSurface = Color(0xFF13151B);
  static const Color darkSurfaceElevated = Color(0xFF1A1D26);
  static const Color darkBorder = Color(0xFF1E222D);

  // Skeleton / Shimmer
  static const Color shimmerBase = Color(0xFFE5E5E5);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
  static const Color darkShimmerBase = Color(0xFF161922);
  static const Color darkShimmerHighlight = Color(0xFF282D3D);
}

