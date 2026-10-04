import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/app_role.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/role_switcher_sheet.dart';
import '../../customer/screens/customer_main_nav.dart';
import '../../vendor/screens/vendor_main_nav.dart';
import '../../admin/screens/admin_main_nav.dart';
import 'driver_dashboard_screen.dart';
import 'driver_earnings_screen.dart';
import 'driver_profile_screen.dart';
import 'driver_trips_screen.dart';

/// Driver App Container (Section 21)
class DriverMainNav extends ConsumerStatefulWidget {
  const DriverMainNav({super.key});

  @override
  ConsumerState<DriverMainNav> createState() => _DriverMainNavState();
}

class _DriverMainNavState extends ConsumerState<DriverMainNav> {
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
      case AppRole.vendor:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const VendorMainNav()),
        );
        break;
      case AppRole.admin:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminMainNav()),
        );
        break;
      case AppRole.driver:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      DriverDashboardScreen(
        onOpenRoleSwitcher: () {
          RoleSwitcherSheet.show(
            context,
            currentRole: AppRole.driver,
            onRoleSelected: _switchRole,
          );
        },
      ),
      const DriverTripsScreen(),
      const DriverEarningsScreen(),
      DriverProfileScreen(
        onSwitchRole: () {
          RoleSwitcherSheet.show(
            context,
            currentRole: AppRole.driver,
            onRoleSelected: _switchRole,
          );
        },
      ),
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
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: AppColors.black),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.alt_route_outlined),
                selectedIcon: Icon(Icons.alt_route, color: AppColors.black),
                label: 'Trips',
              ),
              NavigationDestination(
                icon: Icon(Icons.currency_rupee_outlined),
                selectedIcon: Icon(Icons.currency_rupee, color: AppColors.black),
                label: 'Earnings',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person, color: AppColors.black),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

