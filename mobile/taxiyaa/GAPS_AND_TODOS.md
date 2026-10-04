# Implementation Gaps & TODOs — `taxiyaa` Mobile App

This document serves as the single source of truth for tracking implementation status, roadmap milestones, architectural gaps, and TODO items for the **Taxiyaa** Flutter mobile application (`taxiyaa`), companion to the web platform at `E:\ProjectsFromDevFoxxLabs\taxiyaa`.

---

## 📌 Executive Summary & Module Status

| Feature Module | UI Status | State Management | Data & Dispatch Layer | Priority |
| :--- | :--- | :--- | :--- | :--- |
| **Foundation & Brand Theme** | 🔴 Pending Setup | 🔴 Pending | 🔴 Core theme & tokens needed | Critical |
| **Shell & Navigation** | 🔴 Pending Setup | 🔴 Pending | 🔴 BottomNav shell & routing needed | Critical |
| **Home Exploration Screen** | 🔴 Pending Setup | 🔴 Pending | 🔴 Needs Hero, Search, Fleet & Routes | High |
| **Ride Booking Engine / Wizard**| 🔴 Pending Setup | 🔴 Pending | 🔴 Step wizard & WhatsApp dispatch | High |
| **Fleet Catalog & Details** | 🔴 Pending Setup | 🔴 Pending | 🔴 Vehicle specs & fare cards | High |
| **Routes Catalog & Details** | 🔴 Pending Setup | 🔴 Pending | 🔴 Expressway & pilgrimage routes | High |
| **Services Hub & Details** | 🔴 Pending Setup | 🔴 Pending | 🔴 10 transport services & FAQs | Medium |
| **WhatsApp & Hotline Dispatch**| 🔴 Pending Setup | 🔴 Pending | 🔴 `url_launcher` hotline & WhatsApp | High |
| **User Profile & Saved Places** | 🔴 Pending Setup | 🔴 Pending | 🔴 `flutter_secure_storage` profile | Medium |
| **Booking History & Inquiry Log**| 🔴 Pending Setup | 🔴 Pending | 🔴 Local & remote inquiry tracking | Medium |
| **AutoSkeleton & Shimmer** | 🔴 Pending Setup | 🔴 Pending | 🔴 `auto_skeleton` placeholders | High |
| **Unit & Widget Tests** | 🟡 Default test only| 🔴 Pending | 🔴 Needs full test coverage | High |

---

## 🛠️ Detailed Feature Audit & Gap Tracking

### 1. Foundation, Theme & Core Design System (`lib/core/`)
- **Current State**:
  - Flutter default starter counter template in `lib/main.dart`.
- **Gaps & TODOs**:
  - [ ] **Brand Theme (`lib/core/theme/app_theme.dart`)**:
    - Implement Taxiyaa Luxury Dark palette:
      - Scaffold Background: `#0B0C10`
      - Surface Cards: `#13151B`
      - Border / Dividers: `#1E222D`
      - Primary Neon Yellow Accent: `#FAB304`
      - High-contrast Text: `#FFFFFF`
      - Secondary / Muted Text: `#94A3B8`
    - Material 3 `ColorScheme.fromSeed` with full dark and light mode support.
  - [ ] **Core Widgets (`lib/core/widgets/`)**:
    - `TaxiyaaButton`: Primary neon button, secondary outlined, and icon action buttons.
    - `TaxiyaaCard`: Rounded container with border `#1E222D` and subtle elevation.
    - `AppNetworkImage`: `cached_network_image` wrapper with placeholder skeletons and fallback icons.
    - `AutoSkeletonWrapper`: Shimmer container for lists and cards using `package:auto_skeleton`.
    - `AppStepWizard`: Multi-step wizard header, back-navigation guard, and next/submit actions.
  - [ ] **Brand Constants (`lib/core/constants/app_constants.dart`)**:
    - WhatsApp Hotline: `+91 6392767985`
    - Support Phone: `+91 6392767985`
    - Support Email: `support@taxiyaa.com`
    - Operating Hubs: Mumbai, Pune, Lonavala, Nashik, Shirdi, Surat, Goa.

---

### 2. Navigation Shell (`lib/features/shell/`)
- **Current State**:
  - None.
- **Gaps & TODOs**:
  - [ ] Implement `MainShell`:
    - Bottom navigation bar with 5 primary destinations:
      1. **Home** (Hero, quick ride booking shortcut, top routes, fleet preview)
      2. **Fleet** (All vehicle categories: Sedan, Ertiga, Crysta, Urbania, Maharaja TT, Bus)
      3. **Routes** (Popular highway & pilgrimage tour routes with starting fares)
      4. **Services** (Car rental, airport transfer, corporate, wedding, bus booking)
      5. **Support / Profile** (Call hotline, WhatsApp chat, saved details, policies)
    - `SafeArea` wrapped with custom icons from `hugeicons`.

---

### 3. Home Exploration Screen (`lib/features/home/`)
- **Current State**:
  - None.
- **Gaps & TODOs**:
  - [ ] **Hero Carousel**: Auto-sliding banners featuring Luxury Fleet, Force Urbania, Fortuner 4x4, Maharaja TT, and Scania Luxury Coaches with direct "Book Now" CTAs.
  - [ ] **Quick Ride Search Card**:
    - Segmented tabs: `Outstation` (One-way / Roundtrip), `Local Hourly`, and `Airport Transfer`.
    - Pickup location input, Drop/Destination input.
    - Date and time pickers.
    - Vehicle type quick selector.
    - "Check Fares & Book" button directing to booking wizard.
  - [ ] **Fleet Preview Section**: Horizontal card carousel showcasing top vehicles with seating capacity, luggage space, and starting rate badges.
  - [ ] **Popular Routes Section**: Card grid for top routes (Mumbai to Pune, Lonavala, Shirdi, Nashik) with distance, duration, and starting price badges.
  - [ ] **Why Choose Us Highlights**: Transparent Fares, 24/7 Verified Chauffeurs, Sanitized AC Fleet, GPS-tracked vehicles.

---

### 4. Fleet Module (`lib/features/fleet/`)
- **Current State**:
  - None (data defined in web project `E:\ProjectsFromDevFoxxLabs\taxiyaa/components/Fleet.tsx`).
- **Gaps & TODOs**:
  - [ ] **Fleet Models & Repository (`lib/features/fleet/models/`, `lib/features/fleet/data/`)**:
    - Strongly-typed `FleetVehicle` model: `id`, `name`, `category`, `capacity`, `luggage`, `pricingRate`, `imageUrl`, `idealFor`, `amenities`.
    - Canonical vehicles to support:
      1. Swift Dzire / Toyota Etios (Executive Sedan, 4 seats, ₹12/km)
      2. Maruti Ertiga AC (Family SUV, 6 seats, ₹15/km)
      3. Toyota Innova Crysta (Luxury SUV, 7 seats, ₹18/km)
      4. Maharaja Tempo Traveller (1x1 VIP Recliner Van, 9-12 seats, ₹26/km)
      5. Force Urbania Executive (Monocoque Van, 10-17 seats, ₹28/km)
      6. Mercedes-Benz / BMW / Fortuner (Ultra Luxury Cars & SUVs)
      7. Mini Bus (20-35 Seater) & Luxury Volvo Coach
  - [ ] **Fleet List Screen (`lib/features/fleet/screens/fleet_list_screen.dart`)**:
    - Category filter chips: `All`, `Sedans`, `SUVs`, `Tempo Travellers`, `Luxury`, `Buses`.
    - Vehicle cards with photo, capacity icons, pricing tags, and "Book This Vehicle" action.
  - [ ] **Vehicle Detail Screen (`lib/features/fleet/screens/vehicle_detail_screen.dart`)**:
    - High-resolution hero image, interior features, luggage specs, pricing breakdowns, and direct booking trigger.

---

### 5. Routes Module (`lib/features/routes/`)
- **Current State**:
  - None (data defined in web project `E:\ProjectsFromDevFoxxLabs\taxiyaa/data/routesData.ts`).
- **Gaps & TODOs**:
  - [ ] **Route Model & Repository (`lib/features/routes/models/`, `lib/features/routes/data/`)**:
    - Strongly-typed `RouteItem` model: `id`, `slug`, `title`, `from`, `to`, `distance`, `duration`, `startingFare`, `category` (`expressway`, `pilgrimage`, `hill-station`, `coastal`), `heroImage`, `description`, `highlights`, `keyAttractions`, `recommendedFleet`, `faqs`.
    - 12 canonical routes ported from web:
      - Mumbai to Pune Cab (150 km, 3.0 hrs, ₹2,499)
      - Mumbai to Lonavala & Khandala (85 km, 2.0 hrs, ₹2,199)
      - Mumbai to Nashik Taxi (165 km, 3.5 hrs, ₹2,799)
      - Mumbai to Shirdi Sai Baba Taxi (240 km, 4.5 hrs, ₹3,999)
      - Mumbai to Goa Outstation (590 km, 10.5 hrs, ₹9,999)
      - Mumbai to Mahabaleshwar & Panchgani (260 km, 5.5 hrs, ₹4,499)
      - Mumbai to Alibaug & Murud Beach (95 km, 2.5 hrs, ₹2,299)
      - Mumbai to Matheran Taxi (85 km, 2.0 hrs, ₹2,199)
      - Mumbai to Surat & Vapi Cab (285 km, 5.0 hrs, ₹4,499)
      - Mumbai to Trimbakeshwar Jyotirlinga (175 km, 4.0 hrs, ₹2,999)
      - Ashtavinayak 8-Ganesh Tour (750 km, 2 Days, ₹11,999)
      - 3-Jyotirlinga Maharashtra Circuit (850 km, 3 Days, ₹14,499)
  - [ ] **Routes Explorer Screen**: Search bar, category filter tabs (`Expressway`, `Pilgrimage`, `Hill Station`, `Coastal`), route cards with distance/duration pill tags.
  - [ ] **Route Detail Screen**: Route overview, highway highlights, toll policies, recommended vehicle price comparison table, FAQs accordion, and "Book This Route" button.

---

### 6. Services Module (`lib/features/services/`)
- **Current State**:
  - None (data defined in web project `E:\ProjectsFromDevFoxxLabs\taxiyaa/data/servicesData.ts`).
- **Gaps & TODOs**:
  - [ ] **Service Models & Repository (`lib/features/services/models/`, `lib/features/services/data/`)**:
    - Strongly-typed `ServiceItem` model: `id`, `slug`, `title`, `subtitle`, `badge`, `description`, `longDescription`, `heroImage`, `keyFeatures`, `benefits`, `recommendedVehicles`, `faqs`.
    - 10 canonical services:
      1. Car Rental / Local & Outstation
      2. Airport Rental Car Transfer (CSMIA Mumbai T1/T2)
      3. Bus / Tempo Traveller Booking
      4. Maharaja TT & Force Urbania Monocoque Van
      5. Luxury Car & SUV Hire (Mercedes/BMW/Fortuner)
      6. Mini Bus & Luxury Bus Hire (20 to 55 seaters)
      7. Pilgrimage & Temple Tour Packages
      8. Corporate Travel Solutions
      9. Employee Transportation Services
      10. Wedding & Event Transportation Logistics
  - [ ] **Services Hub Screen**: Grid of service cards with category icons and short descriptions.
  - [ ] **Service Detail Screen**: Rich service breakdown, key features checklist, vehicle recommendations, and FAQ accordion.

---

### 7. Booking Engine & WhatsApp Dispatch (`lib/features/booking/`)
- **Current State**:
  - None.
- **Gaps & TODOs**:
  - [ ] **Booking Wizard (`lib/features/booking/screens/booking_wizard_screen.dart`)**:
    - **Step 1: Ride Details**:
      - Trip category: Outstation (One-way/Roundtrip), Local Hourly (4hr/40km, 8hr/80km), Airport Transfer (Pickup/Drop).
      - Pickup address / Landmark.
      - Drop location.
      - Date and time picker.
    - **Step 2: Vehicle Selection**:
      - Visual card picker (Sedan, Ertiga SUV, Innova Crysta, Urbania, Maharaja TT, Bus).
      - Estimated fare display with breakdown.
    - **Step 3: Passenger & Contact Info**:
      - Passenger Name, Phone Number, Email, Special Requests (e.g. child seat, roof carrier, extra luggage).
    - **Step 4: Confirmation & Instant Dispatch**:
      - Formatted inquiry summary.
      - Primary Action: **"Book via WhatsApp Dispatch"** (auto-constructs encoded WhatsApp URL to `+91 6392767985` with full ride specifications).
      - Secondary Action: **"Call Dispatch Hotline"** (direct phone call).
  - [ ] **Quick Booking Modal Bottom Sheet (`lib/features/booking/widgets/quick_booking_sheet.dart`)**:
    - Lightweight quick inquiry sheet accessible from any route or vehicle card.

---

### 8. Support & User Profile (`lib/features/profile/`)
- **Current State**:
  - None.
- **Gaps & TODOs**:
  - [ ] Profile screen with saved user name, phone, and default pickup city.
  - [ ] Saved Addresses: Quick shortcuts for Home, Office, and Mumbai Airport.
  - [ ] 24/7 Support Hotline cards: Direct tap-to-call buttons for dispatch operations.
  - [ ] Terms of Service & Privacy Policy document viewers.
  - [ ] App theme toggle (Dark / Light).

---

### 9. Skeleton Loading, Caching & Performance (`lib/core/`)
- **Gaps & TODOs**:
  - [ ] AutoSkeleton loading placeholders for Home, Fleet, Routes, and Services screens.
  - [ ] Cached repository providers with Riverpod autoDispose and keepAlive policies.
  - [ ] Sized memory caching for all network images to ensure smooth 60fps scrolling on lower-end Android devices.

---

### 10. Verification & Quality Standards
- **Gaps & TODOs**:
  - [ ] Run `flutter analyze` — ensure **0 errors, 0 warnings**.
  - [ ] Run `flutter test` — ensure 100% test pass rate.
  - [ ] Verify 0 horizontal overflow errors on 320px screen width.
