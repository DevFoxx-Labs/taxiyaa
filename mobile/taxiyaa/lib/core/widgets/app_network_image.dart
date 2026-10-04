import 'package:auto_skeleton/auto_skeleton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../cache/image_cache_manager.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import 'auto_skeleton_wrapper.dart';

/// Production-grade optimized network image widget with dual-tier caching,
/// memory downscaling, AutoSkeleton shimmer placeholder, and error fallback.
/// (PERFORMANCE_AND_CACHING_GUIDE.md Section 1.A & 1.B)
class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final int memCacheWidth;
  final int memCacheHeight;
  final int maxWidthDiskCache;
  final int maxHeightDiskCache;
  final Widget? errorWidget;
  final Widget? placeholder;
  final VoidCallback? onRetry;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.memCacheWidth = AppConstants.defaultMemCacheWidth,
    this.memCacheHeight = AppConstants.defaultMemCacheHeight,
    this.maxWidthDiskCache = 1000,
    this.maxHeightDiskCache = 1000,
    this.errorWidget,
    this.placeholder,
    this.onRetry,
  });

  /// Factory for avatar images (150x150 downscaled)
  factory AppNetworkImage.avatar({
    Key? key,
    required String? imageUrl,
    double size = 48,
    BorderRadius? borderRadius,
  }) {
    return AppNetworkImage(
      key: key,
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: BoxFit.cover,
      borderRadius: borderRadius ?? BorderRadius.circular(size / 2),
      memCacheWidth: AppConstants.avatarMemCacheWidth,
      memCacheHeight: AppConstants.avatarMemCacheWidth,
    );
  }

  /// Factory for hero or card banners (800x450 downscaled)
  factory AppNetworkImage.banner({
    Key? key,
    required String? imageUrl,
    double height = 180,
    BorderRadius? borderRadius,
  }) {
    return AppNetworkImage(
      key: key,
      imageUrl: imageUrl,
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
      borderRadius: borderRadius ?? BorderRadius.circular(14),
      memCacheWidth: AppConstants.bannerMemCacheWidth,
      memCacheHeight: (AppConstants.bannerMemCacheWidth * 0.5625).toInt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.zero;

    if (imageUrl == null || imageUrl!.trim().isEmpty) {
      return _buildFallback(context, effectiveBorderRadius);
    }

    Widget imageContent = CachedNetworkImage(
      imageUrl: imageUrl!.trim(),
      cacheManager: TaxiyaaImageCacheManager.instance,
      width: width,
      height: height,
      fit: fit,
      // RAM Memory Cache Downscaling: caps decoded pixels to prevent 45+ MB per uncompressed image
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      // Disk Cache Downscaling: caps saved resolution
      maxWidthDiskCache: maxWidthDiskCache,
      maxHeightDiskCache: maxHeightDiskCache,
      fadeInDuration: const Duration(milliseconds: 250),
      fadeOutDuration: const Duration(milliseconds: 150),
      placeholder: (context, url) {
        if (placeholder != null) return placeholder!;
        return TaxiyaaSkeleton(
          enabled: true,
          child: PlaceholderLeaf(
            width: width,
            height: height,
            child: Container(
              width: width,
              height: height,
              color: AppColors.surfaceElevated,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        if (errorWidget != null) return errorWidget!;
        return _buildErrorWidget(context);
      },
    );

    if (effectiveBorderRadius != BorderRadius.zero) {
      imageContent = ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: imageContent,
      );
    }

    return imageContent;
  }

  Widget _buildFallback(BuildContext context, BorderRadius radius) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: radius,
        border: Border.all(color: AppColors.border),
      ),
      child: const Center(
        child: Icon(
          Icons.directions_car_outlined,
          color: AppColors.textMuted,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: AppColors.surfaceElevated,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.broken_image_outlined,
              color: AppColors.textMuted,
              size: 26,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 6),
              GestureDetector(
                onTap: onRetry,
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
