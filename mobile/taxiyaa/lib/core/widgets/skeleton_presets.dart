import 'package:auto_skeleton/auto_skeleton.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'auto_skeleton_wrapper.dart';

/// Reusable skeleton placeholders wrapped in RepaintBoundary for optimal 60/120fps scrolling
/// Uses real leaf components (Text/Icon/PlaceholderLeaf) so AutoSkeleton generates precise bones
/// (PERFORMANCE_AND_CACHING_GUIDE.md Section 3.3)
class SkeletonPresets {
  SkeletonPresets._();

  /// Skeleton for a Service or Vehicle Card
  static Widget card({
    double height = 220,
    double borderRadius = 14,
  }) {
    return RepaintBoundary(
      child: TaxiyaaSkeleton(
        enabled: true,
        child: Container(
          height: height,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              Expanded(
                flex: 3,
                child: PlaceholderLeaf(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
                  child: Container(
                    color: AppColors.surfaceElevated,
                    width: double.infinity,
                  ),
                ),
              ),
              // Text placeholders
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Taxiyaa Executive Fleet Service',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Instant Airport & Outstation Booking',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Skeleton for a list of items (e.g. Route list or booking history)
  static Widget list({int itemCount = 4}) {
    return RepaintBoundary(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return listTile();
        },
      ),
    );
  }

  /// Single list tile skeleton
  static Widget listTile() {
    return RepaintBoundary(
      child: TaxiyaaSkeleton(
        enabled: true,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: const Row(
            children: [
              PlaceholderLeaf(
                width: 60,
                height: 60,
                child: SizedBox(width: 60, height: 60),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mumbai to Pune Expressway Cab',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '150 km • 3.0 Hours • ₹2,499 Flat',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ),
      ),
    );
  }

  /// Skeleton for top hero banner
  static Widget banner({double height = 160}) {
    return RepaintBoundary(
      child: TaxiyaaSkeleton(
        enabled: true,
        child: PlaceholderLeaf(
          height: height,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
          ),
        ),
      ),
    );
  }
}
