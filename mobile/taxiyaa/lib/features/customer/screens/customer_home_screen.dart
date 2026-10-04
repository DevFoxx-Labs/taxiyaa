import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'location_picker_screen.dart';
import 'vehicle_list_screen.dart';

/// Customer Screen 03 — Location / Home Search (Section 8)
class CustomerHomeScreen extends ConsumerStatefulWidget {
  final VoidCallback onOpenRoleSwitcher;

  const CustomerHomeScreen({
    super.key,
    required this.onOpenRoleSwitcher,
  });

  @override
  ConsumerState<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends ConsumerState<CustomerHomeScreen> {
  final List<String> _tripTypes = ['One Way', 'Round Trip', 'Local', 'Airport'];

  final List<Map<String, String>> _popularRoutes = [
    {
      'from': 'Lucknow',
      'to': 'Ayodhya',
      'price': '₹3,800',
      'time': '2.5 hrs',
    },
    {
      'from': 'Lucknow',
      'to': 'Delhi',
      'price': '₹7,500',
      'time': '7 hrs',
    },
    {
      'from': 'Lucknow',
      'to': 'Varanasi',
      'price': '₹5,400',
      'time': '5.5 hrs',
    },
    {
      'from': 'Lucknow',
      'to': 'Prayagraj',
      'price': '₹4,200',
      'time': '4 hrs',
    },
  ];

  Future<void> _selectDateTime() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 90)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryDark,
            onPrimary: AppColors.white,
            surface: AppColors.white,
            onSurface: AppColors.black,
          ),
        ),
        child: child!,
      ),
    );

    if (pickedDate != null && mounted) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 10, minute: 0),
        builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryDark,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        ),
      );

      if (pickedTime != null && mounted) {
        final formattedDate =
            '${_weekdayName(pickedDate.weekday)}, ${pickedDate.day} ${_monthName(pickedDate.month)} ${pickedDate.year}';
        final formattedTime = pickedTime.format(context);
        ref
            .read(bookingSearchProvider.notifier)
            .updateDateTime(formattedDate, formattedTime);
      }
    }
  }

  String _weekdayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final searchParams = ref.watch(bookingSearchProvider);

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.local_taxi,
                color: AppColors.black,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConstants.appName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  'India’s Trusted Mobility',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz, color: AppColors.black),
            tooltip: 'Switch Portal (Role)',
            onPressed: widget.onOpenRoleSwitcher,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Header (Section 8)
            const Text(
              'Where are you going?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Reliable outstation cabs, airport rides & rentals',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textGray,
              ),
            ),
            const SizedBox(height: 16),

            // Quick Trip Types (One Way, Round Trip, Local, Airport)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tripTypes.map((type) {
                  final isSelected = searchParams.tripType == type;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(bookingSearchProvider.notifier)
                            .updateTripType(type);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primaryDark
                                : AppColors.border,
                          ),
                        ),
                        child: Text(
                          type,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // Location Card with Swap (Section 8)
            TaxiyaaCard(
              child: Column(
                children: [
                  // Pickup Location Row
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LocationPickerScreen(
                            title: 'Select Pickup Location',
                            initialLocation: searchParams.pickupLocation,
                          ),
                        ),
                      );
                      if (result != null && mounted) {
                        ref
                            .read(bookingSearchProvider.notifier)
                            .updatePickup(result);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: AppColors.success,
                            size: 12,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Pickup Location',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.textGray,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  searchParams.pickupLocation,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.edit_location_alt_outlined,
                            size: 20,
                            color: AppColors.textGray,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Divider with Swap button
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(height: 24, color: AppColors.border),
                      Positioned(
                        right: 8,
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(bookingSearchProvider.notifier)
                                .swapLocations();
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.border),
                            ),
                            child: const Icon(
                              Icons.swap_vert,
                              size: 18,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Drop Location Row
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LocationPickerScreen(
                            title: 'Select Destination',
                            initialLocation: searchParams.dropLocation,
                          ),
                        ),
                      );
                      if (result != null && mounted) {
                        ref
                            .read(bookingSearchProvider.notifier)
                            .updateDrop(result);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.error,
                            size: 14,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Drop Location',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.textGray,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  searchParams.dropLocation,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.edit_location_alt_outlined,
                            size: 20,
                            color: AppColors.textGray,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Date & Time Picker Card
            TaxiyaaCard(
              onTap: _selectDateTime,
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.black,
                    size: 22,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pickup Date & Time',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textGray,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${searchParams.pickupDate} • ${searchParams.pickupTime}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.textGray,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Search CTA (Section 8)
            TaxiyaaButton(
              text: 'Search Cabs',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const VehicleListScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 28),

            // Popular Routes section (Section 8)
            const Text(
              'Popular Routes Across India',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            ..._popularRoutes.map((route) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TaxiyaaCard(
                  onTap: () {
                    ref.read(bookingSearchProvider.notifier).updatePickup(
                          '${route['from']!}, Uttar Pradesh',
                        );
                    ref.read(bookingSearchProvider.notifier).updateDrop(
                          '${route['to']!}, India',
                        );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const VehicleListScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.lightYellow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.trending_up,
                              color: AppColors.primaryDark,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${route['from']} → ${route['to']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                '${route['time']} drive',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textGray,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            route['price']!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: AppColors.black,
                            ),
                          ),
                          const Text(
                            'Starting from',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
