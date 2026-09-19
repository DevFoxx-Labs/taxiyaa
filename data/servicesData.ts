export interface ServiceItem {
  id: string;
  slug: string;
  aliases: string[];
  title: string;
  subtitle: string;
  badge: string;
  description: string;
  longDescription: string;
  heroImage: string;
  keyFeatures: string[];
  benefits: string[];
  recommendedVehicles: {
    name: string;
    type: string;
    capacity: string;
    price: string;
  }[];
  faqs: {
    question: string;
    answer: string;
  }[];
}

export const servicesData: ServiceItem[] = [
  {
    id: "service1",
    slug: "car-rental-local-outstation",
    aliases: ["service1", "car-rental", "outstation-cab"],
    title: "Car Rental / Local & Outstation",
    subtitle: "Premium City Rides & Intercity Outstation Cab Travel",
    badge: "Local & Outstation",
    description: "Comfortable, sanitized, and reliable cabs for local hourly rental, outstation getaways, business trips, and one-way drops.",
    longDescription: "Taxiyaa provides top-tier Car Rental and Outstation Cab services across Goregaon West, Andheri, BKC, and all of Mumbai. Whether you need a smooth sedan for local city errands or a spacious SUV for long-distance highway travel to Pune, Lonavala, Nashik, Shirdi, or Goa, our 24/7 verified chauffeurs and sanitized fleet ensure a relaxed, premium travel experience.",
    heroImage: "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "24/7 Doorstep Pickup across Mumbai & Metropolitan Suburbs",
      "Fixed Transparent Fares with Zero Surge Pricing",
      "Sanitized Fleet (Swift Dzire, Ertiga, Innova Crysta)",
      "Polite, Background-Verified & Experienced Chauffeurs",
      "Flexible Hourly Local Packages & Outstation Per-KM Pricing",
    ],
    benefits: [
      "Zero driving stress in heavy urban traffic or highway toll lanes",
      "Punctual pick-ups guaranteed for business meetings and leisure trips",
      "GPS-tracked, climate-controlled vehicles with luggage support",
    ],
    recommendedVehicles: [
      { name: "Swift Dzire / Etios", type: "Executive Sedan", capacity: "4 Seats", price: "₹12/km" },
      { name: "Maruti Ertiga AC", type: "Family SUV", capacity: "6 Seats", price: "₹15/km" },
      { name: "Toyota Innova Crysta", type: "Luxury SUV", capacity: "7 Seats", price: "₹18/km" },
    ],
    faqs: [
      { question: "How are Taxiyaa outstation fares calculated?", answer: "Outstation rates are transparently calculated based on round-trip or one-way distance (per km) plus standard driver allowance and toll charges." },
      { question: "Can I book a cab for a one-way outstation drop?", answer: "Yes! Taxiyaa provides hassle-free one-way outstation taxi drops from Mumbai to Pune, Lonavala, Nashik, Shirdi, and Goa." },
      { question: "Are night charges extra?", answer: "Standard driver night allowance applies for highway journeys operating between 11:00 PM and 6:00 AM." },
    ]
  },
  {
    id: "service2",
    slug: "airport-rental-car-transfer",
    aliases: ["service2", "airport-transfer", "mumbai-airport-taxi"],
    title: "Airport Rental Car Transfer",
    subtitle: "24/7 CSMIA Mumbai Airport Pickups & Drops",
    badge: "Airport Service",
    description: "On-time, stress-free airport transfers at CSMIA Mumbai Terminals T1 & T2 with flight tracking and meet & greet.",
    longDescription: "Skip the long airport queues and unpredictable surge rates at Chhatrapati Shivaji Maharaj International Airport (CSMIA Terminals T1 & T2). Taxiyaa offers dedicated 24/7 airport cab transfers with live flight schedule monitoring, driver meet-and-greet, and clean executive cabs.",
    heroImage: "https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Real-time Flight Tracking for Zero Delay Wait",
      "Dedicated Pickups at Terminal T1 (Domestic) & T2 (International)",
      "Chauffeur Meet & Greet with Luggage Assistance",
      "Fixed Airport Flat Rates with Parking Included Options",
      "Instant WhatsApp Driver Details & Location Tracking",
    ],
    benefits: [
      "Guaranteed punctual arrival for early morning or late night flights",
      "Spacious luggage boot capacity for international travel baggage",
      "Relaxing air-conditioned ride right after long flights",
    ],
    recommendedVehicles: [
      { name: "Swift Dzire / Etios", type: "Executive Sedan", capacity: "4 Seats", price: "Fixed Airport Package" },
      { name: "Toyota Innova Crysta", type: "Luxury SUV", capacity: "7 Seats", price: "Fixed Airport Package" },
    ],
    faqs: [
      { question: "What if my flight gets delayed?", answer: "Our dispatch team monitors your flight in real time and automatically adjusts chauffeur dispatch so your driver is ready when you land." },
      { question: "Where will the Taxiyaa driver meet me at CSMIA?", answer: "Your assigned chauffeur calls you upon landing and meets you directly at the official arrival pickup area at T1 or T2." },
    ]
  },
  {
    id: "service3",
    slug: "bus-tempo-traveller-booking",
    aliases: ["service3", "tempo-traveller", "luxury-bus"],
    title: "Bus / Tempo Traveller Booking",
    subtitle: "Spacious Group Mobility for Events, Pilgrimages & Tours",
    badge: "Group Travel",
    description: "Spacious 12, 17 & 26-seater luxury Tempo Travellers and mini-coaches for family events, corporate trips, and pilgrimage tours.",
    longDescription: "Traveling in a group is seamless with Taxiyaa. We offer modern 12, 17, and 26-seater AC Tempo Travellers and executive buses fitted with push-back reclining seats, high-power air conditioning, entertainment systems, and generous luggage bays.",
    heroImage: "https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "12 / 17 / 26 Seater AC Luxury Tempo Travellers",
      "Ergonomic Push-back Reclining Seats & High Legroom",
      "Ample Overhead Storage & Deep Boot Bays",
      "HD Audio-Visual Entertainment & Mobile Charging Outlets",
      "Specialized Pilgrimage Tour Packages (Ashtavinayak, Shirdi, Trimbakeshwar)",
    ],
    benefits: [
      "Keep your entire family or corporate group together in luxury",
      "Economical per-person travel fare for group journeys",
      "Experienced highway chauffeurs trained in group hospitality",
    ],
    recommendedVehicles: [
      { name: "Tempo Traveller (12 Seater)", type: "Luxury Minibus", capacity: "12 Seats", price: "₹20/km" },
      { name: "Tempo Traveller (17 Seater)", type: "Executive Coach", capacity: "17 Seats", price: "₹24/km" },
      { name: "Luxury Tourist Bus", type: "Full Coach", capacity: "26-45 Seats", price: "₹40/km" },
    ],
    faqs: [
      { question: "Are Taxiyaa Tempo Travellers permitted on state highways?", answer: "Yes, all Taxiyaa minibuses hold all-India commercial tourist permits for smooth interstate and highway travel." },
      { question: "Are driver allowances included in the quote?", answer: "Yes, Taxiyaa provides itemized and transparent quotes including fuel, driver allowance, and toll estimates." },
    ]
  },
  {
    id: "service4",
    slug: "maharaja-tempo-traveller-force-urbania",
    aliases: ["service9", "maharaja-tempo-traveller", "force-urbania"],
    title: "Maharaja Tempo Traveller & Force Urbania",
    subtitle: "VIP 1x1 Plush Recliner Vans & Luxury Executive Vans",
    badge: "VIP Luxury Van",
    description: "Ultra-luxury Force Urbania and 1x1 Maharaja Tempo Travellers featuring individual recliner seats, Smart TV, ambient lighting, and individual AC.",
    longDescription: "Experience first-class road travel with Taxiyaa's Maharaja Tempo Traveller and Force Urbania rental fleet. Designed for VIP corporate delegations, celebrity movement, luxury weddings, and premium family getaways, these vehicles feature 1x1 extra-wide Maharaja recliners with individual armrests, ambient LED mood lighting, Smart LED TVs, onboard Wi-Fi, and individual climate control vents.",
    heroImage: "https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Exclusive 1x1 Maharaja Plush Leather Recliners",
      "Force Urbania Monocoque Vans (10, 13 & 17 Seater)",
      "Smart LED TV, Premium Audio & Individual Charging Ports",
      "Ambient Sky-LED Lighting & Air Suspension Comfort",
      "Air-conditioned Luggage Bay & Onboard Refreshment Space",
    ],
    benefits: [
      "First-class cabin comfort comparable to luxury airline seating",
      "Smooth, vibration-free ride on long expressways and hill stations",
      "Ideal for VIP clients, destination weddings, and corporate leadership trips",
    ],
    recommendedVehicles: [
      { name: "Maharaja Tempo Traveller (9/12 Seater)", type: "1x1 VIP Recliner", capacity: "9-12 Seats", price: "₹25/km" },
      { name: "Force Urbania Executive (10/13 Seater)", type: "Luxury Monocoque Van", capacity: "10-13 Seats", price: "₹28/km" },
      { name: "Force Urbania Grand (17 Seater)", type: "VIP Luxury Coach", capacity: "17 Seats", price: "₹32/km" },
    ],
    faqs: [
      { question: "What is the difference between regular and Maharaja Tempo Travellers?", answer: "Regular Tempo Travellers feature 2x2 seating, whereas Maharaja Tempo Travellers feature 1x1 extra-wide individual plush recliners with legrests, ambient lighting, and superior audio-video systems." },
      { question: "Is Force Urbania available for outstation trips from Mumbai?", answer: "Yes! Force Urbania is available for intercity travel to Pune, Mahabaleshwar, Goa, Gujarat, and pilgrimage circuits." },
    ]
  },
  {
    id: "service5",
    slug: "luxury-car-suv-rental",
    aliases: ["service10", "luxury-car-rental", "mercedes-bmw-fortuner"],
    title: "Luxury Car & Luxury SUV Hire",
    subtitle: "Mercedes-Benz, BMW, Audi, Fortuner & Toyota Vellfire",
    badge: "Ultra Luxury",
    description: "Rent Mercedes C/E/S-Class, BMW 3/5/7 Series, Audi Q7, Toyota Fortuner, and Toyota Vellfire with uniformed VIP chauffeurs.",
    longDescription: "Make a powerful style statement with Taxiyaa Luxury Car & SUV Rentals in Mumbai. Perfect for high-profile corporate delegates, luxury wedding groom cars, red carpet events, and VIP airport pickups. Our fleet includes Mercedes-Benz E-Class & S-Class, BMW 5 & 7 Series, Audi A6/Q7, Toyota Fortuner, and the ultra-exclusive Toyota Vellfire luxury MPV.",
    heroImage: "https://images.unsplash.com/photo-1563720223185-11003d516935?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Mercedes-Benz C/E/S-Class & BMW 3/5/7 Series Fleet",
      "Toyota Fortuner 4x4 & Audi Q5/Q7 Luxury SUVs",
      "Toyota Vellfire & Mercedes V-Class VIP Lounge Vans",
      "Uniformed, English-speaking VIP Trained Chauffeurs",
      "Custom Flower & Ribbon Styling for Wedding Groom Cars",
    ],
    benefits: [
      "Unmatched sophistication for corporate CEOs and VIP dignitaries",
      "Red-carpet presentation with spotless interiors & bottled water",
      "Confidential, smooth, and silent luxury ride",
    ],
    recommendedVehicles: [
      { name: "Mercedes-Benz E-Class / BMW 5 Series", type: "Luxury Sedan", capacity: "4 Seats", price: "₹55/km" },
      { name: "Toyota Fortuner 4x4", type: "Luxury SUV", capacity: "7 Seats", price: "₹35/km" },
      { name: "Toyota Vellfire / Mercedes V-Class", type: "VIP Lounge MPV", capacity: "6 Seats", price: "₹75/km" },
    ],
    faqs: [
      { question: "Can I book a luxury car for wedding groom entry in Mumbai?", answer: "Yes! We specialize in decorated luxury groom cars including Mercedes, BMW, and Audi with on-time venue delivery." },
      { question: "Are driver allowances extra for luxury rentals?", answer: "Detailed transparent quotes including driver allowance, fuel, and state tolls are provided upfront." },
    ]
  },
  {
    id: "service6",
    slug: "mini-bus-luxury-bus-hire",
    aliases: ["service11", "luxury-bus-rental", "bus-with-washroom"],
    title: "Mini Bus & Luxury Tourist Bus Hire",
    subtitle: "20 to 56-Seater AC Buses, Sleeper Coaches & Washroom Buses",
    badge: "Large Bus Fleet",
    description: "20, 25, 35, 45 & 56-seater luxury buses, Volvo coaches, sleeper buses, and buses with washroom facilities for events & tours.",
    longDescription: "Transporting large groups for corporate outings, destination weddings, school trips, or pilgrimage tours is smooth and reliable with Taxiyaa. We operate a massive fleet of 20 to 56-seater AC Mini Buses, Volvo Coaches, Sleeper Buses, and Buses equipped with clean onboard washroom facilities.",
    heroImage: "https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "20, 25 & 35-Seater Executive AC Mini Buses",
      "41, 45, 52 & 56-Seater Volvo Luxury Coaches",
      "Buses with Onboard Clean Washroom / Toilet Facilities",
      "Sleeper Buses (32-42 Berths) for Overnight Interstate Travel",
      "Powerful Air-conditioning, HD Audio-Video & Charging Outlets",
    ],
    benefits: [
      "Cost-effective per-seat travel fare for large groups",
      "Onboard toilet availability eliminates frequent roadside halts",
      "Experienced interstate drivers trained for mountain & expressways",
    ],
    recommendedVehicles: [
      { name: "AC Mini Bus (20/25 Seater)", type: "Executive Bus", capacity: "20-25 Seats", price: "₹30/km" },
      { name: "Luxury Tourist Coach (45/52 Seater)", type: "Volvo Coach", capacity: "45-52 Seats", price: "₹45/km" },
      { name: "Luxury Bus with Washroom", type: "Restroom Coach", capacity: "35-45 Seats", price: "₹50/km" },
    ],
    faqs: [
      { question: "Do you offer buses with attached washroom facilities?", answer: "Yes! We provide 35-45 seater luxury coaches equipped with clean, sanitized onboard restrooms ideal for long-distance family and pilgrimage tours." },
    ]
  },
  {
    id: "service7",
    slug: "pilgrimage-temple-tour-packages",
    aliases: ["service12", "pilgrimage-tours", "ashtavinayak-shirdi-jyotirlinga"],
    title: "Pilgrimage & Temple Tour Packages",
    subtitle: "Ashtavinayak, Shirdi-Trimbakeshwar & Jyotirlinga Roadtrips",
    badge: "Pilgrimage Travel",
    description: "Dedicated spiritual tour cab & bus packages for Ashtavinayak (8 Temples), Shirdi Sai Baba, Trimbakeshwar, Bhimashankar & Kolhapur.",
    longDescription: "Embark on a divine and peaceful spiritual journey with Taxiyaa Pilgrimage Tour Packages. We specialize in custom door-to-door temple circuits from Mumbai, including the Ashtavinayak 8-Ganesh Temple Circuit, Shirdi Sai Baba & Shanisingnapur, Trimbakeshwar & Bhimashankar Jyotirlingas, and Mahalaxmi Kolhapur.",
    heroImage: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Ashtavinayak 8-Temple Circuit (2 to 3 Day Custom Package)",
      "Shirdi Sai Baba + Shanisingnapur + Trimbakeshwar Combo",
      "Bhimashankar & Grishneshwar Jyotirlinga Roadtrip",
      "Kolhapur Mahalaxmi & Pandharpur Vitthal Temple Package",
      "Courteous Drivers Trained in Temple Routes & Senior Citizen Care",
    ],
    benefits: [
      "Peaceful travel with custom darshan stopovers at your pace",
      "Spacious vehicle options for multi-generational family groups",
      "Clean AC vehicles with hassle-free luggage handling",
    ],
    recommendedVehicles: [
      { name: "Maruti Ertiga / Innova Crysta", type: "Family Pilgrimage SUV", capacity: "6-7 Seats", price: "Custom Package" },
      { name: "Tempo Traveller (12/17 Seater)", type: "Group Devotional Coach", capacity: "12-17 Seats", price: "Custom Package" },
    ],
    faqs: [
      { question: "How many days are needed for the complete Ashtavinayak Yatra?", answer: "The Ashtavinayak 8-temple circuit can be completed comfortably in 2 days or 3 days depending on your preferred pace." },
    ]
  },
  {
    id: "service8",
    slug: "flight-air-ticket-booking",
    aliases: ["service4", "flight-booking", "air-tickets"],
    title: "Flight / Air Ticket Booking",
    subtitle: "Domestic & International Air Ticket Reservations",
    badge: "Travel Assistance",
    description: "Instant domestic & international air ticket booking support with discounted corporate fares and airport cab bundles.",
    longDescription: "Simplify your air travel with Taxiyaa's ticketing desk. We assist individual travelers, families, and corporate delegations with booking domestic flights (IndiGo, Air India, Vistara, Akasa) and international routes at competitive prices.",
    heroImage: "/images/flight_booking.jpg",
    keyFeatures: [
      "Domestic & International Flight Reservations",
      "Group Fares & Exclusive Corporate Discounts",
      "Easy Ticket Rescheduling, Modifications & Baggage Add-ons",
      "Integrated Airport Cab + Flight Combo Discounts",
      "24/7 Ticketing Support for Emergency Travel Plans",
    ],
    benefits: [
      "Save time comparing multiple airfare portals manually",
      "Expert guidance on flight timings, layovers, and baggage allowances",
      "Hassle-free bundled airport cab pickup and drop-off",
    ],
    recommendedVehicles: [
      { name: "Airport Cab Combo", type: "Sedan / SUV Drop", capacity: "4-7 Seats", price: "Bundled Discount" },
    ],
    faqs: [
      { question: "Can Taxiyaa assist with emergency same-day flight tickets?", answer: "Yes! Our ticketing desk handles immediate flight bookings with instant e-ticket issuance." },
    ]
  },
  {
    id: "service9",
    slug: "corporate-travel-solutions",
    aliases: ["service5", "corporate-travel", "executive-mobility"],
    title: "Corporate Travel Solutions",
    subtitle: "Executive Fleet & VIP Mobility Management",
    badge: "Business Travel",
    description: "Dependable, premium corporate travel solutions, executive luxury sedans, VIP delegation transport, and monthly invoicing.",
    longDescription: "Taxiyaa is a trusted corporate mobility partner for enterprises, MNCs, and business hubs across Mumbai, BKC, NESCO Goregaon, and Powai. We supply executive sedans, Innova Crystas, and luxury coaches with dedicated account managers and monthly billing options.",
    heroImage: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Executive Luxury Fleet (Innova Crysta, Camry, Premium Sedans)",
      "Uniformed, Well-Groomed & Background-Verified Chauffeurs",
      "Dedicated Corporate Mobility Manager & Priority Dispatch",
      "GST-Compliant Tax Invoicing & Flexible Monthly Credit Cycles",
      "Airport VIP Pickups & Inter-city Business Delegations",
    ],
    benefits: [
      "Enhance corporate brand image when hosting key clients",
      "100% vehicle replacement guarantee for uninterrupted operations",
      "Strict confidentiality, route privacy, and professional etiquette",
    ],
    recommendedVehicles: [
      { name: "Toyota Innova Crysta", type: "Executive SUV", capacity: "7 Seats", price: "Corporate Tariff" },
      { name: "Swift Dzire / Etios", type: "Corporate Sedan", capacity: "4 Seats", price: "Corporate Tariff" },
    ],
    faqs: [
      { question: "Do you provide GST compliant invoices for business bookings?", answer: "Yes, all Taxiyaa corporate bookings come with detailed GST compliant tax invoices for seamless accounting." },
    ]
  },
  {
    id: "service10",
    slug: "employee-transportation",
    aliases: ["service6", "employee-transport", "staff-commute"],
    title: "Employee Transportation",
    subtitle: "Safe, Punctual Daily Office Shift Commute",
    badge: "Daily Commute",
    description: "End-to-end staff commute solutions with GPS tracking, optimized routing, and verified drivers for corporate offices.",
    longDescription: "Ensure your employees travel safely, punctually, and comfortably with Taxiyaa Employee Transportation Services. We manage daily shift commute logistics for IT hubs, BPOs, corporate offices, and industrial centers across Mumbai.",
    heroImage: "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Smart Dynamic Route Optimization & Shift Roster Management",
      "Real-time GPS Tracking & Speed Governor Monitoring",
      "Strict Security & Escort Protocol for Night Shifts",
      "Daily Sanitized Cabs with Background-Checked Chauffeurs",
      "Dedicated On-site Transportation Coordinators",
    ],
    benefits: [
      "Enhance employee satisfaction with safe doorstep pickups",
      "Optimize corporate transportation operational expenses",
      "Zero shift delay guarantee for 24/7 business operations",
    ],
    recommendedVehicles: [
      { name: "Maruti Ertiga / Ciaz", type: "Shift Commute Cab", capacity: "4-6 Seats", price: "Monthly Contract" },
      { name: "Tempo Traveller", type: "Staff Shuttle", capacity: "12-17 Seats", price: "Monthly Contract" },
    ],
    faqs: [
      { question: "How does Taxiyaa ensure safety for female staff on night shifts?", answer: "We follow strict security compliance including active GPS tracking, emergency SOS alerts, verified drivers, and female security escorts when required." },
    ]
  },
  {
    id: "service11",
    slug: "wedding-event-transportation",
    aliases: ["service7", "wedding-transport", "event-fleet"],
    title: "Wedding / Event Transportation",
    subtitle: "Luxury Fleet Logistics for Weddings & Grand Celebrations",
    badge: "Special Events",
    description: "Customized wedding fleets, luxury groom cars, guest shuttles, and event transport management.",
    longDescription: "Make your wedding or event extraordinary with Taxiyaa's specialized event fleet logistics. We manage guest venue shuttles, floral-decorated bridal cars, airport guest transfers, and Barat convoy buses across Mumbai and destination wedding spots.",
    heroImage: "https://images.unsplash.com/photo-1511795409834-ef04bbd61622?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Decorated Luxury Groom & Bridal Cars",
      "Guest Convoy Fleet (Innova Crysta, Ertiga, Premium Sedans)",
      "Large Guest Shuttle Buses & Tempo Travellers for Barat",
      "On-site Transport Coordinator for Venues & Hotels",
      "24/7 Airport & Railway Station Guest Pickup Logistics",
    ],
    benefits: [
      "Relieve wedding hosts from guest transportation logistics",
      "Ensure guests arrive comfortably, on time, and stress-free",
      "Tailor-made multi-day packages for wedding celebrations",
    ],
    recommendedVehicles: [
      { name: "Toyota Innova Crysta", type: "Luxury Guest Convoy", capacity: "7 Seats", price: "Wedding Package" },
      { name: "Tempo Traveller (17 Seater)", type: "Barat & Guest Coach", capacity: "17 Seats", price: "Wedding Package" },
    ],
    faqs: [
      { question: "Can we request floral styling for the groom car?", answer: "Yes, Taxiyaa offers customized flower and ribbon decoration packages for bride and groom luxury vehicles." },
    ]
  },
  {
    id: "service12",
    slug: "other-customized-services",
    aliases: ["service8", "customized-service"],
    title: "Other Customized Services",
    subtitle: "Tailor-made Tours, Station Drops & Custom Travel Plans",
    badge: "Custom Travel",
    description: "Custom holiday roadtrips, pilgrimage tours, railway station drops, and bespoke travel packages.",
    longDescription: "Have a unique itinerary? Taxiyaa offers customized travel solutions, pilgrimage packages (Ashtavinayak, Shirdi, Trimbakeshwar, Mahabaleshwar), railway station transfers (Mumbai CST, Dadar, Bandra Terminus, LTT), and hotel booking assistance.",
    heroImage: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=1920&q=80",
    keyFeatures: [
      "Tailor-made Multi-City Roadtrip Itineraries",
      "Railway Station Pickups & Drops (CST, Dadar, LTT, Bandra)",
      "Pilgrimage Tour Packages (Ashtavinayak, Shirdi, Trimbakeshwar)",
      "Weekend Gateway Trips (Mahabaleshwar, Lonavala, Alibaug, Goa)",
      "Flexible Hourly & Daily Dedicated Rental Plans",
    ],
    benefits: [
      "Fully customized to your family's personal schedule and preferences",
      "Flexible choice of vehicles, stopovers, and sightseeing points",
      "Direct recommendations and support from travel experts",
    ],
    recommendedVehicles: [
      { name: "Innova Crysta / Ertiga", type: "Custom Tour Vehicle", capacity: "6-7 Seats", price: "Custom Quote" },
    ],
    faqs: [
      { question: "How do I request a custom travel package from Taxiyaa?", answer: "Simply call +91 9833867640 or click the WhatsApp Booking button to send your custom itinerary details." },
    ]
  }
];

export function getServiceBySlug(slug: string): ServiceItem | undefined {
  const normalized = slug.toLowerCase();
  return servicesData.find(
    (s) =>
      s.slug.toLowerCase() === normalized ||
      s.id.toLowerCase() === normalized ||
      s.aliases.some((a) => a.toLowerCase() === normalized)
  );
}

