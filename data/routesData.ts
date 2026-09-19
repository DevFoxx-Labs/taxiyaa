export interface RouteItem {
  id: string;
  slug: string;
  title: string;
  from: string;
  to: string;
  distance: string;
  duration: string;
  startingFare: string;
  category: "expressway" | "pilgrimage" | "hill-station" | "coastal";
  heroImage: string;
  description: string;
  highlights: string[];
  keyAttractions: string[];
  recommendedFleet: {
    vehicle: string;
    type: string;
    fare: string;
  }[];
  faqs: {
    question: string;
    answer: string;
  }[];
}

export const routesData: RouteItem[] = [
  {
    id: "route1",
    slug: "mumbai-to-pune-cab",
    title: "Mumbai to Pune Cab Service",
    from: "Mumbai",
    to: "Pune",
    distance: "150 km",
    duration: "3.0 Hours",
    startingFare: "₹2,499",
    category: "expressway",
    heroImage: "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?auto=format&fit=crop&w=1920&q=80",
    description: "Book fast, comfortable Mumbai to Pune one-way and roundtrip cabs via the Yashwantrao Chavan Mumbai-Pune Expressway. Doorstep pickups across Mumbai suburbs and drop-offs anywhere in Pune, Baner, Hinjewadi IT Park, Wakad, or Vimannagar.",
    highlights: [
      "Fixed transparent pricing via Mumbai-Pune Expressway",
      "One-way drop & roundtrip daily cab options",
      "Pickups from Mumbai CSMIA Airport, Goregaon, BKC, Thane & Navi Mumbai",
      "Sanitized Sedans, Ertigas, Innova Crystas & Tempo Travellers",
    ],
    keyAttractions: ["Lonavala Food Stops", "Khandala Ghat Views", "Somatane Toll Plaza", "Hinjewadi Tech Hub"],
    recommendedFleet: [
      { vehicle: "Swift Dzire / Etios", type: "Executive Sedan (4 Seats)", fare: "₹2,499 Flat / ₹12 per km" },
      { vehicle: "Maruti Ertiga AC", type: "Family SUV (6 Seats)", fare: "₹3,299 Flat / ₹15 per km" },
      { vehicle: "Toyota Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹4,499 Flat / ₹18 per km" },
      { vehicle: "Tempo Traveller", type: "Group Minibus (17 Seats)", fare: "₹6,999 Flat / ₹24 per km" },
    ],
    faqs: [
      { question: "Are toll fees included in the Mumbai to Pune cab fare?", answer: "Toll charges for the Mumbai-Pune Expressway can be bundled into a transparent fixed fare quote or paid directly as per actuals." },
      { question: "Can I book a cab directly from CSMIA Mumbai Airport to Hinjewadi Pune?", answer: "Yes! Your driver meets you at CSMIA Terminal 1 or 2 and drives directly to Hinjewadi, Wakad, or Baner without any delay." },
    ]
  },
  {
    id: "route2",
    slug: "mumbai-to-lonavala-cab",
    title: "Mumbai to Lonavala & Khandala Cab",
    from: "Mumbai",
    to: "Lonavala",
    distance: "85 km",
    duration: "2.0 Hours",
    startingFare: "₹1,899",
    category: "hill-station",
    heroImage: "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=1920&q=80",
    description: "Enjoy a scenic weekend roadtrip from Mumbai to Lonavala and Khandala. Perfect for monsoon getaways, resort stays, and family sightseeing tours.",
    highlights: [
      "Quick 2-hour highway drive from Mumbai suburbs",
      "Doorstep pick-up & custom sightseeing packages",
      "Scenic monsoon waterfall & chikki market stopovers",
    ],
    keyAttractions: ["Tiger Point", "Bhushi Dam", "Rajmachi Fort View", "Wax Museum", "Lonavala Chikki Market"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹1,899" },
      { vehicle: "Maruti Ertiga", type: "SUV (6 Seats)", fare: "₹2,499" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹3,499" },
    ],
    faqs: [
      { question: "Can we include local Lonavala sightseeing in the cab rental?", answer: "Yes! Taxiyaa provides full-day sightseeing packages covering Tiger Point, Bhushi Dam, and Karla Caves." },
    ]
  },
  {
    id: "route3",
    slug: "mumbai-to-nashik-taxi",
    title: "Mumbai to Nashik & Trimbakeshwar Taxi",
    from: "Mumbai",
    to: "Nashik",
    distance: "165 km",
    duration: "3.5 Hours",
    startingFare: "₹2,799",
    category: "pilgrimage",
    heroImage: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=1920&q=80",
    description: "Travel smoothly from Mumbai to Nashik and Trimbakeshwar Jyotirlinga. Ideal for wine vineyard tours at Sula, religious temple visits, and business travel.",
    highlights: [
      "Comfortable drive via Samruddhi Mahamarg / NH 160",
      "Trimbakeshwar Jyotirlinga Temple Darshan packages",
      "Sula Vineyards & Someshwar Waterfall sightseeing stops",
    ],
    keyAttractions: ["Trimbakeshwar Temple", "Sula Vineyards", "Panchavati", "Kalaram Temple", "Muktidham"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹2,799" },
      { vehicle: "Maruti Ertiga", type: "SUV (6 Seats)", fare: "₹3,599" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹4,999" },
    ],
    faqs: [
      { question: "Can we combine Trimbakeshwar temple visit with Nashik city drop?", answer: "Yes, our driver will take you directly to Trimbakeshwar Jyotirlinga first and then drop you at your Nashik hotel." },
    ]
  },
  {
    id: "route4",
    slug: "mumbai-to-shirdi-taxi",
    title: "Mumbai to Shirdi Sai Baba Taxi",
    from: "Mumbai",
    to: "Shirdi",
    distance: "240 km",
    duration: "4.5 Hours",
    startingFare: "₹3,999",
    category: "pilgrimage",
    heroImage: "https://images.unsplash.com/photo-1540339832862-47459980783b?auto=format&fit=crop&w=1920&q=80",
    description: "Dedicated spiritual roadtrip from Mumbai to Shirdi Sai Baba Temple via the modern Hindu Hrudaysamrat Balasaheb Thackeray Samruddhi Mahamarg. Includes optional Shanisingnapur stopover.",
    highlights: [
      "Ultra-fast smooth ride via Samruddhi Mahamarg Expressway",
      "Doorstep morning pickup & evening return packages",
      "Optional Shanisingnapur temple detour inclusion",
    ],
    keyAttractions: ["Shirdi Sai Baba Samadhi Mandir", "Dwarkamai", "Chavadi", "Shanisingnapur Temple"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹3,999" },
      { vehicle: "Maruti Ertiga", type: "SUV (6 Seats)", fare: "₹4,999" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹6,499" },
      { vehicle: "Tempo Traveller", type: "Group Minibus (17 Seats)", fare: "₹8,999" },
    ],
    faqs: [
      { question: "How long does it take from Mumbai to Shirdi via Samruddhi Mahamarg?", answer: "Travel time has been reduced to approx 4.5 hours via the Samruddhi Mahamarg expressway." },
    ]
  },
  {
    id: "route5",
    slug: "mumbai-to-goa-outstation",
    title: "Mumbai to Goa Outstation Cab & Bus",
    from: "Mumbai",
    to: "Goa",
    distance: "580 km",
    duration: "10.0 Hours",
    startingFare: "₹8,999",
    category: "coastal",
    heroImage: "https://images.unsplash.com/photo-1511795409834-ef04bbd61622?auto=format&fit=crop&w=1920&q=80",
    description: "Travel from Mumbai to North or South Goa in pure luxury. Choose between comfortable Innova Crysta SUVs, Force Urbania luxury vans, or Sleeper Coaches.",
    highlights: [
      "Highway roadtrip via Mumbai-Goa Highway (NH 66)",
      "North & South Goa resort drops (Calangute, Baga, Candolim, Panjim)",
      "Reclining seat fleet with dual AC & experienced highway drivers",
    ],
    keyAttractions: ["Panjim Casino Hub", "Baga & Calangute Beaches", "Dudsagar Waterfalls", "Old Goa Churches"],
    recommendedFleet: [
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹11,999" },
      { vehicle: "Force Urbania / Maharaja TT", type: "VIP Luxury Van (13 Seats)", fare: "₹16,999" },
      { vehicle: "Luxury Volvo / Sleeper Bus", type: "Coach (32 Berths)", fare: "Custom Package" },
    ],
    faqs: [
      { question: "Are state entry permit taxes included for Goa?", answer: "Yes, Taxiyaa assists with commercial vehicle state permits so your trip is completely hassle-free." },
    ]
  },
  {
    id: "route6",
    slug: "mumbai-to-mahabaleshwar-cab",
    title: "Mumbai to Mahabaleshwar & Panchgani Cab",
    from: "Mumbai",
    to: "Mahabaleshwar",
    distance: "230 km",
    duration: "5.0 Hours",
    startingFare: "₹3,899",
    category: "hill-station",
    heroImage: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1920&q=80",
    description: "Escape to the cool strawberry hills of Mahabaleshwar and Panchgani. Enjoy mountain ghat roadtrips with experienced hill station drivers.",
    highlights: [
      "Scenic mountain drive through Pasarni Ghat",
      "Panchgani & Mahabaleshwar resort drop-offs",
      "Strawberry farm & point-to-point sightseeing packages",
    ],
    keyAttractions: ["Arthur's Seat", "Venna Lake", "Mapro Garden", "Table Land Panchgani", "Elphinstone Point"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹3,899" },
      { vehicle: "Maruti Ertiga", type: "SUV (6 Seats)", fare: "₹4,799" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹6,299" },
    ],
    faqs: [
      { question: "Are your drivers experienced in driving on Mahabaleshwar mountain ghats?", answer: "Yes! All Taxiyaa chauffeurs assigned for hill station routes are expert drivers trained for mountain terrain." },
    ]
  },
  {
    id: "route7",
    slug: "mumbai-to-alibaug-cab",
    title: "Mumbai to Alibaug & Nagaon Beach Cab",
    from: "Mumbai",
    to: "Alibaug",
    distance: "95 km",
    duration: "2.5 Hours",
    startingFare: "₹2,199",
    category: "coastal",
    heroImage: "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=1920&q=80",
    description: "Hassle-free road trip from Mumbai to Alibaug, Varsoli, Nagaon, and Kashid beaches. Ideal for beach resort weekend getaways.",
    highlights: [
      "Direct road commute via Atal Setu (MTHL) / Pen Highway",
      "Doorstep pickup from Mumbai & drop to Alibaug beach resorts",
      "Kashid & Murud Janjira fort excursion options",
    ],
    keyAttractions: ["Alibaug Beach", "Nagaon Water Sports", "Kashid Beach", "Murud Janjira Sea Fort"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹2,199" },
      { vehicle: "Maruti Ertiga", type: "SUV (6 Seats)", fare: "₹2,899" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹3,899" },
    ],
    faqs: [
      { question: "Can we travel to Alibaug via the new Atal Setu (MTHL) bridge?", answer: "Yes! Our cabs can take the Atal Setu route for a faster and smoother drive from South & Central Mumbai." },
    ]
  },
  {
    id: "route8",
    slug: "mumbai-to-surat-taxi",
    title: "Mumbai to Surat & Gujarat Intercity Taxi",
    from: "Mumbai",
    to: "Surat",
    distance: "280 km",
    duration: "5.0 Hours",
    startingFare: "₹4,499",
    category: "expressway",
    heroImage: "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?auto=format&fit=crop&w=1920&q=80",
    description: "Punctual intercity cab service from Mumbai to Surat, Vapi, Valsad, and Vadodara via National Highway 48 for business travelers & textile traders.",
    highlights: [
      "Smooth NH 48 highway drive with experienced drivers",
      "Surat Diamond Bourse & Textile Market business drops",
      "Clean AC Sedans, Innova Crystas & Luxury Coaches",
    ],
    keyAttractions: ["Surat Diamond Bourse", "Textile Market", "Dumas Beach", "Science Centre"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹4,499" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹6,999" },
      { vehicle: "Tempo Traveller", type: "Group Minibus (17 Seats)", fare: "₹9,999" },
    ],
    faqs: [
      { question: "Do you offer corporate billing for Mumbai to Surat business travel?", answer: "Yes, Taxiyaa provides GST compliant invoicing and corporate booking options." },
    ]
  },
  {
    id: "route9",
    slug: "mumbai-to-ashtavinayak-tour",
    title: "Mumbai to Ashtavinayak 8-Temple Pilgrimage",
    from: "Mumbai",
    to: "Ashtavinayak Circuit",
    distance: "650 km Circuit",
    duration: "2-3 Days",
    startingFare: "Custom Quote",
    category: "pilgrimage",
    heroImage: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=1920&q=80",
    description: "Complete 8-Ganesh Temple pilgrimage tour starting from Mumbai. Visit Mayureshwar, Siddhivinayak, Ballaleshwar, Varadhavinayak, Chintamani, Girijatmaj, Vighnahar & Mahaganapati.",
    highlights: [
      "Custom 2-Day or 3-Day sacred Ashtavinayak circuit itinerary",
      "Clean sanitized family vehicles & Tempo Travellers",
      "Experienced drivers well-versed in temple timings & rituals",
    ],
    keyAttractions: [
      "Mayureshwar (Morgaon)",
      "Siddhivinayak (Siddhatek)",
      "Ballaleshwar (Pali)",
      "Varadhavinayak (Mahad)",
      "Chintamani (Theur)",
      "Girijatmaj (Lenyadri)",
      "Vighnahar (Ozar)",
      "Mahaganapati (Ranjangaon)",
    ],
    recommendedFleet: [
      { vehicle: "Maruti Ertiga AC", type: "Family SUV (6 Seats)", fare: "₹15/km Custom Package" },
      { vehicle: "Toyota Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹18/km Custom Package" },
      { vehicle: "Tempo Traveller", type: "Group Minibus (17 Seats)", fare: "₹24/km Custom Package" },
    ],
    faqs: [
      { question: "What is the recommended sequence for Ashtavinayak Yatra?", answer: "The traditional sequence starts at Morgaon and concludes back at Morgaon, covering all 8 holy shrines across Maharashtra." },
    ]
  },
  {
    id: "route10",
    slug: "mumbai-to-jyotirlinga-circuit",
    title: "Trimbakeshwar, Bhimashankar & Grishneshwar Tour",
    from: "Mumbai",
    to: "Jyotirlinga Shrines",
    distance: "750 km Circuit",
    duration: "3-4 Days",
    startingFare: "Custom Quote",
    category: "pilgrimage",
    heroImage: "https://images.unsplash.com/photo-1540339832862-47459980783b?auto=format&fit=crop&w=1920&q=80",
    description: "Spiritual pilgrimage tour covering 3 sacred Lord Shiva Jyotirlingas in Maharashtra: Trimbakeshwar (Nashik), Bhimashankar (Pune), and Grishneshwar (Ellora/Aurangabad).",
    highlights: [
      "Covers 3 major Jyotirlingas in one seamless roadtrip",
      "Ellora Caves & Shirdi add-on options available",
      "Dedicated senior citizen care & courteous driver assistance",
    ],
    keyAttractions: ["Trimbakeshwar Temple", "Bhimashankar Wildlife Sanctuary", "Grishneshwar Temple", "Ellora Caves"],
    recommendedFleet: [
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "Custom Package" },
      { vehicle: "Maharaja Tempo Traveller", type: "1x1 VIP Recliner (12 Seats)", fare: "Custom Package" },
    ],
    faqs: [
      { question: "Can we add Shirdi and Shanisingnapur to the Jyotirlinga tour?", answer: "Yes! We can customize the itinerary to include Shirdi Sai Baba and Shanisingnapur along with the 3 Jyotirlingas." },
    ]
  },
  {
    id: "route11",
    slug: "mumbai-to-kolhapur-mahalaxmi",
    title: "Mumbai to Kolhapur & Mahalaxmi Temple Cab",
    from: "Mumbai",
    to: "Kolhapur",
    distance: "380 km",
    duration: "7.0 Hours",
    startingFare: "₹5,999",
    category: "pilgrimage",
    heroImage: "https://images.unsplash.com/photo-1511795409834-ef04bbd61622?auto=format&fit=crop&w=1920&q=80",
    description: "Travel comfortably from Mumbai to Kolhapur for Shri Ambabai Mahalaxmi Temple darshan and authentic Kolhapuri culinary & shopping exploration.",
    highlights: [
      "Smooth travel via NH 48 (Mumbai-Satara-Kolhapur Highway)",
      "Doorstep hotel drop in Kolhapur & temple visit assistance",
      "Optional Satara & Karad stopovers",
    ],
    keyAttractions: ["Mahalaxmi Temple", "Shalini Palace", "Rankala Lake", "Panhala Fort", "Kolhapuri Chappal Market"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹5,999" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹8,499" },
    ],
    faqs: [
      { question: "How long does the drive take from Mumbai to Kolhapur?", answer: "The highway drive takes approx 7 hours via the Mumbai-Pune Expressway and NH 48." },
    ]
  },
  {
    id: "route12",
    slug: "mumbai-to-igatpuri-matheran",
    title: "Mumbai to Igatpuri & Matheran Hill Resort",
    from: "Mumbai",
    to: "Igatpuri / Matheran",
    distance: "120 km",
    duration: "2.5 Hours",
    startingFare: "₹2,299",
    category: "hill-station",
    heroImage: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1920&q=80",
    description: "Quick weekend roadtrip from Mumbai to Igatpuri VIP villas or Matheran Dasturi Naka. Enjoy serene mountain fog and resort stays.",
    highlights: [
      "Fast drive via Mumbai-Nashik Highway / Kasara Ghat",
      "Vipassana Meditation Centre Igatpuri & Matheran drops",
      "Clean sanitized AC vehicles",
    ],
    keyAttractions: ["Dhammagiri Vipassana Center", "Bhavali Dam Igatpuri", "Matheran Dasturi Naka", "Echo Point"],
    recommendedFleet: [
      { vehicle: "Swift Dzire", type: "Sedan (4 Seats)", fare: "₹2,299" },
      { vehicle: "Maruti Ertiga", type: "SUV (6 Seats)", fare: "₹2,999" },
      { vehicle: "Innova Crysta", type: "Luxury SUV (7 Seats)", fare: "₹3,999" },
    ],
    faqs: [
      { question: "Where does the cab drop us for Matheran?", answer: "Vehicles are allowed up to Dasturi Naka (Matheran entrance point), where our cab drops you conveniently." },
    ]
  }
];

export function getRouteBySlug(slug: string): RouteItem | undefined {
  const normalized = slug.toLowerCase();
  return routesData.find(
    (r) =>
      r.slug.toLowerCase() === normalized ||
      r.id.toLowerCase() === normalized
  );
}
