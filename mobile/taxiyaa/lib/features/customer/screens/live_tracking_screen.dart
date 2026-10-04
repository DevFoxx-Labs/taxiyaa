import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/theme/app_colors.dart';

/// Customer Screen 09 — Live Tracking (Section 15)
class LiveTrackingScreen extends StatefulWidget {
  final BookingModel booking;

  const LiveTrackingScreen({super.key, required this.booking});

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  String _currentStatus = 'Driver Arriving';
  String _eta = '15 mins away';

  Future<void> _makeCall(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('${AppConstants.whatsappUrl}?text=Hello%20Taxiyaa%20Driver');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final driver = widget.booking.driver;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Live Tracking'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Trip tracking link copied: taxiyaa.com/track/${widget.booking.id}'),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Simulated Full Screen Map Interface (Section 15 & 57)
          Container(
            color: const Color(0xFFE8ECEF),
            child: Stack(
              children: [
                // Stylized map roads and route polyline
                CustomPaint(
                  size: Size.infinite,
                  painter: _MapPolylinePainter(),
                ),

                // Pickup Marker (Green)
                const Positioned(
                  bottom: 240,
                  left: 60,
                  child: Column(
                    children: [
                      Icon(Icons.location_on, color: AppColors.success, size: 36),
                      Text(
                        'Pickup: Lucknow',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          backgroundColor: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                // Destination Marker (Red)
                const Positioned(
                  top: 90,
                  right: 70,
                  child: Column(
                    children: [
                      Icon(Icons.flag, color: AppColors.error, size: 36),
                      Text(
                        'Drop: Delhi',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          backgroundColor: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                // Driver Car Marker (Animated along path)
                Positioned(
                  bottom: 300,
                  left: 140,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.local_taxi, color: AppColors.black, size: 24),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Amit Singh',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Top Floating Status Card
                SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.near_me, color: AppColors.darkYellow, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _currentStatus,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  _eta,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'OTP: ${widget.booking.otp}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Sheet: Driver Card & Actions (Section 15)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: AppColors.lightGray,
                          child: const Icon(Icons.person, color: AppColors.black, size: 30),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                driver?.name ?? 'Amit Singh',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: AppColors.darkYellow, size: 14),
                                  const SizedBox(width: 3),
                                  Text(
                                    '${driver?.rating ?? 4.8} • ${driver?.totalTrips ?? 5200} trips',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${driver?.vehicleNumber ?? 'UP32 AB 1234'} • ${widget.booking.vehicle.name}',
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Actions Bar: Call, WhatsApp, SOS (Section 15)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.black,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.call, size: 18),
                            label: const Text('Call', style: TextStyle(fontWeight: FontWeight.w700)),
                            onPressed: () => _makeCall(driver?.phone ?? '+919876543210'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF25D366),
                              foregroundColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.chat, size: 18),
                            label: const Text('WhatsApp', style: TextStyle(fontWeight: FontWeight.w700)),
                            onPressed: _openWhatsApp,
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            side: const BorderSide(color: AppColors.error),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Taxiyaa 24/7 Hotline Alert Triggered. Support contacting you.'),
                              ),
                            );
                          },
                          child: const Text('SOS', style: TextStyle(fontWeight: FontWeight.w800)),
                        ),
                      ],
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
}

class _MapPolylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.info
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.7);
    path.cubicTo(
      size.width * 0.35,
      size.height * 0.55,
      size.width * 0.5,
      size.height * 0.45,
      size.width * 0.75,
      size.height * 0.25,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

