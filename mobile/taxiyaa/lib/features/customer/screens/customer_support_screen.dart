import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Customer Screen: Support (Section 19)
class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  Future<void> _callHotline() async {
    final uri = Uri.parse('tel:${AppConstants.supportPhone}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('${AppConstants.whatsappUrl}?text=Hi%20Taxiyaa%20Support');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Help & Support'),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How can we help you?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Choose a category or contact our 24/7 hotline directly.',
              style: TextStyle(fontSize: 13, color: AppColors.textGray),
            ),
            const SizedBox(height: 16),

            // Hotline Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.support_agent, size: 36, color: AppColors.black),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '24/7 Taxiyaa Hotline',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          AppConstants.supportPhoneDisplay,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      minimumSize: const Size(60, 36),
                    ),
                    onPressed: _callHotline,
                    child: const Text('Call', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Categories List (Section 19)
            const Text(
              'Select Issue Category',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),

            TaxiyaaCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _categoryTile(context, Icons.calendar_today, 'Booking Issue'),
                  const Divider(height: 1, color: AppColors.border),
                  _categoryTile(context, Icons.payment, 'Payment & Refund Issue'),
                  const Divider(height: 1, color: AppColors.border),
                  _categoryTile(context, Icons.person, 'Driver / Vehicle Issue'),
                  const Divider(height: 1, color: AppColors.border),
                  _categoryTile(context, Icons.cancel_outlined, 'Cancellation & Charges'),
                  const Divider(height: 1, color: AppColors.border),
                  _categoryTile(context, Icons.more_horiz, 'Other Inquiries'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // WhatsApp Direct Action
            TaxiyaaButton(
              text: 'Chat with us on WhatsApp',
              icon: Icons.chat,
              backgroundColor: const Color(0xFF25D366),
              textColor: AppColors.white,
              onPressed: _openWhatsApp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.darkYellow, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textGray),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Support ticket raised for $title.')),
        );
      },
    );
  }
}

