import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'taxiyaa_button.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String? message;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback? onAction;
  final IconData icon;

  const EmptyState({
    super.key,
    required this.title,
    this.message,
    this.subtitle,
    this.buttonText,
    this.onAction,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.lightGray,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: AppColors.textGray),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle ?? message ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textGray,
                height: 1.4,
              ),
            ),
            if (buttonText != null && onAction != null) ...[
              const SizedBox(height: 24),
              TaxiyaaButton(
                text: buttonText!,
                onPressed: onAction,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onRetry;

  const ErrorStateWidget({
    super.key,
    this.title = 'Something went wrong',
    this.message = 'Unable to complete your request. Please try again.',
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.error_outline, size: 44, color: AppColors.error),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textGray,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            TaxiyaaButton(
              text: 'Retry',
              onPressed: onRetry,
              width: 160,
            ),
          ],
        ),
      ),
    );
  }
}

