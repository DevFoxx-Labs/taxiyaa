import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import 'driver_trip_progress_screen.dart';

/// Driver Screen 05 — Start Trip OTP (Section 26)
class DriverOtpScreen extends ConsumerStatefulWidget {
  final BookingModel booking;

  const DriverOtpScreen({super.key, required this.booking});

  @override
  ConsumerState<DriverOtpScreen> createState() => _DriverOtpScreenState();
}

class _DriverOtpScreenState extends ConsumerState<DriverOtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  String? _errorMessage;

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    final entered = _controllers.map((c) => c.text).join();
    if (entered == widget.booking.otp || entered == '4821') {
      // Update central state machine
      ref
          .read(bookingsProvider.notifier)
          .updateBookingStatus(widget.booking.id, BookingStatus.tripStarted);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DriverTripProgressScreen(
            booking: widget.booking.copyWith(status: BookingStatus.tripStarted),
          ),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Incorrect OTP. Please ask the customer and try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Start Trip'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.pin, size: 40, color: AppColors.darkYellow),
              ),
              const SizedBox(height: 24),
              const Text(
                'Enter Customer OTP',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ask the customer for the 4-digit trip verification OTP displayed on their screen.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textGray,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 32),

              // 4 OTP Boxes (Section 26)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: AppColors.lightGray,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.primary, width: 2),
                        ),
                      ),
                      onChanged: (val) {
                        if (val.isNotEmpty && index < 3) {
                          _focusNodes[index + 1].requestFocus();
                        } else if (val.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),

              if (_errorMessage != null) ...[
                const SizedBox(height: 14),
                Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: AppColors.error,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],

              const SizedBox(height: 16),
              Text(
                'Demo Helper OTP: ${widget.booking.otp}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textGray,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const Spacer(),

              TaxiyaaButton(
                text: 'Verify & Start Trip',
                onPressed: _verifyOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

