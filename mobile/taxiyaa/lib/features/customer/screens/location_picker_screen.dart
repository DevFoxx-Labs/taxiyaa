import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';

/// Customer Screen: Location Picker (Section 9)
class LocationPickerScreen extends StatefulWidget {
  final String title;
  final String initialLocation;

  const LocationPickerScreen({
    super.key,
    required this.title,
    required this.initialLocation,
  });

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  late TextEditingController _searchController;
  late String _selectedLocation;

  final List<String> _suggestions = const [
    'Lucknow Airport (Chaudhary Charan Singh International)',
    'Charbagh Railway Station, Lucknow',
    'Hazratganj Market, Lucknow',
    'Gomti Nagar Extension, Lucknow',
    'Alambagh Bus Terminal, Lucknow',
    'Delhi IGI Airport Terminal 3',
    'New Delhi Railway Station (NDLS)',
    'Noida Sector 18, Uttar Pradesh',
  ];

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLocation;
    _searchController = TextEditingController(text: widget.initialLocation);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Field & Current Location
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  autofocus: false,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Search landmark, city or address',
                    hintStyle: const TextStyle(color: AppColors.textGray, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: AppColors.black),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 18),
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                              });
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: AppColors.lightGray,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 10),
                // Use Current Location
                InkWell(
                  onTap: () {
                    const myLoc = 'Current Location (Hazratganj, Lucknow)';
                    setState(() {
                      _selectedLocation = myLoc;
                      _searchController.text = myLoc;
                    });
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Icon(Icons.my_location, color: AppColors.primaryDark, size: 20),
                        SizedBox(width: 10),
                        Text(
                          'Use Current Location',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppColors.border),

          // Map Simulation View
          Container(
            height: 180,
            width: double.infinity,
            color: const Color(0xFFE5E9EC),
            child: Stack(
              children: [
                // Map grid graphics
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.location_on, color: AppColors.black, size: 28),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: const Text(
                          'Pinpoint on Map',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppColors.border),

          // Suggestions List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _suggestions.length,
              separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.border),
              separatorBuilder: (_, _) => const Divider(height: 1, color: AppColors.border),
              itemBuilder: (context, index) {
                final item = _suggestions[index];
                final isSelected = _selectedLocation == item;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.location_city, color: AppColors.textGray, size: 22),
                  title: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: AppColors.darkYellow)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedLocation = item;
                      _searchController.text = item;
                    });
                  },
                );
              },
            ),
          ),

          // Bottom Sheet Confirmation CTA
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.place, color: AppColors.primaryDark, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _selectedLocation,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TaxiyaaButton(
                    text: 'Confirm Location',
                    onPressed: () {
                      Navigator.pop(context, _selectedLocation);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

