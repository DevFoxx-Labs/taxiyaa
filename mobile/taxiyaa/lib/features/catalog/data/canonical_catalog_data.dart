import '../models/route_item.dart';
import '../models/service_item.dart';

/// Canonical catalog data mirroring web platform (data/servicesData.ts & data/routesData.ts)
/// (GEMINI.md Rule 1.2: CANONICAL CATALOG DATA)
class CanonicalCatalogData {
  CanonicalCatalogData._();

  static const List<ServiceItem> services = [
    ServiceItem(
      id: 'service1',
      slug: 'car-rental-local-outstation',
      title: 'Car Rental / Local & Outstation',
      subtitle: 'Premium City Rides & Intercity Outstation Cab Travel',
      badge: 'Local & Outstation',
      description:
          'Comfortable, sanitized, and reliable cabs for local hourly rental, outstation getaways, business trips, and one-way drops.',
      heroImage: 'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?auto=format&fit=crop&w=800&q=80',
      keyFeatures: [
        '24/7 Doorstep Pickup across Mumbai & Metropolitan Suburbs',
        'Fixed Transparent Fares with Zero Surge Pricing',
        'Sanitized Fleet (Swift Dzire, Ertiga, Innova Crysta)',
        'Polite, Background-Verified & Experienced Chauffeurs',
        'Flexible Hourly Local Packages & Outstation Per-KM Pricing',
      ],
      recommendedVehicles: [
        RecommendedVehicle(name: 'Swift Dzire / Etios', type: 'Executive Sedan', capacity: '4 Seats', price: '₹12/km'),
        RecommendedVehicle(name: 'Maruti Ertiga AC', type: 'Family SUV', capacity: '6 Seats', price: '₹15/km'),
        RecommendedVehicle(name: 'Toyota Innova Crysta', type: 'Luxury SUV', capacity: '7 Seats', price: '₹18/km'),
      ],
    ),
    ServiceItem(
      id: 'service2',
      slug: 'airport-transfer-cabs',
      title: 'Airport Transfer Cabs',
      subtitle: 'Punctual Transfers to Mumbai CSMIA T1 & T2',
      badge: 'Airport Special',
      description:
          'Guaranteed on-time airport drop-offs and terminal pickups with flight tracking and polite luggage handling.',
      heroImage: 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=800&q=80',
      keyFeatures: [
        'On-Time Flight Tracking for Terminal 1 & 2',
        'Pre-Booked Confirmed Chauffeur with Name Board',
        'Zero Waiting Toll Surges at Airport Bays',
        'Spacious Boot for Heavy Airline Luggage',
      ],
      recommendedVehicles: [
        RecommendedVehicle(name: 'Toyota Innova Crysta', type: 'Luxury SUV', capacity: '7 Seats', price: '₹1,800 Flat'),
        RecommendedVehicle(name: 'Swift Dzire AC', type: 'Executive Sedan', capacity: '4 Seats', price: '₹999 Flat'),
      ],
    ),
    ServiceItem(
      id: 'service3',
      slug: 'vip-tempo-traveller',
      title: 'VIP Maharaja Tempo Traveller',
      subtitle: 'Luxury Group Travel & Pilgrimage Tours',
      badge: 'VIP Group Fleet',
      description:
          '13, 17, 20 & 26-seater luxury AC Tempo Travellers with pushback leather seats, LED TV, and individual AC vents.',
      heroImage: 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?auto=format&fit=crop&w=800&q=80',
      keyFeatures: [
        'Pushback Maharaja Reclining Captain Seats',
        'Surround Sound Audio System & LED Screens',
        'Air Suspension for Smooth Highway Journeys',
        'Ideal for Shirdi, Mahabaleshwar, Goa & Weddings',
      ],
      recommendedVehicles: [
        RecommendedVehicle(name: '17-Seater Maharaja VIP', type: 'Luxury Minibus', capacity: '17 Seats', price: '₹24/km'),
        RecommendedVehicle(name: '26-Seater Executive Coach', type: 'Large Coach', capacity: '26 Seats', price: '₹32/km'),
      ],
    ),
  ];

  static const List<RouteItem> routes = [
    RouteItem(
      id: 'route1',
      slug: 'mumbai-to-pune-cab',
      title: 'Mumbai to Pune Cab Service',
      from: 'Mumbai',
      to: 'Pune',
      distance: '150 km',
      duration: '3.0 Hours',
      startingFare: '₹2,499',
      category: 'expressway',
      heroImage: 'https://images.unsplash.com/photo-1570125909232-eb263c188f7e?auto=format&fit=crop&w=800&q=80',
      description:
          'Book fast, comfortable Mumbai to Pune one-way and roundtrip cabs via the Mumbai-Pune Expressway with doorstep pickup.',
      highlights: [
        'Fixed transparent pricing via Expressway',
        'One-way drop & roundtrip daily options',
        'Pickups from CSMIA Airport, BKC, Andheri & Goregaon',
      ],
    ),
    RouteItem(
      id: 'route2',
      slug: 'mumbai-to-shirdi-cab',
      title: 'Mumbai to Shirdi Pilgrimage Taxi',
      from: 'Mumbai',
      to: 'Shirdi',
      distance: '240 km',
      duration: '4.5 Hours',
      startingFare: '₹3,999',
      category: 'pilgrimage',
      heroImage: 'https://images.unsplash.com/photo-1609137144822-47565b99a6c9?auto=format&fit=crop&w=800&q=80',
      description:
          'Devotional and serene outstation cab travel via Samruddhi Mahamarg expressway for hassle-free Sai Baba darshan.',
      highlights: [
        'Samruddhi Mahamarg ultra-fast route',
        'Same-day return and 2-day packages available',
        'Chauffeur assistance for VIP temple darshan',
      ],
    ),
    RouteItem(
      id: 'route3',
      slug: 'mumbai-to-goa-cab',
      title: 'Mumbai to Goa Roadtrip Cab',
      from: 'Mumbai',
      to: 'Goa',
      distance: '590 km',
      duration: '10.5 Hours',
      startingFare: '₹9,499',
      category: 'coastal',
      heroImage: 'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=800&q=80',
      description:
          'Scenic Konkan coastal drive or NH48 route with flexible halts, rooftop luggage carrier, and chilled AC comfort.',
      highlights: [
        'Experienced Konkan ghat chauffeurs',
        'Doorstep pickup in Mumbai to any North/South Goa beach resort',
        'Zero hidden charges on highway tolls',
      ],
    ),
  ];
}

