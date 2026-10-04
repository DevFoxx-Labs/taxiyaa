# Development & Agent Rules — Taxiyaa Flutter App

## 🏗️ Project Architecture & Standards

`taxiyaa` is a production-grade Flutter mobile application for **Taxiyaa** — an executive cab booking, car rental, outstation taxi, airport transfer, VIP tempo traveller, luxury car, and bus rental platform. It works in synergy with the Next.js web platform located at `E:\ProjectsFromDevFoxxLabs\taxiyaa`.

- **State Management**: Flutter Riverpod (`flutter_riverpod`).
- **Network & API**: Clean REST API repository layer with secure token storage (`flutter_secure_storage`).
- **Icons**: `hugeicons` & `cupertino_icons`.
- **Skeleton Loaders**: `auto_skeleton` (`package:auto_skeleton/auto_skeleton.dart`).
- **Image Caching**: `cached_network_image` (`AppNetworkImage` pattern with memory & disk cache).
- **Communication & Dispatch**: `url_launcher` for instant WhatsApp booking dispatch (`+91 6392767985`) and 24/7 hotline calling.
- **Rich Text & Documents**: `flutter_quill`, `markdown_quill`, `flutter_markdown_plus`, and `pdfrx`.
- **Formatting**: `intl` (Indian Rupee `₹` currency, 12-hour/24-hour Indian time and date formats).
- **Layered Structure**:
  - `lib/core/theme/`: Taxiyaa Brand Theme (Executive Dark `#0B0C10`, Card Surface `#13151B`, Border `#1E222D`, Accent Neon Yellow `#FAB304`).
  - `lib/core/network/`: API client, HTTP interceptors, error handling, and response wrappers.
  - `lib/core/widgets/`: Reusable components (`TaxiyaaButton`, `TaxiyaaCard`, `AppNetworkImage`, `AutoSkeletonWrapper`, `AppStepWizard`).
  - `lib/features/<feature>/screens/`: UI Views & Pages.
  - `lib/features/<feature>/widgets/`: Feature-specific UI components.
  - `lib/features/<feature>/providers/`: Riverpod Providers, Notifiers & State.
  - `lib/features/<feature>/data/`: Repositories, catalog sources, and remote/local data sources.
  - `lib/features/<feature>/models/`: Strongly-typed Data Models (`fromJson` / `toJson`).

---

## 🚫 1. Strict No Mock Data & AutoSkeleton UI Rule

- **STRICTLY NO RANDOM MOCK / DUMMY DATA IN PRODUCTION FLOWS**: Do NOT use arbitrary, unstable mock data or fake fallback records for active bookings, user profiles, or fare quotes. Repositories must handle network states cleanly.
- **CANONICAL CATALOG DATA**: Core routes, services, and fleet definitions should mirror the canonical catalog schemas from the Taxiyaa web platform (`data/servicesData.ts`, `data/routesData.ts`), loaded via structured repository providers.
- **NO SILENT ERROR SWALLOWING**: Repositories must NEVER swallow network or API exceptions silently. Propagate errors so screens show friendly error views with retry triggers.
- **MANDATORY AutoSkeleton FOR ALL LOADING STATES**: Whenever loading data from repositories or APIs across any screen or widget view, ALWAYS use `AutoSkeleton` (`package:auto_skeleton/auto_skeleton.dart`) to render theme-aware shimmer skeleton loaders during fetching/loading states (`AsyncValue.when(loading: ...)` or `_isLoading`).

---

## 🔌 2. Backend & Catalog Alignment Rule

Whenever developing or updating any feature in `taxiyaa`:

1. **Catalog Alignment with Web Platform**:
   - Align service types, vehicle categories, route itineraries, and fare structures with `E:\ProjectsFromDevFoxxLabs\taxiyaa/data/servicesData.ts` and `routesData.ts`.
   - Maintain parity in vehicle classes: Executive Sedan (Dzire/Etios), Family SUV (Ertiga), Luxury SUV (Innova Crysta), Maharaja VIP Tempo Traveller, Force Urbania, Luxury Cars (Mercedes/BMW/Fortuner), and Mini/Luxury Buses.
2. **Booking & Dispatch Integration**:
   - Support instant booking inquiry generation formatted directly for WhatsApp dispatch (`https://wa.me/916392767985?text=...`) alongside REST API submission.
   - Include complete trip details in booking payloads: service type, trip type (Outstation, Local Hourly, Airport), pickup location, destination, travel date, pickup time, selected vehicle class, passenger count, customer name, phone, email, and notes.
3. **Structured API Responses**:
   - When communicating with backend endpoints, ensure all responses parse into type-safe models under `lib/features/*/models/` with robust null-safety and default values.

---

## 📱 3. Mobile UI/UX & Responsive Layout Rules

- **Zero Horizontal Overflow**: Mobile screens must be fully responsive with 0 horizontal overflow (`RenderFlex overflowed`) errors down to **320px width**. Use `LayoutBuilder`, `Flexible`, `Expanded`, and scrollable wrappers (`SingleChildScrollView`, `ListView`) appropriately.
- **SafeArea Protection**: All screens, navigation drawers, bottom sheets, app bars, and bottom navigation bars MUST be wrapped with `SafeArea` protection against device cutouts, notches, and home indicator bars.
- **Material 3 & Theme Support**:
  - Primary Dark Theme: Background `#0B0C10`, Card Surface `#13151B`, Borders `#1E222D`, Primary Accent `#FAB304` (Taxi Yellow), High Contrast White text `#FFFFFF`, and muted slate `#94A3B8`.
  - Always use `Theme.of(context)` color scheme properties (`colorScheme.surface`, `colorScheme.onSurface`, `colorScheme.primary`) to maintain cohesive theme support.
- **No Dialogs for Complex Forms — New Screen or Bottom Sheet**: Never use basic `AlertDialog` for multi-field forms.
  - **Large forms** (multi-field bookings, route quotes, corporate inquiries) open as a **new full screen** (`Navigator.push`) or step wizard.
  - **Small entries / Pickers** (vehicle picker, passenger selector, date/time picker, quick inquiry) use a **bottom sheet** with `isScrollControlled: true` and keyboard inset padding (`MediaQuery.of(context).viewInsets`).
  - Dialogs are reserved solely for simple confirmations (cancel booking, logout, clear filters).
- **One Multi-Step Wizard Pattern**: For multi-step flows (ride booking, quotation calculator, corporate onboarding), use a consistent step wizard pattern: AppBar back arrow that steps backwards, segmented progress header with "Step X of N: Label", step body, and full-width primary action button.

---

## ⚡ 4. Riverpod & Async State Rules

- Use `AsyncValue.when(data: ..., loading: ..., error: ...)` for handling asynchronous data states.
- Provider state changes must invalidate relevant list and stats providers (e.g. `ref.invalidate(...)`) so UI updates in real-time.
- Handle exceptions gracefully using user-friendly error views with a "Try Again" action or floating snackbars.

---

## 🚀 5. Mandatory AutoSkeleton + Caching Bundle for API Data

1. **AutoSkeleton loading state** — every `AsyncValue.when(loading: ...)` renders an `AutoSkeleton` placeholder shaped like the real content (never a bare `CircularProgressIndicator` for full content areas). Inside scroll views, use `shrinkWrap` + `NeverScrollableScrollPhysics` skeletons.
2. **Data Caching**:
   - Cache static catalogs (services, fleet, popular routes) in-memory with automatic stale-while-revalidate or refresh invalidation.
   - Separate static catalog caching from dynamic user bookings.
3. **Image Caching**:
   - Every network image must use `cached_network_image` via a reusable widget (`AppNetworkImage`) with `memCacheWidth` / `memCacheHeight` configured to prevent excessive GPU memory usage.
4. **Error & Empty States**:
   - Every list, search view, and booking history tab must include a polished empty state with an actionable button (e.g., "Explore Routes", "Book a Ride").

---

## ✅ 6. Quality & Verification Standards

Before completing any task or declaring a feature finished:

1. **Static Analysis**: Run `flutter analyze` — MUST return **0 errors and 0 warnings**.
2. **Automated Testing**: Run `flutter test` — MUST pass **100% of all unit and widget tests**.
3. **Assets & Icons**: Ensure launcher icons and splash configurations are kept in sync using `flutter_launcher_icons` and `flutter_native_splash`.

---

## 🛠️ Frequently Used Commands

```bash
# Run static analysis
flutter analyze

# Run unit and widget tests
flutter test

# Generate launcher icons
dart run flutter_launcher_icons

# Generate native splash screens
dart run flutter_native_splash:create

# Run app on connected device or emulator
flutter run
```
