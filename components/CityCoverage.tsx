"use client";

import { MapPin, Globe, CheckCircle2 } from "lucide-react";

export default function CityCoverage() {
  const regions = [
    {
      region: "Maharashtra & Mumbai MMRA",
      cities: ["Mumbai Suburbs", "Goregaon & Andheri", "BKC & Bandra", "Thane & Kalyan", "Navi Mumbai & Vashi", "Pune & Pimpri", "Lonavala & Khandala", "Nashik & Trimbak", "Shirdi & Rahata", "Kolhapur & Satara"],
    },
    {
      region: "West India Intercity",
      cities: ["Surat & Vapi", "Vadodara", "Ahmedabad", "Goa (North & South)", "Silvassa & Daman", "Indore", "Ujjain"],
    },
    {
      region: "South & Interstate Hubs",
      cities: ["Bengaluru", "Hyderabad", "Chennai", "Belgaum", "Hubli", "Mangalore"],
    },
  ];

  return (
    <section className="py-20 bg-nova-dark border-t border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-[#13151b] border border-[#1e222d] text-[#b5f63d] text-xs font-black uppercase">
            <Globe className="w-4 h-4" /> INTERCITY NETWORK
          </div>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            TAXIYAA AVAILABLE ACROSS MAJOR CITIES
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Seamless cab rentals, outstation drops, and group transport operations across 15+ major cities.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {regions.map((reg, idx) => (
            <div key={idx} className="card-nova p-6 space-y-4">
              <div className="flex items-center gap-2 border-b border-[#1e222d] pb-3">
                <MapPin className="w-5 h-5 text-[#b5f63d]" />
                <h3 className="text-lg font-black text-white uppercase tracking-tight">{reg.region}</h3>
              </div>

              <div className="grid grid-cols-2 gap-2">
                {reg.cities.map((city, cIdx) => (
                  <div key={cIdx} className="p-2.5 rounded-lg bg-[#0b0c10] border border-[#1e222d] flex items-center gap-1.5 text-xs font-bold text-slate-300">
                    <CheckCircle2 className="w-3.5 h-3.5 text-[#b5f63d] flex-shrink-0" />
                    <span className="truncate">{city}</span>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
