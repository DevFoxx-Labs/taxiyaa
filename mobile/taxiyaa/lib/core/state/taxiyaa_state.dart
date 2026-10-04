import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_seed_data.dart';
import '../models/app_role.dart';
import '../models/booking_model.dart';
import '../models/driver_model.dart';
import '../models/vehicle_model.dart';
import '../models/vendor_model.dart';

/// Active App Role Notifier (Customer, Driver, Vendor, Admin)
class ActiveRoleNotifier extends Notifier<AppRole> {
  @override
  AppRole build() => AppRole.customer;

  void setRole(AppRole role) => state = role;
}

final activeRoleProvider =
    NotifierProvider<ActiveRoleNotifier, AppRole>(ActiveRoleNotifier.new);

/// Available Vehicles Provider
final vehiclesProvider = Provider<List<VehicleModel>>((ref) {
  return MockSeedData.vehicles;
});

/// Registered Drivers Notifier & Provider
class DriversNotifier extends Notifier<List<DriverModel>> {
  @override
  List<DriverModel> build() => List.of(MockSeedData.drivers);

  void toggleOnline(String driverId) {
    state = state.map((d) {
      if (d.id == driverId) {
        return d.copyWith(isOnline: !d.isOnline);
      }
      return d;
    }).toList();
  }
}

final driversProvider =
    NotifierProvider<DriversNotifier, List<DriverModel>>(DriversNotifier.new);

/// Registered Vendors Notifier & Provider
class VendorsNotifier extends Notifier<List<VendorModel>> {
  @override
  List<VendorModel> build() => List.of(MockSeedData.vendors);

  void verifyVendor(String vendorId) {
    state = state.map((v) {
      if (v.id == vendorId) {
        return v.copyWith(isKycVerified: true, status: 'Active');
      }
      return v;
    }).toList();
  }
}

final vendorsProvider =
    NotifierProvider<VendorsNotifier, List<VendorModel>>(VendorsNotifier.new);

/// Bookings Notifier with central state machine transitions (Section 54)
class BookingsNotifier extends Notifier<List<BookingModel>> {
  @override
  List<BookingModel> build() => List.of(MockSeedData.bookings);

  void addBooking(BookingModel booking) {
    state = [booking, ...state];
  }

  void updateBookingStatus(String bookingId, BookingStatus newStatus) {
    state = state.map((b) {
      if (b.id == bookingId) {
        return b.copyWith(status: newStatus);
      }
      return b;
    }).toList();
  }

  void acceptBooking(String bookingId, VendorModel vendor) {
    state = state.map((b) {
      if (b.id == bookingId) {
        return b.copyWith(
          vendor: vendor,
          status: BookingStatus.vendorAssigned,
        );
      }
      return b;
    }).toList();
  }

  void rejectBooking(String bookingId) {
    state = state.map((b) {
      if (b.id == bookingId) {
        return b.copyWith(status: BookingStatus.cancelled);
      }
      return b;
    }).toList();
  }

  void settleBooking(String bookingId) {
    state = state.map((b) {
      if (b.id == bookingId) {
        return b.copyWith(
          status: BookingStatus.settled,
          paymentStatus: 'Settled to Bank',
        );
      }
      return b;
    }).toList();
  }

  void assignDriverAndVehicle({
    required String bookingId,
    required DriverModel driver,
    required VehicleModel vehicle,
  }) {
    state = state.map((b) {
      if (b.id == bookingId) {
        return b.copyWith(
          driver: driver,
          vehicle: vehicle,
          status: BookingStatus.driverAssigned,
        );
      }
      return b;
    }).toList();
  }

  void assignVendorAndDriver(
    String bookingId,
    VendorModel vendor,
    DriverModel driver,
  ) {
    state = state.map((b) {
      if (b.id == bookingId) {
        return b.copyWith(
          vendor: vendor,
          driver: driver,
          status: BookingStatus.driverAssigned,
        );
      }
      return b;
    }).toList();
  }
}

final bookingsProvider =
    NotifierProvider<BookingsNotifier, List<BookingModel>>(BookingsNotifier.new);

/// Active Driver Profile Notifier
class ActiveDriverNotifier extends Notifier<DriverModel> {
  @override
  DriverModel build() => MockSeedData.defaultDriver;

  void toggleOnline() {
    state = state.copyWith(isOnline: !state.isOnline);
  }
}

final activeDriverProvider =
    NotifierProvider<ActiveDriverNotifier, DriverModel>(ActiveDriverNotifier.new);

/// Active Vendor Notifier
class ActiveVendorNotifier extends Notifier<VendorModel> {
  @override
  VendorModel build() => MockSeedData.defaultVendor;
}

final activeVendorProvider =
    NotifierProvider<ActiveVendorNotifier, VendorModel>(ActiveVendorNotifier.new);

/// Search State Model
class BookingSearchParams {
  final String pickupLocation;
  final String dropLocation;
  final String pickupDate;
  final String pickupTime;
  final String tripType; // One Way, Round Trip, Local, Airport
  final VehicleModel? selectedVehicle;

  const BookingSearchParams({
    this.pickupLocation = 'Lucknow, Uttar Pradesh',
    this.dropLocation = 'Delhi, India',
    this.pickupDate = 'Thu, 12 Oct 2026',
    this.pickupTime = '10:00 AM',
    this.tripType = 'One Way',
    this.selectedVehicle,
  });

  BookingSearchParams copyWith({
    String? pickupLocation,
    String? dropLocation,
    String? pickupDate,
    String? pickupTime,
    String? tripType,
    VehicleModel? selectedVehicle,
  }) {
    return BookingSearchParams(
      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropLocation: dropLocation ?? this.dropLocation,
      pickupDate: pickupDate ?? this.pickupDate,
      pickupTime: pickupTime ?? this.pickupTime,
      tripType: tripType ?? this.tripType,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
    );
  }
}

class BookingSearchNotifier extends Notifier<BookingSearchParams> {
  @override
  BookingSearchParams build() => const BookingSearchParams();

  void updatePickup(String location) {
    state = state.copyWith(pickupLocation: location);
  }

  void updateDrop(String location) {
    state = state.copyWith(dropLocation: location);
  }

  void updateDateTime(String date, String time) {
    state = state.copyWith(pickupDate: date, pickupTime: time);
  }

  void updateTripType(String type) {
    state = state.copyWith(tripType: type);
  }

  void selectVehicle(VehicleModel vehicle) {
    state = state.copyWith(selectedVehicle: vehicle);
  }

  void swapLocations() {
    state = state.copyWith(
      pickupLocation: state.dropLocation,
      dropLocation: state.pickupLocation,
    );
  }
}

final bookingSearchProvider =
    NotifierProvider<BookingSearchNotifier, BookingSearchParams>(
  BookingSearchNotifier.new,
);

