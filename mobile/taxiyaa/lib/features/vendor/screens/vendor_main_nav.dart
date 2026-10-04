import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/app_role.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/role_switcher_sheet.dart';
import '../../customer/screens/customer_main_nav.dart';
import '../../driver/screens/driver_main_nav.dart';
import '../../admin/screens/admin_main_nav.dart';
import 'vendor_dashboard_screen.dart';
import 'vendor_earnings_screen.dart';
import 'vendor_requests_screen.dart';
import 'vendor_vehicles_screen.dart';

/// Vendor App Container (Section 31)
class VendorMainNav extends ConsumerStatefulWidget {
  const VendorMainNav({super.key});

  @override
  ConsumerState<VendorMainNav> createState() => _VendorMainNavState();
}

class _VendorMainNavState extends ConsumerState<VendorMainNav> {
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
      case AppRole.admin:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminMainNav()),
        );
        break;
      case AppRole.vendor:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      VendorDashboardScreen(
        onOpenRoleSwitcher: () {
          RoleSwitcherSheet.show(
            context,
            currentRole: AppRole.vendor,
            onRoleSelected: _switchRole,
          );
        },
      ),
      const VendorRequestsScreen(),
      const VendorVehiclesScreen(),
      const VendorEarningsScreen(),
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
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard, color: AppColors.black),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.list_alt_outlined),
                selectedIcon: Icon(Icons.list_alt, color: AppColors.black),
                label: 'Bookings',
              ),
              NavigationDestination(
                icon: Icon(Icons.directions_car_outlined),
                selectedIcon: Icon(Icons.directions_car, color: AppColors.black),
                label: 'Fleet',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_balance_wallet_outlined),
                selectedIcon: Icon(Icons.account_balance_wallet, color: AppColors.black),
                label: 'Earnings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

