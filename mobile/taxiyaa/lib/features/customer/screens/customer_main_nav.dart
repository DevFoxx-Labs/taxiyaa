import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/app_role.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/role_switcher_sheet.dart';
import '../../driver/screens/driver_main_nav.dart';
import '../../vendor/screens/vendor_main_nav.dart';
import '../../admin/screens/admin_main_nav.dart';
import 'customer_home_screen.dart';
import 'customer_bookings_screen.dart';
import 'customer_support_screen.dart';
import 'customer_profile_screen.dart';

/// Customer App Container with 4-tab bottom navigation (Section 5)
class CustomerMainNav extends ConsumerStatefulWidget {
  final int initialIndex;

  const CustomerMainNav({super.key, this.initialIndex = 0});

  @override
  ConsumerState<CustomerMainNav> createState() => _CustomerMainNavState();
}

class _CustomerMainNavState extends ConsumerState<CustomerMainNav> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _switchRole(AppRole role) {
    ref.read(activeRoleProvider.notifier).setRole(role);
    switch (role) {
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminMainNav()),
        );
        break;
      case AppRole.customer:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      CustomerHomeScreen(
        onOpenRoleSwitcher: () {
          RoleSwitcherSheet.show(
            context,
            currentRole: AppRole.customer,
            onRoleSelected: _switchRole,
          );
        },
      ),
      const CustomerBookingsScreen(),
      const CustomerSupportScreen(),
      CustomerProfileScreen(
        onSwitchRole: () {
          RoleSwitcherSheet.show(
            context,
            currentRole: AppRole.customer,
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
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: AppColors.black),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_today_outlined),
                selectedIcon: Icon(Icons.calendar_today, color: AppColors.black),
                label: 'Bookings',
              ),
              NavigationDestination(
                icon: Icon(Icons.support_agent_outlined),
                selectedIcon: Icon(Icons.support_agent, color: AppColors.black),
                label: 'Support',
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

