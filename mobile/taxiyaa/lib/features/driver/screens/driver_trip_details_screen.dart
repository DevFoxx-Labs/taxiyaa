import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/route_timeline.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'driver_navigation_screen.dart';
import 'driver_otp_screen.dart';

/// Driver Screen 03 — Trip Details (Section 24)
class DriverTripDetailsScreen extends StatelessWidget {
  final BookingModel booking;

  const DriverTripDetailsScreen({super.key, required this.booking});

  Future<void> _callCustomer(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Trip Details'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip ID & Route Timeline (Section 24)
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        booking.id,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textGray,
                        ),
                      ),
                      Text(
                        booking.tripType,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkYellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  RouteTimeline(
                    pickup: booking.pickupLocation,
                    drop: booking.dropLocation,
                    pickupTime: 'Pickup: ${booking.pickupTime}',
                    dropTime: 'Estimated Drop: 2:30 PM',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Customer Details Card (Section 24)
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.lightGray,
                    child: const Icon(Icons.person, color: AppColors.black),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.passengerName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          booking.passengerPhone,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.black,
                    ),
                    icon: const Icon(Icons.call),
                    onPressed: () => _callCustomer(booking.passengerPhone),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Vehicle & Fare Summary Card (Section 24)
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Assigned Vehicle & Payout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textGray,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${booking.vehicle.name} • UP32 AB 1234',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        '₹${booking.customerPrice.toInt()}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  if (booking.specialInstructions.isNotEmpty) ...[
                    const Divider(height: 20, color: AppColors.border),
                    Text(
                      'Customer Notes: "${booking.specialInstructions}"',
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontStyle: FontStyle.italic,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action CTAs (Section 24)
            TaxiyaaButton(
              text: 'Start Navigation',
              icon: Icons.navigation,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DriverNavigationScreen(booking: booking),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            TaxiyaaOutlinedButton(
              text: 'Enter Customer OTP to Start Trip',
              icon: Icons.pin_outlined,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DriverOtpScreen(booking: booking),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

