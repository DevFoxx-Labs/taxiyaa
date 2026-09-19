"use client";

import { useState } from "react";
import Link from "next/link";
import { routesData } from "@/data/routesData";
import { MapPin, Clock, ArrowRight, ChevronRight, Car, Compass } from "lucide-react";

interface PopularRoutesProps {
  onOpenBookingModal?: (service?: string) => void;
}

export default function PopularRoutes({ onOpenBookingModal }: PopularRoutesProps) {
  const [filter, setFilter] = useState("all");

  const filteredRoutes =
    filter === "all" ? routesData : routesData.filter((r) => r.category === filter);

  return (
    <section id="routes" className="py-20 bg-nova-dark relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-12 space-y-3">
          <span className="text-xs font-black tracking-[0.2em] text-[#b5f63d] uppercase">
            INTERCITY & PILGRIMAGE NETWORK
          </span>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            POPULAR OUTSTATION CAB & BUS ROUTES
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            One-way drops, roundtrip outstation cabs, and pilgrimage tour packages starting from Mumbai.
          </p>

          {/* Category Filter Tabs */}
          <div className="flex flex-wrap justify-center gap-2 pt-4">
            {[
              { id: "all", label: "All Routes (12)" },
              { id: "expressway", label: "Expressway Drops" },
              { id: "pilgrimage", label: "Pilgrimage Circuits" },
              { id: "hill-station", label: "Hill Stations" },
              { id: "coastal", label: "Coastal Drives" },
            ].map((tab) => (
              <button
                key={tab.id}
                onClick={() => setFilter(tab.id)}
                className={`px-4 py-2 rounded-xl text-xs font-bold uppercase transition-all ${
                  filter === tab.id
                    ? "bg-[#b5f63d] text-[#0b0c10] shadow-md"
                    : "bg-[#13151b] border border-[#1e222d] text-slate-400 hover:text-white"
                }`}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredRoutes.map((r) => (
            <div key={r.id} className="card-nova p-5 flex flex-col justify-between group">
              <div className="space-y-4">
                <div className="flex items-center justify-between">
                  <span className="px-2.5 py-1 rounded-full bg-[#0b0c10] border border-[#1e222d] text-[#b5f63d] text-[10px] font-extrabold uppercase">
                    {r.category}
                  </span>
                  <div className="flex items-center gap-1 text-slate-400 text-xs font-bold">
                    <Clock className="w-3.5 h-3.5 text-[#b5f63d]" />
                    <span>{r.duration}</span>
                  </div>
                </div>

                <div>
                  <h3 className="text-lg font-black text-white uppercase group-hover:text-[#b5f63d] transition-colors flex items-center gap-1.5">
                    <Car className="w-4 h-4 text-[#b5f63d]" /> {r.title}
                  </h3>
                  <p className="text-xs text-slate-400 font-semibold mt-1">Approx distance: {r.distance}</p>
                </div>

                <div className="space-y-1">
                  <span className="text-[10px] font-extrabold uppercase text-slate-500 block">Highlights</span>
                  <div className="flex flex-wrap gap-1">
                    {r.keyAttractions.slice(0, 3).map((spot, sIdx) => (
                      <span key={sIdx} className="px-2 py-0.5 rounded-md bg-[#0b0c10] text-[10px] font-semibold text-slate-300">
                        {spot}
                      </span>
                    ))}
                  </div>
                </div>
              </div>

              <div className="pt-4 mt-4 border-t border-[#1e222d] flex items-center justify-between">
                <div>
                  <span className="text-[10px] font-bold text-slate-500 uppercase block">Starting Fare</span>
                  <span className="text-lg font-black text-[#b5f63d]">{r.startingFare}</span>
                </div>
                <div className="flex items-center gap-2">
                  <Link
                    href={`/routes/${r.slug}`}
                    className="text-xs font-extrabold text-slate-300 hover:text-[#b5f63d] flex items-center gap-1 uppercase"
                  >
                    <span>Details</span>
                    <ArrowRight className="w-3.5 h-3.5 text-[#b5f63d]" />
                  </Link>
                  {onOpenBookingModal && (
                    <button
                      onClick={() => onOpenBookingModal(`Outstation - ${r.title}`)}
                      className="btn-nova-neon px-3.5 py-1.5 text-[11px] uppercase font-extrabold flex items-center gap-1"
                    >
                      <span>Book</span>
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
