class ServiceItem {
  final String id;
  final String slug;
  final String title;
  final String subtitle;
  final String badge;
  final String description;
  final String heroImage;
  final List<String> keyFeatures;
  final List<RecommendedVehicle> recommendedVehicles;

  const ServiceItem({
    required this.id,
    required this.slug,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.description,
    required this.heroImage,
    required this.keyFeatures,
    required this.recommendedVehicles,
  });

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      badge: json['badge'] as String? ?? '',
      description: json['description'] as String? ?? '',
      heroImage: json['heroImage'] as String? ?? '',
      keyFeatures: (json['keyFeatures'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      recommendedVehicles: (json['recommendedVehicles'] as List<dynamic>?)
              ?.map((e) => RecommendedVehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'title': title,
        'subtitle': subtitle,
        'badge': badge,
        'description': description,
        'heroImage': heroImage,
        'keyFeatures': keyFeatures,
        'recommendedVehicles':
            recommendedVehicles.map((e) => e.toJson()).toList(),
      };
}

class RecommendedVehicle {
  final String name;
  final String type;
  final String capacity;
  final String price;

  const RecommendedVehicle({
    required this.name,
    required this.type,
    required this.capacity,
    required this.price,
  });

  factory RecommendedVehicle.fromJson(Map<String, dynamic> json) {
    return RecommendedVehicle(
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      capacity: json['capacity'] as String? ?? '',
      price: json['price'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'capacity': capacity,
        'price': price,
      };
}

