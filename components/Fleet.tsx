"use client";

import { motion } from "framer-motion";
import { Users, Briefcase, ChevronRight, ShieldCheck, Car } from "lucide-react";

interface FleetProps {
  onOpenBookingModal?: (service?: string) => void;
}

export default function Fleet({ onOpenBookingModal }: FleetProps) {
  const vehicles = [
    {
      name: "Swift Dzire / Toyota Etios",
      category: "Executive Sedan",
      capacity: "4 Passengers",
      luggage: "2-3 Large Bags",
      ideal: "City Local Travel, CSMIA Airport Drops & Budget Outstation Trips",
      image: "/images/fleet/swift_dzire.jpg",
    },
    {
      name: "Maruti Ertiga AC",
      category: "Family SUV",
      capacity: "6 Passengers",
      luggage: "3-4 Large Bags",
      ideal: "Family Outstation Trips (Pune, Lonavala) & Group Airport Drops",
      image: "/images/fleet/ertiga_suv.jpg",
    },
    {
      name: "Toyota Innova Crysta",
      category: "Premium Luxury SUV",
      capacity: "7 Passengers",
      luggage: "4-5 Large Bags",
      ideal: "VIP Corporate Delegations, Luxury Highway Travel & Wedding Convoys",
      image: "/images/fleet/innova_crysta.jpg",
    },
    {
      name: "Maharaja Tempo Traveller",
      category: "1x1 VIP Recliner Van",
      capacity: "9 - 12 Passengers",
      luggage: "Dedicated Luggage Bay",
      ideal: "VIP Travel, Ambient Sky-LED Lights, Smart TV & Individual Recliners",
      image: "/images/fleet/maharaja_traveller.jpg",
    },
    {
      name: "Force Urbania Executive",
      category: "Luxury Monocoque Van",
      capacity: "10 - 17 Passengers",
      luggage: "Deep Rear Boot",
      ideal: "Ultra-Smooth Air Suspension, Monocoque Body & VIP Corporate Comfort",
      image: "/images/fleet/force_urbania.jpg",
    },
    {
      name: "Mercedes-Benz / BMW / Fortuner",
      category: "Ultra Luxury Car & SUV",
      capacity: "4 - 7 Passengers",
      luggage: "3-4 Bags",
      ideal: "Red-Carpet Groom Cars, VIP Dignitaries & Executive Delegation",
      image: "/images/fleet/mercedes_luxury.jpg",
    },
    {
      name: "Mini Bus (20 / 25 / 35 Seater)",
      category: "Executive Coach",
      capacity: "20 - 35 Passengers",
      luggage: "Overhead & Boot Bays",
      ideal: "Office Staff Commute, Corporate Picnics & Family Functions",
      image: "/images/fleet/mini_bus.jpg",
    },
    {
      name: "Luxury Tourist Bus & Washroom Coach",
      category: "Volvo & Restroom Coach",
      capacity: "35 - 56 Passengers",
      luggage: "Heavy Cargo Bay",
      ideal: "Onboard Toilet, Sleeper Berths & Long Interstate Pilgrimage Tours",
      image: "/images/fleet/bus_washroom.jpg",
    },
  ];

  return (
    <section id="fleet" className="py-20 bg-[#13151b] border-t border-[#1e222d] relative overflow-hidden">
      {/* Glow Orbs */}
      <div className="absolute top-1/2 left-0 w-96 h-96 bg-[#FAB304]/5 rounded-full blur-3xl pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <motion.div
          initial={{ opacity: 0, y: 25 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6 }}
          className="text-center max-w-3xl mx-auto mb-16 space-y-3"
        >
          <div className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-[#0b0c10] border border-[#FAB304]/30 text-[#FAB304] text-xs font-black uppercase tracking-wider shadow-lg">
            <Car className="w-3.5 h-3.5" />
            <span>OUR SANITIZED FLEET</span>
          </div>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            EXPLORE TAXIYAA VEHICLE OPTIONS
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            From executive sedans to Force Urbania vans, Maharaja 1x1 VIP recliners, Mercedes luxury cars, and 56-seater buses with washroom facilities.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {vehicles.map((v, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: idx * 0.08 }}
              whileHover={{ y: -6 }}
              className="card-nova overflow-hidden flex flex-col justify-between group transition-all duration-300 hover:border-[#FAB304]/60 hover:shadow-[0_10px_25px_rgba(250,179,4,0.12)]"
            >
              <div className="relative h-44 border-b border-[#1e222d] overflow-hidden">
                <img
                  src={v.image}
                  alt={v.name}
                  className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 ease-out"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-[#13151b]/40 to-transparent" />
                <span className="absolute top-3 left-3 px-3 py-1 rounded-full bg-[#0b0c10]/90 text-[#FAB304] text-[10px] font-black uppercase border border-[#1e222d] backdrop-blur-md">
                  {v.category}
                </span>
              </div>

              <div className="p-5 space-y-4 flex-1 flex flex-col justify-between">
                <div className="space-y-2">
                  <h3 className="text-lg font-black text-white uppercase group-hover:text-[#FAB304] transition-colors">
                    {v.name}
                  </h3>
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span className="flex items-center gap-1"><Users className="w-3.5 h-3.5 text-[#FAB304]" /> {v.capacity}</span>
                    <span className="flex items-center gap-1"><Briefcase className="w-3.5 h-3.5 text-[#FAB304]" /> {v.luggage}</span>
                  </div>
                  <p className="text-[11px] text-slate-400 font-medium pt-1 line-clamp-2">{v.ideal}</p>
                </div>

                <div className="pt-3 border-t border-[#1e222d] flex items-center justify-end">
                  {onOpenBookingModal && (
                    <motion.button
                      whileTap={{ scale: 0.95 }}
                      onClick={() => onOpenBookingModal(`Vehicle - ${v.name}`)}
                      className="btn-nova-neon px-4 py-2 text-xs uppercase font-extrabold flex items-center gap-1"
                    >
                      <span>Book Now</span>
                      <ChevronRight className="w-3.5 h-3.5" />
                    </motion.button>
                  )}
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}







