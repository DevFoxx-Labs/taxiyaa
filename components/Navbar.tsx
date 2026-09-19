"use client";

import { useState } from "react";
import Link from "next/link";
import { Phone, Menu, X, ShieldCheck, ChevronRight, ChevronDown, Car, Compass, Layers, Info, HelpCircle, PhoneCall } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

interface NavbarProps {
  onOpenBookingModal: (service?: string) => void;
}

export default function Navbar({ onOpenBookingModal }: NavbarProps) {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [activeDropdown, setActiveDropdown] = useState<string | null>(null);
  const [mobileSection, setMobileSection] = useState<string | null>(null);

  const vehicleLinks = [
    { name: "Executive Sedans (Dzire / Etios)", href: "/#fleet" },
    { name: "Family SUVs (Maruti Ertiga)", href: "/#fleet" },
    { name: "Luxury SUVs (Innova Crysta)", href: "/#fleet" },
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
    { name: "Maharaja TT & Force Urbania", href: "/services/maharaja-tempo-traveller-force-urbania" },
    { name: "Luxury Car & SUV Hire", href: "/services/luxury-car-suv-rental" },
    { name: "Mini Bus & Luxury Bus Hire", href: "/services/mini-bus-luxury-bus-hire" },
    { name: "Pilgrimage & Temple Packages", href: "/services/pilgrimage-temple-tour-packages" },
    { name: "Corporate Travel Solutions", href: "/services/corporate-travel-solutions" },
    { name: "Employee Transportation", href: "/services/employee-transportation" },
    { name: "Wedding & Event Logistics", href: "/services/wedding-event-transportation" },
  ];

  const routeLinks = [
    { name: "Mumbai to Pune Cab", href: "/routes/mumbai-to-pune-cab" },
    { name: "Mumbai to Lonavala & Khandala", href: "/routes/mumbai-to-lonavala-cab" },
    { name: "Mumbai to Nashik Taxi", href: "/routes/mumbai-to-nashik-taxi" },
    { name: "Mumbai to Shirdi Sai Baba Taxi", href: "/routes/mumbai-to-shirdi-taxi" },
    { name: "Mumbai to Goa Outstation", href: "/routes/mumbai-to-goa-outstation" },
    { name: "Mumbai to Mahabaleshwar Cab", href: "/routes/mumbai-to-mahabaleshwar-cab" },
    { name: "Ashtavinayak 8-Ganesh Tour", href: "/routes/mumbai-to-ashtavinayak-tour" },
    { name: "3-Jyotirlinga Temple Circuit", href: "/routes/mumbai-to-jyotirlinga-circuit" },
    { name: "View All 12 Routes", href: "/#routes" },
  ];

  const toggleMobileSection = (section: string) => {
    setMobileSection(mobileSection === section ? null : section);
  };

  return (
    <header className="sticky top-0 z-50 w-full bg-[#0b0c10]/95 backdrop-blur-md border-b border-[#1e222d] select-none">
      {/* Top Announcement Bar */}
      <div className="bg-[#13151b] border-b border-[#1e222d] py-1.5 px-4 text-xs font-semibold text-slate-300">
        <div className="max-w-7xl mx-auto flex justify-between items-center">
          <div className="flex items-center gap-2">
            <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full bg-[#FAB304]/10 text-[#FAB304] text-[10px] uppercase font-black border border-[#FAB304]/20 shadow-sm">
              <ShieldCheck className="w-3 h-3" /> Verified 24/7 Cab Service
            </span>
            <span className="hidden md:inline text-slate-400 text-xs font-medium">
              CSMIA Airport Drops • Intercity Outstation Cabs • Luxury Force Urbania & Minibuses
            </span>
          </div>
          <div className="flex items-center gap-3">
            <a
              href="tel:+916392767985"
              className="flex items-center gap-1 text-slate-200 hover:text-[#FAB304] transition-colors text-xs font-extrabold"
            >
              <Phone className="w-3.5 h-3.5 text-[#FAB304]" />
              <span>+91 63927 67985</span>
            </a>
            <span className="text-slate-600 hidden sm:inline">|</span>
            <a
              href="tel:+918808527577"
              className="hidden sm:flex items-center gap-1 text-slate-200 hover:text-[#FAB304] transition-colors text-xs font-bold"
            >
              <span>+91 88085 27577</span>
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
              width={180}
              height={48}
              loading="eager"
              decoding="async"
              className="h-12 w-auto object-contain transition-transform duration-300 group-hover:scale-105"
            />
          </Link>

          {/* Desktop Navigation Links with Animated Dropdowns */}
          <nav className="hidden lg:flex items-center gap-7">
            <Link
              href="/"
              className="text-xs font-black uppercase tracking-wider text-slate-300 hover:text-[#FAB304] transition-colors"
            >
              Home
            </Link>

            {/* Our Vehicles Dropdown */}
            <div
              className="relative py-6"
              onMouseEnter={() => setActiveDropdown("vehicles")}
              onMouseLeave={() => setActiveDropdown(null)}
            >
              <button className="text-xs font-black uppercase tracking-wider text-slate-300 hover:text-[#FAB304] transition-colors flex items-center gap-1">
                <span>Our Vehicles</span>
                <ChevronDown
                  className={`w-3.5 h-3.5 text-[#FAB304] transition-transform duration-300 ${
                    activeDropdown === "vehicles" ? "rotate-180" : ""
                  }`}
                />
              </button>
              <AnimatePresence>
                {activeDropdown === "vehicles" && (
                  <motion.div
                    initial={{ opacity: 0, y: 10, scale: 0.98 }}
                    animate={{ opacity: 1, y: 0, scale: 1 }}
                    exit={{ opacity: 0, y: 8, scale: 0.98 }}
                    transition={{ duration: 0.2 }}
                    className="absolute top-full left-0 w-72 bg-[#13151b] border border-[#1e222d] rounded-2xl shadow-2xl p-3 space-y-1 z-50"
                  >
                    <div className="px-3 py-1.5 border-b border-[#1e222d] mb-1 flex items-center gap-1.5 text-[10px] font-black uppercase tracking-widest text-[#FAB304]">
                      <Car className="w-3.5 h-3.5" />
                      <span>Sanitized Fleet Options</span>
                    </div>
                    {vehicleLinks.map((item, idx) => (
                      <Link
                        key={idx}
                        href={item.href}
                        onClick={() => setActiveDropdown(null)}
                        className="block px-3 py-2 rounded-xl text-xs font-bold text-slate-300 hover:bg-[#0b0c10] hover:text-[#FAB304] transition-colors"
                      >
                        {item.name}
                      </Link>
                    ))}
                  </motion.div>
                )}
              </AnimatePresence>
            </div>

            {/* Services Dropdown */}
            <div
              className="relative py-6"
              onMouseEnter={() => setActiveDropdown("services")}
              onMouseLeave={() => setActiveDropdown(null)}
            >
              <button className="text-xs font-black uppercase tracking-wider text-slate-300 hover:text-[#FAB304] transition-colors flex items-center gap-1">
                <span>Services</span>
                <ChevronDown
                  className={`w-3.5 h-3.5 text-[#FAB304] transition-transform duration-300 ${
                    activeDropdown === "services" ? "rotate-180" : ""
                  }`}
                />
              </button>
              <AnimatePresence>
                {activeDropdown === "services" && (
                  <motion.div
                    initial={{ opacity: 0, y: 10, scale: 0.98 }}
                    animate={{ opacity: 1, y: 0, scale: 1 }}
                    exit={{ opacity: 0, y: 8, scale: 0.98 }}
                    transition={{ duration: 0.2 }}
                    className="absolute top-full left-0 w-72 bg-[#13151b] border border-[#1e222d] rounded-2xl shadow-2xl p-3 space-y-1 z-50 max-h-[75vh] overflow-y-auto"
                  >
                    <div className="px-3 py-1.5 border-b border-[#1e222d] mb-1 flex items-center gap-1.5 text-[10px] font-black uppercase tracking-widest text-[#FAB304]">
                      <Layers className="w-3.5 h-3.5" />
                      <span>Travel Services</span>
                    </div>
                    {serviceLinks.map((item, idx) => (
                      <Link
                        key={idx}
                        href={item.href}
                        onClick={() => setActiveDropdown(null)}
                        className="block px-3 py-2 rounded-xl text-xs font-bold text-slate-300 hover:bg-[#0b0c10] hover:text-[#FAB304] transition-colors"
                      >
                        {item.name}
                      </Link>
                    ))}
                  </motion.div>
                )}
              </AnimatePresence>
            </div>

            {/* Outstation Routes Dropdown */}
            <div
              className="relative py-6"
              onMouseEnter={() => setActiveDropdown("routes")}
              onMouseLeave={() => setActiveDropdown(null)}
            >
              <button className="text-xs font-black uppercase tracking-wider text-slate-300 hover:text-[#FAB304] transition-colors flex items-center gap-1">
                <span>Outstation Routes</span>
                <ChevronDown
                  className={`w-3.5 h-3.5 text-[#FAB304] transition-transform duration-300 ${
                    activeDropdown === "routes" ? "rotate-180" : ""
                  }`}
                />
              </button>
              <AnimatePresence>
                {activeDropdown === "routes" && (
                  <motion.div
                    initial={{ opacity: 0, y: 10, scale: 0.98 }}
                    animate={{ opacity: 1, y: 0, scale: 1 }}
                    exit={{ opacity: 0, y: 8, scale: 0.98 }}
                    transition={{ duration: 0.2 }}
                    className="absolute top-full left-0 w-72 bg-[#13151b] border border-[#1e222d] rounded-2xl shadow-2xl p-3 space-y-1 z-50"
                  >
                    <div className="px-3 py-1.5 border-b border-[#1e222d] mb-1 flex items-center gap-1.5 text-[10px] font-black uppercase tracking-widest text-[#FAB304]">
                      <Compass className="w-3.5 h-3.5" />
                      <span>Popular Expressways & Circuits</span>
                    </div>
                    {routeLinks.map((item, idx) => (
                      <Link
                        key={idx}
                        href={item.href}
                        onClick={() => setActiveDropdown(null)}
                        className="block px-3 py-2 rounded-xl text-xs font-bold text-slate-300 hover:bg-[#0b0c10] hover:text-[#FAB304] transition-colors"
                      >
                        {item.name}
                      </Link>
                    ))}
                  </motion.div>
                )}
              </AnimatePresence>
            </div>

            <Link
              href="/#about"
              className="text-xs font-black uppercase tracking-wider text-slate-300 hover:text-[#FAB304] transition-colors"
            >
              About Us
            </Link>
            <Link
              href="/#faqs"
              className="text-xs font-black uppercase tracking-wider text-slate-300 hover:text-[#FAB304] transition-colors"
            >
              FAQs
            </Link>
            <Link
              href="/#contact"
              className="text-xs font-black uppercase tracking-wider text-slate-300 hover:text-[#FAB304] transition-colors"
            >
              Contact
            </Link>
          </nav>

          {/* CTA Action Buttons */}
          <div className="hidden lg:flex items-center gap-3">
            <a
              href="tel:+916392767985"
              className="px-4 py-2.5 rounded-lg border border-[#1e222d] bg-[#13151b] text-slate-200 text-xs font-bold hover:border-[#FAB304] transition-colors flex items-center gap-1.5"
            >
              <Phone className="w-3.5 h-3.5 text-[#FAB304]" />
              <span>Call Now</span>
            </a>
            <motion.button
              whileTap={{ scale: 0.96 }}
              onClick={() => onOpenBookingModal()}
              className="btn-nova-neon px-5 py-2.5 text-xs uppercase font-extrabold flex items-center gap-1.5"
            >
              <span>Book Ride</span>
              <ChevronRight className="w-4 h-4" />
            </motion.button>
          </div>

          {/* Mobile Menu Trigger */}
          <div className="lg:hidden flex items-center gap-2.5">
            <motion.button
              whileTap={{ scale: 0.95 }}
              onClick={() => onOpenBookingModal()}
              className="btn-nova-neon px-3.5 py-2 text-xs uppercase font-black"
            >
              Book
            </motion.button>
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2.5 rounded-xl bg-[#13151b] border border-[#1e222d] text-slate-300 hover:text-white"
              aria-label="Toggle Navigation Menu"
            >
              {mobileMenuOpen ? <X className="w-6 h-6 text-[#FAB304]" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Drawer Navigation with Accordion Categories */}
      <AnimatePresence>
        {mobileMenuOpen && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            exit={{ opacity: 0, height: 0 }}
            transition={{ duration: 0.3 }}
            className="lg:hidden bg-[#13151b] border-b border-[#1e222d] px-4 pt-3 pb-6 space-y-3 max-h-[82vh] overflow-y-auto"
          >
            <Link
              href="/"
              onClick={() => setMobileMenuOpen(false)}
              className="block px-3 py-2.5 rounded-xl text-sm font-black uppercase text-slate-200 hover:bg-[#0b0c10] hover:text-[#FAB304] border border-[#1e222d]"
            >
              Home Page
            </Link>

            {/* Mobile Accordion: Vehicles */}
            <div className="border border-[#1e222d] rounded-xl overflow-hidden bg-[#0b0c10]">
              <button
                onClick={() => toggleMobileSection("vehicles")}
                className="w-full px-4 py-3 text-left flex items-center justify-between text-xs font-black uppercase text-[#FAB304] tracking-wider"
              >
                <span className="flex items-center gap-2"><Car className="w-4 h-4" /> Our Vehicles</span>
                <ChevronDown className={`w-4 h-4 transition-transform duration-300 ${mobileSection === "vehicles" ? "rotate-180" : ""}`} />
              </button>
              {mobileSection === "vehicles" && (
                <div className="p-3 pt-0 space-y-1.5 border-t border-[#1e222d]/60 bg-[#13151b]/60">
                  {vehicleLinks.map((item, idx) => (
                    <Link
                      key={idx}
                      href={item.href}
                      onClick={() => setMobileMenuOpen(false)}
                      className="block px-2.5 py-1.5 text-xs font-semibold text-slate-300 hover:text-[#FAB304]"
                    >
                      • {item.name}
                    </Link>
                  ))}
                </div>
              )}
            </div>

            {/* Mobile Accordion: Services */}
            <div className="border border-[#1e222d] rounded-xl overflow-hidden bg-[#0b0c10]">
              <button
                onClick={() => toggleMobileSection("services")}
                className="w-full px-4 py-3 text-left flex items-center justify-between text-xs font-black uppercase text-[#FAB304] tracking-wider"
              >
                <span className="flex items-center gap-2"><Layers className="w-4 h-4" /> Services</span>
                <ChevronDown className={`w-4 h-4 transition-transform duration-300 ${mobileSection === "services" ? "rotate-180" : ""}`} />
              </button>
              {mobileSection === "services" && (
                <div className="p-3 pt-0 space-y-1.5 border-t border-[#1e222d]/60 bg-[#13151b]/60">
                  {serviceLinks.map((item, idx) => (
                    <Link
                      key={idx}
                      href={item.href}
                      onClick={() => setMobileMenuOpen(false)}
                      className="block px-2.5 py-1.5 text-xs font-semibold text-slate-300 hover:text-[#FAB304]"
                    >
                      • {item.name}
                    </Link>
                  ))}
                </div>
              )}
            </div>

            {/* Mobile Accordion: Routes */}
            <div className="border border-[#1e222d] rounded-xl overflow-hidden bg-[#0b0c10]">
              <button
                onClick={() => toggleMobileSection("routes")}
                className="w-full px-4 py-3 text-left flex items-center justify-between text-xs font-black uppercase text-[#FAB304] tracking-wider"
              >
                <span className="flex items-center gap-2"><Compass className="w-4 h-4" /> Outstation Routes</span>
                <ChevronDown className={`w-4 h-4 transition-transform duration-300 ${mobileSection === "routes" ? "rotate-180" : ""}`} />
              </button>
              {mobileSection === "routes" && (
                <div className="p-3 pt-0 space-y-1.5 border-t border-[#1e222d]/60 bg-[#13151b]/60">
                  {routeLinks.map((item, idx) => (
                    <Link
                      key={idx}
                      href={item.href}
                      onClick={() => setMobileMenuOpen(false)}
                      className="block px-2.5 py-1.5 text-xs font-semibold text-slate-300 hover:text-[#FAB304]"
                    >
                      • {item.name}
                    </Link>
                  ))}
                </div>
              )}
            </div>

            {/* Anchor Links */}
            <div className="grid grid-cols-3 gap-2 pt-1">
              <Link
                href="/#about"
                onClick={() => setMobileMenuOpen(false)}
                className="py-2.5 text-center rounded-xl bg-[#0b0c10] border border-[#1e222d] text-xs font-extrabold uppercase text-slate-300"
              >
                About Us
              </Link>
              <Link
                href="/#faqs"
                onClick={() => setMobileMenuOpen(false)}
                className="py-2.5 text-center rounded-xl bg-[#0b0c10] border border-[#1e222d] text-xs font-extrabold uppercase text-slate-300"
              >
                FAQs
              </Link>
              <Link
                href="/#contact"
                onClick={() => setMobileMenuOpen(false)}
                className="py-2.5 text-center rounded-xl bg-[#0b0c10] border border-[#1e222d] text-xs font-extrabold uppercase text-slate-300"
              >
                Contact
              </Link>
            </div>

            {/* Direct Phone CTA */}
            <div className="pt-2 border-t border-[#1e222d] flex flex-col gap-2">
              <a
                href="tel:+916392767985"
                className="w-full text-center py-3 rounded-xl border border-[#FAB304]/40 bg-[#0b0c10] text-[#FAB304] text-xs font-black uppercase flex items-center justify-center gap-2 shadow-lg"
              >
                <PhoneCall className="w-4 h-4" />
                <span>Call Hotline +91 63927 67985</span>
              </a>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}







