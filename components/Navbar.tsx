"use client";

import { useState } from "react";
import Link from "next/link";
import { Phone, Menu, X, ShieldCheck, ChevronRight, ChevronDown } from "lucide-react";

interface NavbarProps {
  onOpenBookingModal: (service?: string) => void;
}

export default function Navbar({ onOpenBookingModal }: NavbarProps) {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [activeDropdown, setActiveDropdown] = useState<string | null>(null);

  const vehicleLinks = [
    { name: "Sedans (Swift Dzire / Etios)", href: "/#fleet" },
    { name: "Family SUVs (Maruti Ertiga)", href: "/#fleet" },
    { name: "Luxury SUVs (Toyota Innova Crysta)", href: "/#fleet" },
    { name: "Force Urbania Monocoque Van", href: "/services/maharaja-tempo-traveller-force-urbania" },
    { name: "Maharaja 1x1 VIP Recliner TT", href: "/services/maharaja-tempo-traveller-force-urbania" },
    { name: "Luxury Cars (Mercedes/BMW/Fortuner)", href: "/services/luxury-car-suv-rental" },
    { name: "Mini Buses (20-35 Seater)", href: "/services/mini-bus-luxury-bus-hire" },
    { name: "Volvo Coach & Restroom Bus", href: "/services/mini-bus-luxury-bus-hire" },
  ];

  const serviceLinks = [
    { name: "Car Rental / Local & Outstation", href: "/services/car-rental-local-outstation" },
    { name: "Airport Rental Car Transfer", href: "/services/airport-rental-car-transfer" },
    { name: "Bus / Tempo Traveller Booking", href: "/services/bus-tempo-traveller-booking" },
    { name: "Corporate Travel Solutions", href: "/services/corporate-travel-solutions" },
    { name: "Employee Transportation", href: "/services/employee-transportation" },
    { name: "Wedding & Event Fleet Logistics", href: "/services/wedding-event-transportation" },
    { name: "Pilgrimage & Temple Tour Packages", href: "/services/pilgrimage-temple-tour-packages" },
  ];

  const routeLinks = [
    { name: "Mumbai to Pune Cab", href: "/routes/mumbai-to-pune-cab" },
    { name: "Mumbai to Lonavala Cab", href: "/routes/mumbai-to-lonavala-cab" },
    { name: "Mumbai to Nashik Taxi", href: "/routes/mumbai-to-nashik-taxi" },
    { name: "Mumbai to Shirdi Taxi", href: "/routes/mumbai-to-shirdi-taxi" },
    { name: "Mumbai to Goa Outstation", href: "/routes/mumbai-to-goa-outstation" },
    { name: "Ashtavinayak 8-Ganesh Tour", href: "/routes/mumbai-to-ashtavinayak-tour" },
    { name: "3-Jyotirlinga Temple Tour", href: "/routes/mumbai-to-jyotirlinga-circuit" },
  ];

  return (
    <header className="sticky top-0 z-40 w-full bg-[#0b0c10]/90 backdrop-blur-md border-b border-[#1e222d]">
      {/* Top Announcement Bar */}
      <div className="bg-[#13151b] border-b border-[#1e222d] py-1.5 px-4 text-xs font-semibold text-slate-300">
        <div className="max-w-7xl mx-auto flex justify-between items-center">
          <div className="flex items-center gap-2">
            <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full bg-[#b5f63d]/10 text-[#b5f63d] text-[10px] uppercase font-bold border border-[#b5f63d]/20">
              <ShieldCheck className="w-3 h-3" /> Verified 24/7 Cab Service
            </span>
            <span className="hidden sm:inline text-slate-400">CSMIA Airport Drops • Intercity Outstation Cabs • Luxury Force Urbania</span>
          </div>
          <div className="flex items-center gap-4">
            <a
              href="tel:+919833867640"
              className="flex items-center gap-1.5 text-slate-200 hover:text-[#b5f63d] transition-colors"
            >
              <Phone className="w-3.5 h-3.5 text-[#b5f63d]" />
              <span className="font-bold">+91 98338 67640</span>
            </a>
          </div>
        </div>
      </div>

      {/* Main Navbar */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-20">
          {/* Logo Image */}
          <Link href="/" className="flex items-center gap-2 group">
            <img
              src="/taxyiaa-logo-light.webp"
              alt="Taxiyaa Travels Logo"
              className="h-12 w-auto object-contain transition-transform group-hover:scale-105"
            />
          </Link>

          {/* Desktop Navigation Links with Dropdowns */}
          <nav className="hidden md:flex items-center gap-7">
            <Link href="/" className="text-sm font-semibold text-slate-300 hover:text-[#b5f63d] transition-colors">
              Home
            </Link>

            {/* Our Vehicles Dropdown */}
            <div
              className="relative group"
              onMouseEnter={() => setActiveDropdown("vehicles")}
              onMouseLeave={() => setActiveDropdown(null)}
            >
              <button className="text-sm font-semibold text-slate-300 group-hover:text-[#b5f63d] transition-colors flex items-center gap-1 py-2">
                <span>Our Vehicles</span>
                <ChevronDown className="w-3.5 h-3.5 text-[#b5f63d]" />
              </button>
              {activeDropdown === "vehicles" && (
                <div className="absolute top-full left-0 w-64 bg-[#13151b] border border-[#1e222d] rounded-xl shadow-2xl p-2 space-y-1">
                  {vehicleLinks.map((item, idx) => (
                    <Link
                      key={idx}
                      href={item.href}
                      className="block px-3 py-2 rounded-lg text-xs font-bold text-slate-300 hover:bg-[#0b0c10] hover:text-[#b5f63d] transition-colors"
                    >
                      {item.name}
                    </Link>
                  ))}
                </div>
              )}
            </div>

            {/* Services Dropdown */}
            <div
              className="relative group"
              onMouseEnter={() => setActiveDropdown("services")}
              onMouseLeave={() => setActiveDropdown(null)}
            >
              <button className="text-sm font-semibold text-slate-300 group-hover:text-[#b5f63d] transition-colors flex items-center gap-1 py-2">
                <span>Services</span>
                <ChevronDown className="w-3.5 h-3.5 text-[#b5f63d]" />
              </button>
              {activeDropdown === "services" && (
                <div className="absolute top-full left-0 w-64 bg-[#13151b] border border-[#1e222d] rounded-xl shadow-2xl p-2 space-y-1">
                  {serviceLinks.map((item, idx) => (
                    <Link
                      key={idx}
                      href={item.href}
                      className="block px-3 py-2 rounded-lg text-xs font-bold text-slate-300 hover:bg-[#0b0c10] hover:text-[#b5f63d] transition-colors"
                    >
                      {item.name}
                    </Link>
                  ))}
                </div>
              )}
            </div>

            {/* Outstation Routes Dropdown */}
            <div
              className="relative group"
              onMouseEnter={() => setActiveDropdown("routes")}
              onMouseLeave={() => setActiveDropdown(null)}
            >
              <button className="text-sm font-semibold text-slate-300 group-hover:text-[#b5f63d] transition-colors flex items-center gap-1 py-2">
                <span>Outstation Routes</span>
                <ChevronDown className="w-3.5 h-3.5 text-[#b5f63d]" />
              </button>
              {activeDropdown === "routes" && (
                <div className="absolute top-full left-0 w-64 bg-[#13151b] border border-[#1e222d] rounded-xl shadow-2xl p-2 space-y-1">
                  {routeLinks.map((item, idx) => (
                    <Link
                      key={idx}
                      href={item.href}
                      className="block px-3 py-2 rounded-lg text-xs font-bold text-slate-300 hover:bg-[#0b0c10] hover:text-[#b5f63d] transition-colors"
                    >
                      {item.name}
                    </Link>
                  ))}
                </div>
              )}
            </div>

            <a href="#about" className="text-sm font-semibold text-slate-300 hover:text-[#b5f63d] transition-colors">
              About Us
            </a>
            <a href="#faqs" className="text-sm font-semibold text-slate-300 hover:text-[#b5f63d] transition-colors">
              FAQs
            </a>
            <a href="#contact" className="text-sm font-semibold text-slate-300 hover:text-[#b5f63d] transition-colors">
              Contact
            </a>
          </nav>

          {/* CTA Action Buttons */}
          <div className="hidden md:flex items-center gap-4">
            <a
              href="tel:+919833867640"
              className="px-4 py-2.5 rounded-xl border border-[#1e222d] bg-[#13151b] text-slate-200 text-xs font-bold hover:border-[#b5f63d] transition-colors flex items-center gap-2"
            >
              <Phone className="w-3.5 h-3.5 text-[#b5f63d]" />
              <span>Call Now</span>
            </a>
            <button
              onClick={() => onOpenBookingModal()}
              className="btn-nova-neon px-5 py-2.5 text-xs uppercase font-extrabold flex items-center gap-1.5"
            >
              <span>Book Ride</span>
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>

          {/* Mobile Menu Button */}
          <div className="md:hidden flex items-center gap-3">
            <button
              onClick={() => onOpenBookingModal()}
              className="btn-nova-neon px-3.5 py-2 text-xs uppercase font-bold"
            >
              Book
            </button>
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2 rounded-xl bg-[#13151b] border border-[#1e222d] text-slate-300 hover:text-white"
              aria-label="Toggle Navigation Menu"
            >
              {mobileMenuOpen ? <X className="w-6 h-6 text-[#b5f63d]" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Drawer Navigation */}
      {mobileMenuOpen && (
        <div className="md:hidden bg-[#13151b] border-b border-[#1e222d] px-4 pt-3 pb-6 space-y-3 max-h-[80vh] overflow-y-auto">
          <Link href="/" onClick={() => setMobileMenuOpen(false)} className="block px-3 py-2 rounded-lg text-base font-semibold text-slate-200 hover:bg-[#0b0c10] hover:text-[#b5f63d]">
            Home
          </Link>
          <div className="space-y-1">
            <span className="text-xs font-black text-[#b5f63d] uppercase tracking-wider px-3 block">Services & Vehicles</span>
            {serviceLinks.map((s, i) => (
              <Link key={i} href={s.href} onClick={() => setMobileMenuOpen(false)} className="block px-3 py-1.5 text-xs font-semibold text-slate-300 hover:text-[#b5f63d]">
                • {s.name}
              </Link>
            ))}
          </div>
          <div className="space-y-1">
            <span className="text-xs font-black text-[#b5f63d] uppercase tracking-wider px-3 block">Outstation Routes</span>
            {routeLinks.map((r, i) => (
              <Link key={i} href={r.href} onClick={() => setMobileMenuOpen(false)} className="block px-3 py-1.5 text-xs font-semibold text-slate-300 hover:text-[#b5f63d]">
                • {r.name}
              </Link>
            ))}
          </div>
          <div className="pt-2 border-t border-[#1e222d] flex flex-col gap-2">
            <a
              href="tel:+919833867640"
              className="w-full text-center py-3 rounded-xl border border-[#1e222d] bg-[#0b0c10] text-slate-200 text-sm font-bold flex items-center justify-center gap-2"
            >
              <Phone className="w-4 h-4 text-[#b5f63d]" />
              <span>Call +91 98338 67640</span>
            </a>
          </div>
        </div>
      )}
    </header>
  );
}
