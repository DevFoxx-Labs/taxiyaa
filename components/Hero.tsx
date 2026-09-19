"use client";

import { useState, useEffect, useRef } from "react";
import { Star, ShieldCheck, MapPin, Calendar, Clock, Car, ChevronRight, PhoneCall, ChevronLeft } from "lucide-react";
import { motion, AnimatePresence, useScroll, useTransform } from "framer-motion";

interface HeroProps {
  onOpenBookingModal: (service?: string) => void;
}

const heroSlides = [
  {
    image: "/images/hero/hero_slide_1.jpg",
    title: "Travel A Higher Tomorrow",
    subtitle: "Premium Innova Crysta & Executive Cabs",
    badge: "Luxury Fleet",
  },
  {
    image: "/images/hero/hero_slide_2.jpg",
    title: "Bigger Journeys Together",
    subtitle: "Executive Force Urbania Monocoque Vans",
    badge: "VIP Vans",
  },
  {
    image: "/images/hero/hero_slide_3.jpg",
    title: "Travel In A Higher Class",
    subtitle: "Toyota Fortuner 4x4 & Mercedes Luxury Hire",
    badge: "Ultra Luxury",
  },
  {
    image: "/images/hero/hero_slide_4.jpg",
    title: "Bigger Journeys Brighter Together",
    subtitle: "Spacious Executive Coaster & Mini Buses",
    badge: "Group Mobility",
  },
  {
    image: "/images/hero/hero_slide_5.jpg",
    title: "Travel Beyond Boundaries",
    subtitle: "Grand Scania Luxury Coaches & Washroom Buses",
    badge: "Interstate Travel",
  },
];

export default function Hero({ onOpenBookingModal }: HeroProps) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [currentSlide, setCurrentSlide] = useState(0);
  const [tripType, setTripType] = useState<"outstation" | "local" | "airport">("outstation");
  const [pickup, setPickup] = useState("");
  const [destination, setDestination] = useState("");
  const [date, setDate] = useState("");
  const [time, setTime] = useState("");
  const [vehicle, setVehicle] = useState("Sedan (Dzire / Etios)");

  // Scroll Parallax Hooks
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end start"],
  });

  const parallaxBgY = useTransform(scrollYProgress, [0, 1], ["0%", "35%"]);
  const parallaxTextY = useTransform(scrollYProgress, [0, 1], ["0%", "-20%"]);
  const parallaxOpacity = useTransform(scrollYProgress, [0, 0.8], [1, 0.2]);

  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % heroSlides.length);
    }, 5000);
    return () => clearInterval(timer);
  }, []);

  const handleWidgetSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const text = `Hello Taxiyaa! 🚖\n\nDirect Ride Enquiry:\n- *Trip Type*: ${tripType.toUpperCase()}\n- *Pickup*: ${pickup || "Mumbai"}\n- *Destination*: ${destination || "Outstation / Local"}\n- *Date*: ${date || "Flexible"}\n- *Time*: ${time || "Flexible"}\n- *Vehicle*: ${vehicle}`;

    window.open(`https://wa.me/916392767985?text=${encodeURIComponent(text)}`, "_blank");
  };

  return (
    <section ref={containerRef} className="relative min-h-[92vh] flex flex-col justify-between overflow-hidden bg-[#0b0c10] pt-8 pb-12">
      {/* Animated Hero Background Slideshow with Parallax Y Offset */}
      <motion.div style={{ y: parallaxBgY, opacity: parallaxOpacity }} className="absolute inset-0 z-0 pointer-events-none">
        <AnimatePresence mode="wait">
          <motion.div
            key={currentSlide}
            initial={{ opacity: 0, scale: 1.08 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 1 }}
            className="absolute inset-0"
          >
            <img
              src={heroSlides[currentSlide].image}
              alt={heroSlides[currentSlide].title}
              className="w-full h-full object-cover object-center"
            />
            {/* Gradient Overlays for High Contrast Readability */}
            <div className="absolute inset-0 bg-gradient-to-r from-[#0b0c10] via-[#0b0c10]/85 to-[#0b0c10]/70" />
            <div className="absolute inset-0 bg-gradient-to-t from-[#0b0c10] via-transparent to-[#0b0c10]/80" />
          </motion.div>
        </AnimatePresence>
      </motion.div>

      {/* Grid Pattern */}
      <div className="absolute inset-0 bg-grid-pattern opacity-30 pointer-events-none z-0" />
      <motion.div
        style={{ y: useTransform(scrollYProgress, [0, 1], [0, 120]) }}
        className="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-[#FAB304]/10 rounded-full blur-[140px] pointer-events-none z-0"
      />

      {/* Main Hero Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 w-full my-auto py-6">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-10 items-center">
          {/* Left Column: Headlines & USPs */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="lg:col-span-7 space-y-6 text-left"
          >
            {/* Rating & Active Slide Badge */}
            <div className="flex flex-wrap items-center gap-3">
              <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-[#13151b]/90 border border-[#1e222d] shadow-lg backdrop-blur-md">
                <div className="flex text-amber-400">
                  {[...Array(5)].map((_, i) => (
                    <Star key={i} className="w-3.5 h-3.5 fill-amber-400 stroke-amber-400" />
                  ))}
                </div>
                <span className="text-xs font-bold text-slate-200">
                  4.9/5 Rated Cab Service in Mumbai
                </span>
              </div>
              <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-[#FAB304]/20 border border-[#FAB304]/40 text-[#FAB304] text-xs font-extrabold uppercase tracking-wider backdrop-blur-md">
                <span className="w-2 h-2 rounded-full bg-[#FAB304] animate-pulse" />
                {heroSlides[currentSlide].badge}
              </span>
            </div>

            {/* Main Dynamic Headline */}
            <div className="space-y-2">
              <h1 className="text-4xl sm:text-5xl lg:text-6xl font-black tracking-tight text-white uppercase leading-[1.1]">
                YOUR TRUSTED <span className="neon-text-gradient">24/7 CAB & OUTSTATION</span> TRAVEL PARTNER
              </h1>
              <p className="text-base sm:text-lg text-[#FAB304] font-extrabold uppercase tracking-wide">
                {heroSlides[currentSlide].title} — {heroSlides[currentSlide].subtitle}
              </p>
            </div>

            {/* Subtitle Description */}
            <p className="text-sm sm:text-base text-slate-300 max-w-2xl font-normal leading-relaxed">
              Premium doorstep car rentals, CSMIA airport transfers, one-way outstation cabs to Pune, Lonavala & Goa, and luxury Tempo Travellers. Guaranteed transparent pricing with zero surge charges.
            </p>

            {/* Stats Row */}
            <div className="grid grid-cols-3 gap-4 pt-2 border-t border-[#1e222d]/80 max-w-xl">
              <div>
                <span className="block text-2xl font-black text-white">24 / 7</span>
                <span className="text-xs text-slate-400 uppercase font-semibold">Available Pickup</span>
              </div>
              <div>
                <span className="block text-2xl font-black text-[#FAB304]">₹0 Surge</span>
                <span className="text-xs text-slate-400 uppercase font-semibold">Fixed Transparent Fares</span>
              </div>
              <div>
                <span className="block text-2xl font-black text-white">100%</span>
                <span className="text-xs text-slate-400 uppercase font-semibold">Verified Drivers</span>
              </div>
            </div>

            {/* Quick Actions */}
            <div className="flex flex-wrap items-center gap-4 pt-2">
              <button
                onClick={() => onOpenBookingModal()}
                className="btn-nova-neon px-8 py-4 uppercase text-xs font-extrabold flex items-center gap-2 shadow-xl"
              >
                <span>Book Cab Instant</span>
                <ChevronRight className="w-4 h-4 stroke-[3]" />
              </button>
              <a
                href="tel:+916392767985"
                className="px-6 py-4 rounded-lg border border-[#1e222d] bg-[#13151b]/90 backdrop-blur-md hover:border-[#FAB304] text-slate-200 text-xs font-bold uppercase transition-colors flex items-center gap-2"
              >
                <PhoneCall className="w-4 h-4 text-[#FAB304]" />
                <span>Call Hotline</span>
              </a>
            </div>
          </motion.div>

          {/* Right Column: Live Booking Widget Card */}
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 0.6, delay: 0.2 }}
            className="lg:col-span-5"
          >
            <div className="bg-[#13151b]/95 backdrop-blur-xl border-2 border-[#1e222d] rounded-2xl p-6 sm:p-7 shadow-2xl relative overflow-hidden">
              <div className="flex items-center justify-between mb-5 pb-3.5 border-b border-[#1e222d]">
                <div>
                  <span className="text-[10px] font-black tracking-widest text-[#FAB304] uppercase">
                    INSTANT CAB QUOTE
                  </span>
                  <h3 className="text-xl font-black text-white uppercase">Search & Book Ride</h3>
                </div>
                <div className="w-9 h-9 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#FAB304] flex items-center justify-center">
                  <Car className="w-5 h-5" />
                </div>
              </div>

              {/* Trip Type Selector */}
              <div className="grid grid-cols-3 gap-1.5 p-1 bg-[#0b0c10] border border-[#1e222d] rounded-xl mb-4">
                {(["outstation", "local", "airport"] as const).map((type) => (
                  <button
                    key={type}
                    type="button"
                    onClick={() => setTripType(type)}
                    className={`py-2 text-xs font-extrabold uppercase rounded-lg transition-all ${
                      tripType === type
                        ? "bg-[#FAB304] text-[#0b0c10] shadow-md"
                        : "text-slate-400 hover:text-white"
                    }`}
                  >
                    {type}
                  </button>
                ))}
              </div>

              {/* Booking Form Widget */}
              <form onSubmit={handleWidgetSubmit} className="space-y-3.5">
                <div>
                  <label className="block text-[11px] font-bold text-slate-300 mb-1 uppercase tracking-wider flex items-center gap-1">
                    <MapPin className="w-3.5 h-3.5 text-[#FAB304]" /> Pickup Address / City
                  </label>
                  <input
                    type="text"
                    required
                    value={pickup}
                    onChange={(e) => setPickup(e.target.value)}
                    placeholder="e.g. Goregaon West, Mumbai"
                    className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2.5 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                  />
                </div>

                <div>
                  <label className="block text-[11px] font-bold text-slate-300 mb-1 uppercase tracking-wider flex items-center gap-1">
                    <MapPin className="w-3.5 h-3.5 text-[#FAB304]" /> Destination / Drop Location
                  </label>
                  <input
                    type="text"
                    required
                    value={destination}
                    onChange={(e) => setDestination(e.target.value)}
                    placeholder="e.g. Pune / CSMIA Terminal 2 / Shirdi"
                    className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2.5 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                  />
                </div>

                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-[11px] font-bold text-slate-300 mb-1 uppercase tracking-wider flex items-center gap-1">
                      <Calendar className="w-3.5 h-3.5 text-[#FAB304]" /> Travel Date
                    </label>
                    <input
                      type="date"
                      required
                      value={date}
                      onChange={(e) => setDate(e.target.value)}
                      className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3 py-2 text-xs text-white focus:outline-none focus:border-[#FAB304]"
                    />
                  </div>

                  <div>
                    <label className="block text-[11px] font-bold text-slate-300 mb-1 uppercase tracking-wider flex items-center gap-1">
                      <Clock className="w-3.5 h-3.5 text-[#FAB304]" /> Pickup Time
                    </label>
                    <input
                      type="time"
                      value={time}
                      onChange={(e) => setTime(e.target.value)}
                      className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3 py-2 text-xs text-white focus:outline-none focus:border-[#FAB304]"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-[11px] font-bold text-slate-300 mb-1 uppercase tracking-wider flex items-center gap-1">
                    <Car className="w-3.5 h-3.5 text-[#FAB304]" /> Preferred Vehicle
                  </label>
                  <select
                    value={vehicle}
                    onChange={(e) => setVehicle(e.target.value)}
                    className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2.5 text-xs text-white focus:outline-none focus:border-[#FAB304]"
                  >
                    <option value="Sedan (Dzire / Etios)">Sedan (Swift Dzire / Etios - 4 Seats)</option>
                    <option value="SUV Ertiga (6 Seats)">SUV Maruti Ertiga (6 Seats)</option>
                    <option value="Toyota Innova Crysta (7 Seats)">Toyota Innova Crysta (7 Seats)</option>
                    <option value="Force Urbania Monocoque Van (10-17 Seats)">Force Urbania Monocoque Van (10-17 Seats)</option>
                    <option value="Maharaja 1x1 VIP Recliner TT (9-12 Seats)">Maharaja 1x1 VIP Recliner TT (9-12 Seats)</option>
                    <option value="Luxury Mercedes / BMW / Fortuner">Luxury Mercedes / BMW / Fortuner</option>
                  </select>
                </div>

                <button
                  type="submit"
                  className="btn-nova-neon w-full py-3.5 uppercase text-xs font-black tracking-wider flex items-center justify-center gap-2 cursor-pointer mt-2"
                >
                  <ShieldCheck className="w-4 h-4 fill-[#0b0c10]" />
                  <span>Check Fare & Book Now</span>
                </button>
              </form>
            </div>
          </motion.div>
        </div>
      </div>

      {/* Hero Banner Slideshow Navigation Controls & Dots Bar */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 w-full pt-4">
        <div className="flex items-center justify-between p-3 rounded-xl bg-[#13151b]/80 border border-[#1e222d] backdrop-blur-md">
          <div className="flex items-center gap-3">
            <button
              onClick={() => setCurrentSlide((prev) => (prev === 0 ? heroSlides.length - 1 : prev - 1))}
              className="p-1.5 rounded-lg bg-[#0b0c10] border border-[#1e222d] text-slate-300 hover:text-[#FAB304] transition-colors"
              aria-label="Previous Slide"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>
            <span className="text-xs font-bold text-slate-300 uppercase tracking-wider">
              <span className="text-[#FAB304] font-black">0{currentSlide + 1}</span> / 0{heroSlides.length} — {heroSlides[currentSlide].title}
            </span>
          </div>

          {/* Dots Indicator */}
          <div className="flex items-center gap-2">
            {heroSlides.map((_, idx) => (
              <button
                key={idx}
                onClick={() => setCurrentSlide(idx)}
                className={`h-2 rounded-full transition-all ${
                  currentSlide === idx
                    ? "w-8 bg-[#FAB304]"
                    : "w-2 bg-[#1e222d] hover:bg-slate-500"
                }`}
                aria-label={`Go to slide ${idx + 1}`}
              />
            ))}
          </div>

          <button
            onClick={() => setCurrentSlide((prev) => (prev + 1) % heroSlides.length)}
            className="p-1.5 rounded-lg bg-[#0b0c10] border border-[#1e222d] text-slate-300 hover:text-[#FAB304] transition-colors"
            aria-label="Next Slide"
          >
            <ChevronRight className="w-4 h-4" />
          </button>
        </div>
      </div>
    </section>
  );
}








