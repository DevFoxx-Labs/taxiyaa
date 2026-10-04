import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/app_role.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/role_switcher_sheet.dart';
import '../../customer/screens/customer_main_nav.dart';
import '../../driver/screens/driver_main_nav.dart';
import '../../vendor/screens/vendor_main_nav.dart';
import 'admin_dashboard_screen.dart';
import 'admin_bookings_screen.dart';
import 'admin_vendors_screen.dart';
import 'admin_finance_screen.dart';

/// Admin App Navigation Shell (Section 40)
class AdminMainNav extends ConsumerStatefulWidget {
  const AdminMainNav({super.key});

  @override
  ConsumerState<AdminMainNav> createState() => _AdminMainNavState();
}

class _AdminMainNavState extends ConsumerState<AdminMainNav> {
  int _currentIndex = 0;

  void _switchRole(AppRole role) {
    ref.read(activeRoleProvider.notifier).setRole(role);
    switch (role) {
      case AppRole.customer:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CustomerMainNav()),
        );
        break;
      case AppRole.driver:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DriverMainNav()),
        );
        break;
      case AppRole.vendor:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const VendorMainNav()),
        );
        break;
      case AppRole.admin:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      AdminDashboardScreen(
        onOpenRoleSwitcher: () {
          RoleSwitcherSheet.show(
            context,
            currentRole: AppRole.admin,
            onRoleSelected: _switchRole,
          );
        },
      ),
      const AdminBookingsScreen(),
      const AdminVendorsScreen(),
      const AdminFinanceScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.border, width: 1)),
        ),
        child: SafeArea(
          top: false,
          child: NavigationBar(
            selectedIndex: _currentIndex,
            backgroundColor: AppColors.white,
            indicatorColor: AppColors.primary,
            elevation: 0,
            height: 64,
            onDestinationSelected: (idx) {
              setState(() {
                _currentIndex = idx;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.analytics_outlined),
                selectedIcon: Icon(Icons.analytics, color: AppColors.black),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.receipt_long_outlined),
                selectedIcon: Icon(Icons.receipt_long, color: AppColors.black),
                label: 'Bookings',
              ),
              NavigationDestination(
                icon: Icon(Icons.hub_outlined),
                selectedIcon: Icon(Icons.hub, color: AppColors.black),
                label: 'Network',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_balance_outlined),
                selectedIcon: Icon(Icons.account_balance, color: AppColors.black),
                label: 'Finance',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

