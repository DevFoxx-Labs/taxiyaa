"use client";

import { useState } from "react";

export default function Gallery() {
  const [filter, setFilter] = useState("all");

  const photos = [
    {
      url: "/images/services/service_car_rental.jpg",
      title: "Executive Sedan Fleet",
      category: "fleet",
    },
    {
      url: "/images/services/service_airport.jpg",
      title: "CSMIA Airport Terminal Drop",
      category: "airport",
    },
    {
      url: "/images/fleet/maharaja_traveller.jpg",
      title: "17-Seater Luxury Tempo Traveller",
      category: "fleet",
    },
    {
      url: "/images/shirdi_temple.jpg",
      title: "Mumbai-Pune Expressway Travel",
      category: "outstation",
    },
    {
      url: "/images/services/service_corporate.jpg",
      title: "Corporate Delegation Transport",
      category: "fleet",
    },
    {
      url: "/images/fleet/innova_crysta.jpg",
      title: "Wedding Convoy Fleet",
      category: "outstation",
    },
  ];

  const filteredPhotos = filter === "all" ? photos : photos.filter((p) => p.category === filter);

  return (
    <section className="py-20 bg-[#13151b] border-t border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-12 space-y-3">
          <span className="text-xs font-black tracking-[0.2em] text-[#FAB304] uppercase">
            GALLERY & VISUALS
          </span>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            TAXIYAA JOURNEYS & FLEET IN ACTION
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Take a look at our clean sanitized fleet and memorable outstation journeys.
          </p>

          {/* Filter Tabs */}
          <div className="flex justify-center gap-2 pt-4">
            {[
              { id: "all", label: "All Photos" },
              { id: "fleet", label: "Fleet Vehicles" },
              { id: "outstation", label: "Outstation Trips" },
              { id: "airport", label: "Airport Transfers" },
            ].map((tab) => (
              <button
                key={tab.id}
                onClick={() => setFilter(tab.id)}
                className={`px-4 py-2 rounded-xl text-xs font-bold uppercase transition-all ${
                  filter === tab.id
                    ? "bg-[#FAB304] text-[#0b0c10] shadow-md"
                    : "bg-[#0b0c10] border border-[#1e222d] text-slate-400 hover:text-white"
                }`}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredPhotos.map((photo, idx) => (
            <div key={idx} className="card-nova overflow-hidden relative group h-64 border border-[#1e222d]">
              <img
                src={photo.url}
                alt={photo.title}
                className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-[#0b0c10] via-transparent to-transparent opacity-80 group-hover:opacity-95 transition-opacity" />
              <div className="absolute bottom-4 left-4 right-4">
                <span className="text-[10px] font-black uppercase text-[#FAB304] tracking-wider block">
                  {photo.category}
                </span>
                <h3 className="text-base font-black text-white uppercase">{photo.title}</h3>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}





