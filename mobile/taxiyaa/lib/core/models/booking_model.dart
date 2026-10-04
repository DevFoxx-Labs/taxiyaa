import 'driver_model.dart';
import 'vehicle_model.dart';
import 'vendor_model.dart';

enum BookingStatus {
  draft('Draft'),
  quoteRequested('Quote Requested'),
  quoteReady('Quote Ready'),
  paymentPending('Payment Pending'),
  paid('Paid'),
  assignmentPending('Assignment Pending'),
  vendorAssigned('Vendor Assigned'),
  driverAssigned('Driver Assigned'),
  driverArriving('Driver Arriving'),
  driverArrived('Driver Arrived'),
  tripStarted('Trip in Progress'),
  tripCompleted('Completed'),
  settlementPending('Settlement Pending'),
  settled('Settled'),
  cancelled('Cancelled');

  final String label;
  const BookingStatus(this.label);
}

class BookingModel {
  final String id;
  final String pickupLocation;
  final String dropLocation;
  final String pickupDate;
  final String pickupTime;
  final String tripType; // One Way, Round Trip, Local, Airport
  final VehicleModel vehicle;
  final String passengerName;
  final String passengerPhone;
  final String passengerEmail;
  final String specialInstructions;
  final BookingStatus status;
  final DriverModel? driver;
  final VendorModel? vendor;
  final String otp;

  // Financial Breakdown (Section 51)
  final double customerPrice;
  final double vendorBasePrice;
  final double vendorExtraCharges;
  final double vendorTotal;
  final double tax;
  final double discount;
  final double platformMargin;
  final double vendorPayout;
  final String paymentMethod;
  final String paymentStatus;

  const BookingModel({
    required this.id,
    required this.pickupLocation,
    required this.dropLocation,
    required this.pickupDate,
    required this.pickupTime,
    required this.tripType,
    required this.vehicle,
    required this.passengerName,
    required this.passengerPhone,
    this.passengerEmail = '',
    this.specialInstructions = '',
    required this.status,
    this.driver,
    this.vendor,
    this.otp = '4821',
    required this.customerPrice,
    required this.vendorBasePrice,
    this.vendorExtraCharges = 0,
    required this.vendorTotal,
    this.tax = 500,
    this.discount = 0,
    required this.platformMargin,
    required this.vendorPayout,
    this.paymentMethod = 'UPI (Google Pay)',
    this.paymentStatus = 'Paid',
  });

  BookingModel copyWith({
    BookingStatus? status,
    DriverModel? driver,
    VendorModel? vendor,
    VehicleModel? vehicle,
    String? paymentStatus,
    String? otp,
  }) {
    return BookingModel(
      id: id,
      pickupLocation: pickupLocation,
      dropLocation: dropLocation,
      pickupDate: pickupDate,
      pickupTime: pickupTime,
      tripType: tripType,
      vehicle: vehicle ?? this.vehicle,
      passengerName: passengerName,
      passengerPhone: passengerPhone,
      passengerEmail: passengerEmail,
      specialInstructions: specialInstructions,
      status: status ?? this.status,
      driver: driver ?? this.driver,
      vendor: vendor ?? this.vendor,
      otp: otp ?? this.otp,
      customerPrice: customerPrice,
      vendorBasePrice: vendorBasePrice,
      vendorExtraCharges: vendorExtraCharges,
      vendorTotal: vendorTotal,
      tax: tax,
      discount: discount,
      platformMargin: platformMargin,
      vendorPayout: vendorPayout,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }
}

