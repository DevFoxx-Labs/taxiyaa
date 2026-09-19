"use client";

import { Users, Briefcase, ChevronRight, ShieldCheck } from "lucide-react";

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
      rate: "₹12 / km",
      ideal: "City Local Travel, CSMIA Airport Drops & Budget Outstation Trips",
      image: "/images/fleet/swift_dzire.jpg",
    },
    {
      name: "Maruti Ertiga AC",
      category: "Family SUV",
      capacity: "6 Passengers",
      luggage: "3-4 Large Bags",
      rate: "₹15 / km",
      ideal: "Family Outstation Trips (Pune, Lonavala) & Group Airport Drops",
      image: "/images/fleet/ertiga_suv.jpg",
    },
    {
      name: "Toyota Innova Crysta",
      category: "Premium Luxury SUV",
      capacity: "7 Passengers",
      luggage: "4-5 Large Bags",
      rate: "₹18 / km",
      ideal: "VIP Corporate Delegations, Luxury Highway Travel & Wedding Convoys",
      image: "/images/fleet/innova_crysta.jpg",
    },
    {
      name: "Maharaja Tempo Traveller",
      category: "1x1 VIP Recliner Van",
      capacity: "9 - 12 Passengers",
      luggage: "Dedicated Luggage Bay",
      rate: "₹25 / km",
      ideal: "VIP Travel, Ambient Sky-LED Lights, Smart TV & Individual Recliners",
      image: "/images/fleet/maharaja_traveller.jpg",
    },
    {
      name: "Force Urbania Executive",
      category: "Luxury Monocoque Van",
      capacity: "10 - 17 Passengers",
      luggage: "Deep Rear Boot",
      rate: "₹28 / km",
      ideal: "Ultra-Smooth Air Suspension, Monocoque Body & VIP Corporate Comfort",
      image: "/images/fleet/force_urbania.jpg",
    },
    {
      name: "Mercedes-Benz / BMW / Fortuner",
      category: "Ultra Luxury Car & SUV",
      capacity: "4 - 7 Passengers",
      luggage: "3-4 Bags",
      rate: "₹35 - ₹55 / km",
      ideal: "Red-Carpet Groom Cars, VIP Dignitaries & Executive Delegation",
      image: "/images/fleet/mercedes_luxury.jpg",
    },
    {
      name: "Mini Bus (20 / 25 / 35 Seater)",
      category: "Executive Coach",
      capacity: "20 - 35 Passengers",
      luggage: "Overhead & Boot Bays",
      rate: "₹30 / km",
      ideal: "Office Staff Commute, Corporate Picnics & Family Functions",
      image: "/images/fleet/mini_bus.jpg",
    },
    {
      name: "Luxury Tourist Bus & Washroom Coach",
      category: "Volvo & Restroom Coach",
      capacity: "35 - 56 Passengers",
      luggage: "Heavy Cargo Bay",
      rate: "₹45 / km",
      ideal: "Onboard Toilet, Sleeper Berths & Long Interstate Pilgrimage Tours",
      image: "/images/fleet/bus_washroom.jpg",
    },
  ];

  return (
    <section id="fleet" className="py-20 bg-[#13151b] border-t border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <span className="text-xs font-black tracking-[0.2em] text-[#FAB304] uppercase">
            OUR SANITIZED FLEET
          </span>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            EXPLORE TAXIYAA VEHICLE OPTIONS
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            From executive sedans to Force Urbania vans, Maharaja 1x1 VIP recliners, Mercedes luxury cars, and 56-seater buses with washroom facilities.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {vehicles.map((v, idx) => (
            <div key={idx} className="card-nova overflow-hidden flex flex-col justify-between group">
              <div className="relative h-44 border-b border-[#1e222d]">
                <img src={v.image} alt={v.name} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-[#13151b]/40 to-transparent" />
                <span className="absolute top-3 left-3 px-3 py-1 rounded-full bg-[#0b0c10]/90 text-[#FAB304] text-[10px] font-black uppercase border border-[#1e222d]">
                  {v.category}
                </span>
              </div>

              <div className="p-5 space-y-4 flex-1 flex flex-col justify-between">
                <div className="space-y-2">
                  <h3 className="text-lg font-black text-white uppercase">{v.name}</h3>
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span className="flex items-center gap-1"><Users className="w-3.5 h-3.5 text-[#FAB304]" /> {v.capacity}</span>
                    <span className="flex items-center gap-1"><Briefcase className="w-3.5 h-3.5 text-[#FAB304]" /> {v.luggage}</span>
                  </div>
                  <p className="text-[11px] text-slate-400 font-medium pt-1 line-clamp-2">{v.ideal}</p>
                </div>

                <div className="pt-3 border-t border-[#1e222d] flex items-center justify-end">
                  {onOpenBookingModal && (
                    <button
                      onClick={() => onOpenBookingModal(`Vehicle - ${v.name}`)}
                      className="btn-nova-neon px-4 py-2 text-xs uppercase font-extrabold flex items-center gap-1"
                    >
                      <span>Book Now</span>
                      <ChevronRight className="w-3.5 h-3.5" />
                    </button>
                  )}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}





