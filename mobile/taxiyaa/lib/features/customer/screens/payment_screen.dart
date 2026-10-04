import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/mock_seed_data.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/models/vehicle_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/price_breakdown.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'booking_confirmation_screen.dart';

/// Customer Screen 07 — Payment (Section 13)
class PaymentScreen extends ConsumerStatefulWidget {
  final VehicleModel vehicle;
  final String passengerName;
  final String passengerPhone;
  final String passengerEmail;
  final String specialInstructions;

  const PaymentScreen({
    super.key,
    required this.vehicle,
    required this.passengerName,
    required this.passengerPhone,
    required this.passengerEmail,
    required this.specialInstructions,
  });

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  String _selectedMethod = 'UPI (Google Pay, PhonePe, Paytm)';
  double _discount = 0;
  bool _couponApplied = false;
  bool _isProcessing = false;
  final TextEditingController _couponController = TextEditingController();

  void _applyCoupon() {
    if (_couponController.text.trim().toUpperCase() == 'TAXIYAA500') {
      setState(() {
        _discount = 500;
        _couponApplied = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Coupon TAXIYAA500 applied! ₹500 discount.')),
      );
    } else {
      setState(() {
        _discount = 250;
        _couponApplied = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Welcome promo applied! ₹250 discount.')),
      );
    }
  }

  Future<void> _handlePayment() async {
    setState(() {
      _isProcessing = true;
    });

    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;

    final searchParams = ref.read(bookingSearchProvider);
    final bookingId = 'TX-${DateTime.now().year}${DateTime.now().month.toString().padLeft(2, '0')}${DateTime.now().day.toString().padLeft(2, '0')}-000125';

    final total = widget.vehicle.basePrice - _discount;

    final newBooking = BookingModel(
      id: bookingId,
      pickupLocation: searchParams.pickupLocation,
      dropLocation: searchParams.dropLocation,
      pickupDate: searchParams.pickupDate,
      pickupTime: searchParams.pickupTime,
      tripType: searchParams.tripType,
      vehicle: widget.vehicle,
      passengerName: widget.passengerName,
      passengerPhone: widget.passengerPhone,
      passengerEmail: widget.passengerEmail,
      specialInstructions: widget.specialInstructions,
      status: BookingStatus.driverArriving,
      driver: MockSeedData.defaultDriver,
      vendor: MockSeedData.defaultVendor,
      otp: '4821',
      customerPrice: total,
      vendorBasePrice: total * 0.75,
      vendorTotal: total * 0.78,
      tax: 500,
      discount: _discount,
      platformMargin: total * 0.22,
      vendorPayout: total * 0.78,
      paymentMethod: _selectedMethod,
      paymentStatus: 'Paid',
    );

    // Save to centralized bookings provider
    ref.read(bookingsProvider.notifier).addBooking(newBooking);

    setState(() {
      _isProcessing = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BookingConfirmationScreen(booking: newBooking),
      ),
    );
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseFare = widget.vehicle.basePrice - 500;
    const taxes = 500.0;
    final total = (baseFare + taxes - _discount).clamp(0.0, 999999.0);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Payment'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Amount Summary Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Amount to Pay',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGray,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '₹${total.toInt()}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Coupon Code Input (Section 13)
                  TaxiyaaCard(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        const Icon(Icons.local_offer_outlined, color: AppColors.darkYellow, size: 22),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _couponController,
                            textCapitalization: TextCapitalization.characters,
                            decoration: const InputDecoration(
                              hintText: 'Enter coupon (e.g. TAXIYAA500)',
                              hintStyle: TextStyle(fontSize: 13, color: AppColors.textGray),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _couponApplied ? null : _applyCoupon,
                          child: Text(
                            _couponApplied ? 'Applied ✓' : 'Apply',
                            style: TextStyle(
                              color: _couponApplied ? AppColors.success : AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Payment Methods Radio List (Section 13)
                  const Text(
                    'Choose Payment Method',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  TaxiyaaCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        _methodTile('UPI (Google Pay, PhonePe, Paytm)', Icons.account_balance_wallet),
                        const Divider(height: 1, color: AppColors.border),
                        _methodTile('Credit / Debit Card', Icons.credit_card),
                        const Divider(height: 1, color: AppColors.border),
                        _methodTile('Net Banking', Icons.account_balance),
                        const Divider(height: 1, color: AppColors.border),
                        _methodTile('Wallet (Paytm, Mobikwik)', Icons.wallet),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Fare Breakdown
                  const Text(
                    'Fare Breakdown',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  PriceBreakdown(
                    baseFare: baseFare,
                    taxes: taxes,
                    discount: _discount,
                    total: total,
                  ),

                  const SizedBox(height: 16),

                  // Security notice
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, size: 14, color: AppColors.textGray),
                      SizedBox(width: 6),
                      Text(
                        'Secure 256-bit payment powered by payment gateway',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Sticky CTA
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: SafeArea(
              top: false,
              child: TaxiyaaButton(
                text: 'Pay ₹${total.toInt()}',
                isLoading: _isProcessing,
                onPressed: _handlePayment,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _methodTile(String title, IconData icon) {
    final isSelected = _selectedMethod == title;
    return ListTile(
      leading: Icon(icon, color: isSelected ? AppColors.darkYellow : AppColors.textGray),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      trailing: Radio<String>(
        value: title,
        groupValue: _selectedMethod,
        activeColor: AppColors.darkYellow,
        onChanged: (val) {
          if (val != null) {
            setState(() {
              _selectedMethod = val;
            });
          }
        },
      ),
      onTap: () {
        setState(() {
          _selectedMethod = title;
        });
      },
    );
  }
}

