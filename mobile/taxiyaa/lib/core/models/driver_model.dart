class DriverModel {
  final String id;
  final String name;
  final String phone;
  final String photo;
  final double rating;
  final int totalTrips;
  final String vehicleName;
  final String vehicleNumber;
  final String licenseNumber;
  final bool isOnline;
  final bool dlVerified;
  final bool rcVerified;
  final bool insuranceVerified;

  const DriverModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.photo,
    required this.rating,
    required this.totalTrips,
    required this.vehicleName,
    required this.vehicleNumber,
    this.licenseNumber = 'UP32 DL 20210045',
    this.isOnline = true,
    this.dlVerified = true,
    this.rcVerified = true,
    this.insuranceVerified = true,
  });

  DriverModel copyWith({
    bool? isOnline,
  }) {
    return DriverModel(
      id: id,
      name: name,
      phone: phone,
      photo: photo,
      rating: rating,
      totalTrips: totalTrips,
      vehicleName: vehicleName,
      vehicleNumber: vehicleNumber,
      licenseNumber: licenseNumber,
      isOnline: isOnline ?? this.isOnline,
      dlVerified: dlVerified,
      rcVerified: rcVerified,
      insuranceVerified: insuranceVerified,
    );
  }
}

