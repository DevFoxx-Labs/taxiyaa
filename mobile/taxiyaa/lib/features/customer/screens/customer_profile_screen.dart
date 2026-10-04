import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'customer_support_screen.dart';

/// Customer Screen: Profile (Section 18)
class CustomerProfileScreen extends StatelessWidget {
  final VoidCallback onSwitchRole;

  const CustomerProfileScreen({super.key, required this.onSwitchRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('My Profile'),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // User Header Card
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primary,
                    child: const Text(
                      'RK',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rahul Kumar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '+91 98765 43210',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.edit_outlined, size: 20, color: AppColors.textGray),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Switch Role Portal Banner
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.primary),
              ),
              child: ListTile(
                leading: const Icon(Icons.swap_horiz, color: AppColors.black, size: 24),
                title: const Text(
                  'Switch Experience Portal',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                subtitle: const Text(
                  'Switch to Driver, Vendor, or Admin view',
                  style: TextStyle(fontSize: 12, color: AppColors.textGray),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.black),
                onTap: onSwitchRole,
              ),
            ),

            const SizedBox(height: 16),

            // Menu List (Section 18)
            TaxiyaaCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _menuItem(Icons.person_outline, 'Personal Details'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuItem(Icons.bookmark_border, 'Saved Locations'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuItem(Icons.payment_outlined, 'Payment Methods'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuItem(Icons.notifications_none, 'Notifications'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuItem(
                    Icons.help_outline,
                    'Help & Support',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CustomerSupportScreen()),
                      );
                    },
                  ),
                  const Divider(height: 1, color: AppColors.border),
                  _menuItem(Icons.description_outlined, 'Terms & Conditions'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuItem(
                    Icons.logout,
                    'Logout',
                    textColor: AppColors.error,
                    iconColor: AppColors.error,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logged out of session.')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title, {
    VoidCallback? onTap,
    Color textColor = AppColors.black,
    Color iconColor = AppColors.darkGray,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 20),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textGray),
      onTap: onTap,
    );
  }
}

