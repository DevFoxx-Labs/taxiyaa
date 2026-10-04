import 'package:flutter/material.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'customer_main_nav.dart';
import 'live_tracking_screen.dart';

/// Customer Screen 08 — Booking Confirmation (Section 14)
class BookingConfirmationScreen extends StatelessWidget {
  final BookingModel booking;

  const BookingConfirmationScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const CustomerMainNav(initialIndex: 1)),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: AppColors.black),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const CustomerMainNav()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Green Check Success Icon (Section 14)
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: AppColors.success,
                            size: 56,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Booking Confirmed!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Booking ID: ${booking.id}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textGray,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Trip Details Card (Section 14)
                        TaxiyaaCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
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
                                  Text(
                                    '₹${booking.customerPrice.toInt()}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${booking.pickupDate} • ${booking.pickupTime}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textGray,
                                ),
                              ),
                              const Divider(height: 24, color: AppColors.border),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      booking.vehicle.image,
                                      width: 50,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        booking.vehicle.name,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        booking.driver?.vehicleNumber ?? 'UP32 AB 1234',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (booking.driver != null) ...[
                                const SizedBox(height: 14),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: AppColors.lightGray,
                                      child: const Icon(Icons.person, color: AppColors.black),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            booking.driver!.name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.star, color: AppColors.darkYellow, size: 14),
                                              const SizedBox(width: 2),
                                              Text(
                                                '${booking.driver!.rating} • Verified Chauffeur',
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
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // OTP Callout Banner
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trip Start OTP',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkGray,
                                    ),
                                  ),
                                  Text(
                                    'Share with chauffeur at pickup',
                                    style: TextStyle(fontSize: 11, color: AppColors.textGray),
                                  ),
                                ],
                              ),
                              Text(
                                booking.otp,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.black,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Primary & Secondary Actions
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 8),
                  child: Column(
                    children: [
                      TaxiyaaButton(
                        text: 'Track Ride',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LiveTrackingScreen(booking: booking),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      TaxiyaaOutlinedButton(
                        text: 'View in My Bookings',
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CustomerMainNav(initialIndex: 1),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

