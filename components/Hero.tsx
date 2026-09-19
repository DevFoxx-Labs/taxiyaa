"use client";

import { useState } from "react";
import { Star, ShieldCheck, MapPin, Calendar, Clock, Car, ChevronRight, PhoneCall } from "lucide-react";
import { motion } from "framer-motion";

interface HeroProps {
  onOpenBookingModal: (service?: string) => void;
}

export default function Hero({ onOpenBookingModal }: HeroProps) {
  const [tripType, setTripType] = useState<"outstation" | "local" | "airport">("outstation");
  const [pickup, setPickup] = useState("");
  const [destination, setDestination] = useState("");
  const [date, setDate] = useState("");
  const [time, setTime] = useState("");
  const [vehicle, setVehicle] = useState("Sedan (Dzire / Etios)");

  const handleWidgetSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const serviceName =
      tripType === "outstation"
        ? "Car rental / local & outstation"
        : tripType === "airport"
        ? "Airport Rental Car transfer"
        : "Car rental / local & outstation";

    const text = `Hello Taxiyaa! 🚖\n\nDirect Ride Enquiry:\n- *Trip Type*: ${tripType.toUpperCase()}\n- *Pickup*: ${pickup || "Mumbai"}\n- *Destination*: ${destination || "Outstation / Local"}\n- *Date*: ${date || "Flexible"}\n- *Time*: ${time || "Flexible"}\n- *Vehicle*: ${vehicle}`;

    window.open(`https://wa.me/919833867640?text=${encodeURIComponent(text)}`, "_blank");
  };

  return (
    <section className="relative min-h-[90vh] flex items-center justify-center overflow-hidden bg-nova-dark pt-8 pb-16">
      {/* Background Ambient Glow & Grid */}
      <div className="absolute inset-0 bg-grid-pattern opacity-40 pointer-events-none" />
      <div className="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-[#FAB304]/10 rounded-full blur-[140px] pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 w-full">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
          {/* Left Column: Headlines & USPs */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="lg:col-span-7 space-y-6 text-left"
          >
            {/* Rating Badge */}
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[#13151b] border border-[#1e222d] shadow-lg">
              <div className="flex text-amber-400">
                {[...Array(5)].map((_, i) => (
                  <Star key={i} className="w-4 h-4 fill-amber-400 stroke-amber-400" />
                ))}
              </div>
              <span className="text-xs font-bold text-slate-200">
                4.9/5 Rated Cab Service in Mumbai
              </span>
              <span className="w-1.5 h-1.5 rounded-full bg-[#FAB304]"></span>
              <span className="text-xs text-[#FAB304] font-bold">10,000+ Happy Rides</span>
            </div>

            {/* Main Headline */}
            <h1 className="text-4xl sm:text-5xl lg:text-6xl font-black tracking-tight text-white uppercase leading-[1.1]">
              YOUR TRUSTED <span className="neon-text-gradient">24/7 CAB & OUTSTATION</span> TRAVEL PARTNER
            </h1>

            {/* Subtitle */}
            <p className="text-base sm:text-lg text-slate-300 max-w-2xl font-normal leading-relaxed">
              Premium doorstep car rentals, CSMIA airport transfers, one-way outstation cabs to Pune, Lonavala & Goa, and luxury Tempo Travellers. Guaranteed transparent pricing with zero surge charges.
            </p>

            {/* Stats Row */}
            <div className="grid grid-cols-3 gap-4 pt-2 border-t border-[#1e222d] max-w-xl">
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
            <div className="flex flex-wrap items-center gap-4 pt-4">
              <button
                onClick={() => onOpenBookingModal()}
                className="btn-nova-neon px-8 py-4 uppercase text-xs font-extrabold flex items-center gap-2"
              >
                <span>Book Cab Instant</span>
                <ChevronRight className="w-4 h-4 stroke-[3]" />
              </button>
              <a
                href="tel:+919833867640"
                className="px-6 py-4 rounded-lg border border-[#1e222d] bg-[#13151b] hover:border-[#FAB304] text-slate-200 text-xs font-bold uppercase transition-colors flex items-center gap-2"
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
            <div className="bg-[#13151b] border-2 border-[#1e222d] rounded-2xl p-6 sm:p-7 shadow-2xl relative overflow-hidden">
              <div className="flex items-center justify-between mb-6 pb-4 border-b border-[#1e222d]">
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
              <div className="grid grid-cols-3 gap-1.5 p-1 bg-[#0b0c10] border border-[#1e222d] rounded-xl mb-5">
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
              <form onSubmit={handleWidgetSubmit} className="space-y-4">
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
    </section>
  );
}





