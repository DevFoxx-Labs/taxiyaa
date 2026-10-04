import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import 'driver_end_trip_screen.dart';

/// Driver Screen 06 — Trip in Progress (Section 27)
class DriverTripProgressScreen extends StatelessWidget {
  final BookingModel booking;

  const DriverTripProgressScreen({super.key, required this.booking});

  Future<void> _callCustomer(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E9EC),
      appBar: AppBar(
        title: const Text('Trip in Progress'),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: AppColors.black),
            onPressed: () => _callCustomer(booking.passengerPhone),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Map Background with Active Road Marker
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.local_taxi, color: AppColors.black, size: 40),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Text(
                    'Trip in Progress — Highway Route',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Top Header Summary & Timeline (Section 27)
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${booking.pickupLocation.split(',').first} → ${booking.dropLocation.split(',').first}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black,
                        ),
                      ),
                      const Text(
                        '400 km left',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Progress Timeline
                  Row(
                    children: [
                      _timelineStep('Pickup', true, true),
                      _timelineConnector(true),
                      _timelineStep('On Trip', true, false),
                      _timelineConnector(false),
                      _timelineStep('Drop', false, false),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Bar: Emergency SOS & "End Trip" CTA (Section 27)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rider: ${booking.passengerName}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(foregroundColor: AppColors.error),
                          icon: const Icon(Icons.emergency, size: 18),
                          label: const Text('SOS Help', style: TextStyle(fontWeight: FontWeight.w800)),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Taxiyaa Driver Safety Alert sent.')),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TaxiyaaButton(
                      text: 'End Trip',
                      backgroundColor: AppColors.error,
                      textColor: AppColors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DriverEndTripScreen(booking: booking),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timelineStep(String title, bool isDone, bool isPast) {
    return Column(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: isDone ? (isPast ? AppColors.success : AppColors.primary) : AppColors.lightGray,
            shape: BoxShape.circle,
            border: Border.all(
              color: isDone ? (isPast ? AppColors.success : AppColors.primaryDark) : AppColors.border,
            ),
          ),
          child: Icon(
            isDone ? Icons.check : Icons.circle,
            size: 12,
            color: isDone ? AppColors.black : Colors.transparent,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isDone ? FontWeight.w700 : FontWeight.w500,
            color: isDone ? AppColors.black : AppColors.textGray,
          ),
        ),
      ],
    );
  }

  Widget _timelineConnector(bool isDone) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 16),
        color: isDone ? AppColors.success : AppColors.border,
      ),
    );
  }
}

