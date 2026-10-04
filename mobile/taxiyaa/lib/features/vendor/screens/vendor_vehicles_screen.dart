import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/vehicle_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import '../../../core/widgets/taxiyaa_text_field.dart';

/// Screen 03 - Fleet & Vehicles Management (Section 35)
class VendorVehiclesScreen extends ConsumerStatefulWidget {
  const VendorVehiclesScreen({super.key});

  @override
  ConsumerState<VendorVehiclesScreen> createState() => _VendorVehiclesScreenState();
}

class _VendorVehiclesScreenState extends ConsumerState<VendorVehiclesScreen> {
  String _selectedFilter = 'All';

  final List<String> _filters = ['All', 'Available', 'On Trip', 'Maintenance'];

  void _showAddVehicleModal() {
    final modelController = TextEditingController();
    final regController = TextEditingController();
    VehicleCategory category = VehicleCategory.sedan;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add New Vehicle',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TaxiyaaTextField(
                label: 'Vehicle Model & Name',
                hint: 'e.g. Maruti Suzuki Ertiga',
                controller: modelController,
              ),
              const SizedBox(height: 16),
              TaxiyaaTextField(
                label: 'Registration Number',
                hint: 'e.g. UP32 XY 9988',
                controller: regController,
              ),
              const SizedBox(height: 16),
              const Text(
                'Category',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: VehicleCategory.values.map((cat) {
                  final isSel = category == cat;
                  return ChoiceChip(
                    label: Text(cat.name.toUpperCase()),
                    selected: isSel,
                    selectedColor: AppColors.primary,
                    onSelected: (val) {
                      if (val) setModalState(() => category = cat);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              TaxiyaaButton(
                text: 'Save Vehicle to Fleet',
                onPressed: () {
                  if (modelController.text.trim().isEmpty ||
                      regController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter model and registration number')),
                    );
                    return;
                  }
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.black,
                      content: Text('Vehicle ${regController.text} added to fleet!'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vehicles = ref.watch(vehiclesProvider);

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Fleet Management',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.black),
            tooltip: 'Add Vehicle',
            onPressed: _showAddVehicleModal,
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.lightGray,
                      labelStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        color: AppColors.black,
                      ),
                      onSelected: (val) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Vehicle List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                // Simulated status based on index
                final String status;
                final Color statusColor;
                if (index == 0) {
                  status = 'On Trip';
                  statusColor = AppColors.info;
                } else if (index == 4) {
                  status = 'Maintenance';
                  statusColor = AppColors.warning;
                } else {
                  status = 'Available';
                  statusColor = AppColors.success;
                }

                if (_selectedFilter != 'All' && _selectedFilter != status) {
                  return const SizedBox.shrink();
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: TaxiyaaCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.directions_car,
                                    size: 24, color: AppColors.black),
                                const SizedBox(width: 8),
                                Text(
                                  vehicle.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: statusColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: statusColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Reg No: ${vehicle.registrationNo}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGray,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _buildSpecBadge(Icons.airline_seat_recline_normal,
                                '${vehicle.seats} Seats'),
                            const SizedBox(width: 8),
                            _buildSpecBadge(Icons.luggage, '${vehicle.bags} Bags'),
                            const SizedBox(width: 8),
                            _buildSpecBadge(Icons.ac_unit, 'AC'),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Base Rate: ₹${vehicle.basePrice.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              'Extra: ₹${vehicle.extraKmRate.toStringAsFixed(0)}/km',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.black,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Vehicle',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: _showAddVehicleModal,
      ),
    );
  }

  Widget _buildSpecBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.textGray),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: AppColors.textGray),
          ),
        ],
      ),
    );
  }
}

