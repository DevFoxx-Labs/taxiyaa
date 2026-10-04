class RouteItem {
  final String id;
  final String slug;
  final String title;
  final String from;
  final String to;
  final String distance;
  final String duration;
  final String startingFare;
  final String category;
  final String heroImage;
  final String description;
  final List<String> highlights;

  const RouteItem({
    required this.id,
    required this.slug,
    required this.title,
    required this.from,
    required this.to,
    required this.distance,
    required this.duration,
    required this.startingFare,
    required this.category,
    required this.heroImage,
    required this.description,
    required this.highlights,
  });

  factory RouteItem.fromJson(Map<String, dynamic> json) {
    return RouteItem(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String? ?? '',
      from: json['from'] as String? ?? '',
      to: json['to'] as String? ?? '',
      distance: json['distance'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      startingFare: json['startingFare'] as String? ?? '',
      category: json['category'] as String? ?? '',
      heroImage: json['heroImage'] as String? ?? '',
      description: json['description'] as String? ?? '',
      highlights: (json['highlights'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'title': title,
        'from': from,
        'to': to,
        'distance': distance,
        'duration': duration,
        'startingFare': startingFare,
        'category': category,
        'heroImage': heroImage,
        'description': description,
        'highlights': highlights,
      };
}

