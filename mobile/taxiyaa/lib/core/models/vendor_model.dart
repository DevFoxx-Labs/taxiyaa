class VendorModel {
  final String id;
  final String companyName;
  final String ownerName;
  final String phone;
  final String email;
  final int activeVehicles;
  final int activeDrivers;
  final int totalBookings;
  final double pendingEarnings;
  final double totalEarnings;
  final double rating;
  final String tier; // Platinum, Gold, Silver
  final String status; // Active, Pending, Suspended
  final bool isKycVerified;

  const VendorModel({
    required this.id,
    required this.companyName,
    required this.ownerName,
    required this.phone,
    required this.email,
    required this.activeVehicles,
    required this.activeDrivers,
    required this.totalBookings,
    required this.pendingEarnings,
    required this.totalEarnings,
    this.rating = 4.8,
    this.tier = 'Gold',
    this.status = 'Active',
    this.isKycVerified = true,
  });

  VendorModel copyWith({
    String? id,
    String? companyName,
    String? ownerName,
    String? phone,
    String? email,
    int? activeVehicles,
    int? activeDrivers,
    int? totalBookings,
    double? pendingEarnings,
    double? totalEarnings,
    double? rating,
    String? tier,
    String? status,
    bool? isKycVerified,
  }) {
    return VendorModel(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      ownerName: ownerName ?? this.ownerName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      activeVehicles: activeVehicles ?? this.activeVehicles,
      activeDrivers: activeDrivers ?? this.activeDrivers,
      totalBookings: totalBookings ?? this.totalBookings,
      pendingEarnings: pendingEarnings ?? this.pendingEarnings,
      totalEarnings: totalEarnings ?? this.totalEarnings,
      rating: rating ?? this.rating,
      tier: tier ?? this.tier,
      status: status ?? this.status,
      isKycVerified: isKycVerified ?? this.isKycVerified,
    );
  }
}

