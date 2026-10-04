enum VehicleCategory {
  all('All'),
  sedan('Sedan'),
  suv('SUV'),
  tempoTraveller('Tempo Traveller'),
  luxury('Luxury');

  final String label;
  const VehicleCategory(this.label);
}

class VehicleModel {
  final String id;
  final String name;
  final String subtitle;
  final VehicleCategory category;
  final String image;
  final int seats;
  final int bags;
  final bool hasAc;
  final bool hasMusic;
  final double basePrice;
  final double extraKmRate;
  final String registrationNo;
  final String status;
  final List<String> inclusions;
  final List<String> features;

  const VehicleModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.image,
    required this.seats,
    required this.bags,
    this.hasAc = true,
    this.hasMusic = true,
    required this.basePrice,
    required this.extraKmRate,
    this.registrationNo = '',
    this.status = 'Available',
    this.inclusions = const [
      'Driver Allowance',
      'Toll Charges',
      'State Tax',
      'Up to 400 km included',
    ],
    this.features = const [
      'Clean & Sanitized',
      'Chilled AC',
      'Luggage Boot Space',
      'Emergency SOS',
    ],
  });

  String get formattedPrice => '₹${basePrice.toInt()}';
  String get formattedExtraKm => 'Extra KM: ₹${extraKmRate.toInt()}/km';
}

