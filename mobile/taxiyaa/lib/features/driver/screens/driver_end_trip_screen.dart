import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'driver_main_nav.dart';

/// Driver Screen 07 — End Trip (Section 28)
class DriverEndTripScreen extends ConsumerStatefulWidget {
  final BookingModel booking;

  const DriverEndTripScreen({super.key, required this.booking});

  @override
  ConsumerState<DriverEndTripScreen> createState() => _DriverEndTripScreenState();
}

class _DriverEndTripScreenState extends ConsumerState<DriverEndTripScreen> {
  bool _customerDropped = true;
  bool _noExtraCharges = true;
  bool _vehicleConditionGood = true;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submitEndTrip() {
    // Transition state machine to tripCompleted
    ref
        .read(bookingsProvider.notifier)
        .updateBookingStatus(widget.booking.id, BookingStatus.tripCompleted);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Trip completed successfully. Payout added to earnings.')),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const DriverMainNav()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('End Trip'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.flag, color: AppColors.success, size: 40),
              ),
              const SizedBox(height: 16),
              const Text(
                'Trip Completed',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Trip ID: ${widget.booking.id}',
                style: const TextStyle(fontSize: 13, color: AppColors.textGray),
              ),

              const SizedBox(height: 24),

              // Checklist (Section 28)
              TaxiyaaCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Completion Checklist',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _customerDropped,
                      activeColor: AppColors.primary,
                      checkColor: AppColors.black,
                      title: const Text('Customer dropped at destination'),
                      onChanged: (val) => setState(() => _customerDropped = val ?? true),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _noExtraCharges,
                      activeColor: AppColors.primary,
                      checkColor: AppColors.black,
                      title: const Text('Luggage collected & toll accounted for'),
                      onChanged: (val) => setState(() => _noExtraCharges = val ?? true),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _vehicleConditionGood,
                      activeColor: AppColors.primary,
                      checkColor: AppColors.black,
                      title: const Text('Vehicle in good condition'),
                      onChanged: (val) => setState(() => _vehicleConditionGood = val ?? true),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Optional note field
              TextField(
                controller: _noteController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Add trip notes or toll bill references (optional)',
                  hintStyle: const TextStyle(fontSize: 13, color: AppColors.textGray),
                  filled: true,
                  fillColor: AppColors.lightGray,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              TaxiyaaButton(
                text: 'Submit & Complete Trip',
                onPressed: _submitEndTrip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

