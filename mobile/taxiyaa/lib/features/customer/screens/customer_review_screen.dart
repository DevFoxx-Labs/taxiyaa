import 'package:flutter/material.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Customer Screen: Review (Section 20)
class CustomerReviewScreen extends StatefulWidget {
  final BookingModel booking;

  const CustomerReviewScreen({super.key, required this.booking});

  @override
  State<CustomerReviewScreen> createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReviewScreen> {
  int _overallRating = 5;
  int _driverRating = 5;
  int _vehicleRating = 5;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitReview() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you! Your feedback has been submitted.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Rate Your Trip'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TaxiyaaCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'How was your trip?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Trip ${widget.booking.id}',
                    style: const TextStyle(fontSize: 13, color: AppColors.textGray),
                  ),
                  const SizedBox(height: 18),
                  // Overall Stars
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final star = index + 1;
                      return IconButton(
                        iconSize: 36,
                        icon: Icon(
                          star <= _overallRating ? Icons.star : Icons.star_border,
                          color: AppColors.primaryDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _overallRating = star;
                          });
                        },
                      );
                    }),
                  ),
                  const Divider(height: 28, color: AppColors.border),
                  // Driver Rating
                  _starRow('Chauffeur (${widget.booking.driver?.name ?? 'Driver'})', _driverRating, (val) {
                    setState(() => _driverRating = val);
                  }),
                  const SizedBox(height: 14),
                  // Vehicle Rating
                  _starRow('Vehicle Condition (${widget.booking.vehicle.name})', _vehicleRating, (val) {
                    setState(() => _vehicleRating = val);
                  }),
                  const SizedBox(height: 20),
                  // Comment box
                  TextField(
                    controller: _commentController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Write a few words about your experience (optional)',
                      hintStyle: const TextStyle(fontSize: 13, color: AppColors.textGray),
                      filled: true,
                      fillColor: AppColors.lightGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TaxiyaaButton(
              text: 'Submit Review',
              onPressed: _submitReview,
            ),
          ],
        ),
      ),
    );
  }

  Widget _starRow(String title, int current, void Function(int) onSelect) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            final star = index + 1;
            return GestureDetector(
              onTap: () => onSelect(star),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  star <= current ? Icons.star : Icons.star_border,
                  size: 20,
                  color: AppColors.primaryDark,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

