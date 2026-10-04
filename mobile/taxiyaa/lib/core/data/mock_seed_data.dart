import '../models/booking_model.dart';
import '../models/driver_model.dart';
import '../models/vehicle_model.dart';
import '../models/vendor_model.dart';

class MockSeedData {
  MockSeedData._();

  static const List<VehicleModel> vehicles = [
    VehicleModel(
      id: 'v1',
      name: 'Dzire / Etios',
      subtitle: '4 Seater • AC',
      category: VehicleCategory.sedan,
      image: 'assets/images/fleet/swift_dzire.jpg',
      seats: 4,
      bags: 2,
      basePrice: 7500,
      extraKmRate: 14,
      registrationNo: 'UP32 CD 5678',
    ),
    VehicleModel(
      id: 'v2',
      name: 'Toyota Innova',
      subtitle: '7 Seater • AC',
      category: VehicleCategory.suv,
      image: 'assets/images/fleet/innova_crysta.jpg',
      seats: 7,
      bags: 4,
      basePrice: 9500,
      extraKmRate: 18,
      registrationNo: 'UP32 AB 1234',
    ),
    VehicleModel(
      id: 'v3',
      name: 'Innova Crysta',
      subtitle: '6/7 Seater • AC Luxury',
      category: VehicleCategory.suv,
      image: 'assets/images/fleet/innova_crysta.jpg',
      seats: 7,
      bags: 5,
      basePrice: 11500,
      extraKmRate: 20,
      registrationNo: 'UP32 EF 9012',
    ),
    VehicleModel(
      id: 'v4',
      name: 'Tempo Traveller',
      subtitle: '16 Seater • AC Maharaja',
      category: VehicleCategory.tempoTraveller,
      image: 'assets/images/fleet/maharaja_traveller.jpg',
      seats: 16,
      bags: 10,
      basePrice: 16500,
      extraKmRate: 26,
      registrationNo: 'UP32 TT 3456',
    ),
    VehicleModel(
      id: 'v5',
      name: 'Mercedes / BMW',
      subtitle: 'Executive VIP Luxury',
      category: VehicleCategory.luxury,
      image: 'assets/images/fleet/mercedes_luxury.jpg',
      seats: 4,
      bags: 3,
      basePrice: 24000,
      extraKmRate: 45,
      registrationNo: 'UP32 LX 0001',
    ),
  ];

  static const DriverModel defaultDriver = DriverModel(
    id: 'd1',
    name: 'Amit Singh',
    phone: '+91 98765 43210',
    photo: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&q=80',
    rating: 4.8,
    totalTrips: 5200,
    vehicleName: 'Toyota Innova',
    vehicleNumber: 'UP32 AB 1234',
  );

  static const DriverModel secondDriver = DriverModel(
    id: 'd2',
    name: 'Ramesh Yadav',
    phone: '+91 91234 56789',
    photo: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&q=80',
    rating: 4.9,
    totalTrips: 3100,
    vehicleName: 'Maruti Dzire',
    vehicleNumber: 'UP32 CD 5678',
  );

  static const List<DriverModel> drivers = [
    defaultDriver,
    secondDriver,
  ];

  static const VendorModel defaultVendor = VendorModel(
    id: 'VN-10001',
    companyName: 'ABC Travels',
    ownerName: 'Vikas Sharma',
    phone: '+91 99887 76655',
    email: 'info@abctravels.in',
    activeVehicles: 12,
    activeDrivers: 8,
    totalBookings: 18,
    pendingEarnings: 124500,
    totalEarnings: 450000,
    rating: 4.8,
  );

  static const VendorModel secondVendor = VendorModel(
    id: 'VN-10002',
    companyName: 'Royal Cabs & Fleet',
    ownerName: 'Sunil Verma',
    phone: '+91 98112 23344',
    email: 'contact@royalcabs.in',
    activeVehicles: 8,
    activeDrivers: 6,
    totalBookings: 32,
    pendingEarnings: 84000,
    totalEarnings: 310000,
    rating: 4.9,
    tier: 'Platinum',
    status: 'Active',
  );

  static const List<VendorModel> vendors = [
    defaultVendor,
    secondVendor,
  ];

  static final List<BookingModel> bookings = [
    BookingModel(
      id: 'TX-20261012-000125',
      pickupLocation: 'Lucknow, Uttar Pradesh',
      dropLocation: 'Delhi, India',
      pickupDate: 'Thu, 12 Oct 2026',
      pickupTime: '10:00 AM',
      tripType: 'One Way',
      vehicle: vehicles[1], // Innova
      passengerName: 'Rahul Kumar',
      passengerPhone: '+91 98765 43210',
      passengerEmail: 'rahul@example.com',
      specialInstructions: 'Need clean AC car with luggage boot space',
      status: BookingStatus.driverArriving,
      driver: defaultDriver,
      vendor: defaultVendor,
      otp: '4821',
      customerPrice: 9500,
      vendorBasePrice: 7000,
      vendorExtraCharges: 500,
      vendorTotal: 7500,
      tax: 500,
      discount: 0,
      platformMargin: 1500,
      vendorPayout: 7500,
    ),
    BookingModel(
      id: 'TX-20261001-000088',
      pickupLocation: 'Lucknow, Uttar Pradesh',
      dropLocation: 'Ayodhya, India',
      pickupDate: '01 Oct 2026',
      pickupTime: '07:30 AM',
      tripType: 'Round Trip',
      vehicle: vehicles[0], // Dzire
      passengerName: 'Pooja Verma',
      passengerPhone: '+91 98111 22334',
      status: BookingStatus.tripCompleted,
      driver: secondDriver,
      vendor: defaultVendor,
      otp: '1904',
      customerPrice: 3800,
      vendorBasePrice: 2800,
      vendorTotal: 2800,
      tax: 200,
      platformMargin: 800,
      vendorPayout: 2800,
    ),
    BookingModel(
      id: 'TX-20260920-000076',
      pickupLocation: 'Lucknow Airport (LKO)',
      dropLocation: 'Gomti Nagar, Lucknow',
      pickupDate: '20 Sep 2026',
      pickupTime: '03:15 PM',
      tripType: 'Airport Transfer',
      vehicle: vehicles[0],
      passengerName: 'Amit Saxena',
      passengerPhone: '+91 97654 32100',
      status: BookingStatus.cancelled,
      customerPrice: 1200,
      vendorBasePrice: 900,
      vendorTotal: 900,
      tax: 60,
      platformMargin: 240,
      vendorPayout: 0,
      paymentStatus: 'Refunded',
    ),
  ];
}

