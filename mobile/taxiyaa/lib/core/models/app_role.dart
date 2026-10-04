enum AppRole {
  customer('Customer', 'Book rides, track, manage trips'),
  driver('Driver', 'View trips, navigation, OTP, earnings'),
  vendor('Vendor', 'Manage fleet, drivers, booking payouts'),
  admin('Admin', 'Operations control, revenue, settlements');

  final String title;
  final String description;

  const AppRole(this.title, this.description);
}

