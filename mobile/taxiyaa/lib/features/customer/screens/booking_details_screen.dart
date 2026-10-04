import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/vehicle_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import '../../../core/widgets/taxiyaa_text_field.dart';
import 'payment_screen.dart';

/// Customer Screen 06 — Booking Details (Section 12)
class BookingDetailsScreen extends ConsumerStatefulWidget {
  final VehicleModel vehicle;

  const BookingDetailsScreen({super.key, required this.vehicle});

  @override
  ConsumerState<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends ConsumerState<BookingDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _instructionsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Rahul Kumar');
    _phoneController = TextEditingController(text: '+91 98765 43210');
    _emailController = TextEditingController(text: 'rahul@example.com');
    _instructionsController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PaymentScreen(
            vehicle: widget.vehicle,
            passengerName: _nameController.text.trim(),
            passengerPhone: _phoneController.text.trim(),
            passengerEmail: _emailController.text.trim(),
            specialInstructions: _instructionsController.text.trim(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchParams = ref.watch(bookingSearchProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Booking Details'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Route Summary Card
                    TaxiyaaCard(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.route, color: AppColors.black, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${searchParams.pickupLocation.split(',').first} → ${searchParams.dropLocation.split(',').first}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${searchParams.pickupDate} • ${searchParams.pickupTime} • ${searchParams.tripType}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, size: 18, color: AppColors.darkYellow),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Vehicle Card Summary
                    TaxiyaaCard(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              widget.vehicle.image,
                              width: 60,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.vehicle.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  widget.vehicle.subtitle,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.vehicle.formattedPrice,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Passenger Details Form (Section 12)
                    const Text(
                      'Passenger Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 12),

                    TaxiyaaCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TaxiyaaTextField(
                            label: 'Full Name',
                            hint: 'Enter traveler full name',
                            controller: _nameController,
                            prefixIcon: const Icon(Icons.person_outline, size: 20),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return 'Please enter passenger name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),
                          TaxiyaaTextField(
                            label: 'Mobile Number',
                            hint: '+91 98765 43210',
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            prefixIcon: const Icon(Icons.phone_outlined, size: 20),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return 'Please enter mobile number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),
                          TaxiyaaTextField(
                            label: 'Email (Optional)',
                            hint: 'rahul@example.com (for invoice)',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined, size: 20),
                          ),
                          const SizedBox(height: 14),
                          TaxiyaaTextField(
                            label: 'Special Instructions (Optional)',
                            hint: 'Airport terminal pickup, child seat, extra luggage',
                            controller: _instructionsController,
                            maxLines: 2,
                            prefixIcon: const Icon(Icons.notes, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Sticky CTA (Section 12)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: SafeArea(
              top: false,
              child: TaxiyaaButton(
                text: 'Continue',
                onPressed: _onContinue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

