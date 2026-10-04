import 'package:auto_skeleton/auto_skeleton.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Wraps widgets with AutoSkeleton using the Taxiyaa Executive Dark shimmer effect
class TaxiyaaSkeleton extends StatelessWidget {
  final bool enabled;
  final Widget child;
  final PlaceholderEffect? customEffect;
  final bool enableSwitchAnimation;

  const TaxiyaaSkeleton({
    super.key,
    required this.enabled,
    required this.child,
    this.customEffect,
    this.enableSwitchAnimation = true,
  });

  /// Default ShimmerEffect tailored for Taxiyaa Dark theme
  static PlaceholderEffect defaultEffect(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ShimmerEffect(
      baseColor: isDark ? AppColors.shimmerBase : const Color(0xFFE2E8F0),
      highlightColor: isDark ? AppColors.shimmerHighlight : const Color(0xFFF8FAFC),
      duration: const Duration(milliseconds: 1400),
      direction: ShimmerDirection.ltr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoSkeleton(
      enabled: enabled,
      effect: customEffect ?? defaultEffect(context),
      enableSwitchAnimation: enableSwitchAnimation,
      child: child,
    );
  }
}

/// Extension on Widget for quick Taxiyaa skeleton shimmer wrapping
extension TaxiyaaSkeletonExtension on Widget {
  Widget withTaxiyaaSkeleton({
    required bool loading,
    PlaceholderEffect? effect,
    bool enableSwitchAnimation = true,
  }) {
    return TaxiyaaSkeleton(
      enabled: loading,
      customEffect: effect,
      enableSwitchAnimation: enableSwitchAnimation,
      child: this,
    );
  }
}

