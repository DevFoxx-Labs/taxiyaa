import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/vehicle_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_chip.dart';
import '../../../core/widgets/vehicle_card.dart';
import 'vehicle_details_screen.dart';

/// Customer Screen 04 — Vehicle List (Section 10)
class VehicleListScreen extends ConsumerStatefulWidget {
  const VehicleListScreen({super.key});

  @override
  ConsumerState<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends ConsumerState<VehicleListScreen> {
  VehicleCategory _selectedCategory = VehicleCategory.all;
  String _sortBy = 'Recommended'; // Recommended, Low to High, Capacity

  @override
  Widget build(BuildContext context) {
    final searchParams = ref.watch(bookingSearchProvider);
    final allVehicles = ref.watch(vehiclesProvider);

    // Filter vehicles
    var filtered = allVehicles.where((v) {
      if (_selectedCategory == VehicleCategory.all) return true;
      return v.category == _selectedCategory;
    }).toList();

    // Sort vehicles
    if (_sortBy == 'Price: Low to High') {
      filtered.sort((a, b) => a.basePrice.compareTo(b.basePrice));
    } else if (_sortBy == 'Seating Capacity') {
      filtered.sort((a, b) => b.seats.compareTo(a.seats));
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${searchParams.pickupLocation.split(',').first} → ${searchParams.dropLocation.split(',').first}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            Text(
              '${searchParams.pickupDate} • ${searchParams.pickupTime} • ${searchParams.tripType}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: AppColors.black),
            onPressed: () => _showSortModal(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips Bar
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: VehicleCategory.values.map((cat) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TaxiyaaChip(
                      label: cat.label,
                      isSelected: _selectedCategory == cat,
                      onSelected: () {
                        setState(() {
                          _selectedCategory = cat;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const Divider(height: 1, color: AppColors.border),

          // Vehicle List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final vehicle = filtered[index];
                return VehicleCard(
                  vehicle: vehicle,
                  onSelect: () {
                    ref.read(bookingSearchProvider.notifier).selectVehicle(vehicle);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VehicleDetailsScreen(vehicle: vehicle),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSortModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    'Sort Vehicles By',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ),
                ...['Recommended', 'Price: Low to High', 'Seating Capacity'].map((option) {
                  final isSelected = _sortBy == option;
                  return ListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check, color: AppColors.darkYellow)
                        : null,
                    onTap: () {
                      setState(() {
                        _sortBy = option;
                      });
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

