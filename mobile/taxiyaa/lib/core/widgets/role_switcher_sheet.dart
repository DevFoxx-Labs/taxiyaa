import 'package:flutter/material.dart';
import '../models/app_role.dart';
import '../theme/app_colors.dart';

class RoleSwitcherSheet extends StatelessWidget {
  final AppRole currentRole;
  final void Function(AppRole) onRoleSelected;

  const RoleSwitcherSheet({
    super.key,
    required this.currentRole,
    required this.onRoleSelected,
  });

  static Future<void> show(
    BuildContext context, {
    required AppRole currentRole,
    required void Function(AppRole) onRoleSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => RoleSwitcherSheet(
        currentRole: currentRole,
        onRoleSelected: onRoleSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Switch Experience Portal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Select which Taxiyaa role to access and manage.',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textGray,
              ),
            ),
            const SizedBox(height: 16),
            ...AppRole.values.map((role) {
              final isSelected = role == currentRole;
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryLight.withValues(alpha: 0.4) : AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: CircleAvatar(
                    backgroundColor: isSelected ? AppColors.primary : AppColors.lightGray,
                    child: Icon(
                      _iconForRole(role),
                      color: isSelected ? AppColors.black : AppColors.darkGray,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    role.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  subtitle: Text(
                    role.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textGray,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: AppColors.darkYellow)
                      : null,
                  onTap: () {
                    Navigator.pop(context);
                    if (!isSelected) {
                      onRoleSelected(role);
                    }
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  IconData _iconForRole(AppRole role) {
    switch (role) {
      case AppRole.customer:
        return Icons.person_pin;
      case AppRole.driver:
        return Icons.local_taxi;
      case AppRole.vendor:
        return Icons.business;
      case AppRole.admin:
        return Icons.admin_panel_settings;
    }
  }
}

