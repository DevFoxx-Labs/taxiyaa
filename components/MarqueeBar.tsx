"use client";

import { CheckCircle2 } from "lucide-react";

export default function MarqueeBar() {
  const highlights = [
    "24/7 Doorstep Cab Pickups Across Mumbai",
    "CSMIA Airport Transfer Specialists (Terminals T1 & T2)",
    "Intercity Outstation Cabs: Pune, Lonavala, Nashik & Goa",
    "Luxury Tempo Travellers (12 / 17 / 26 Seater)",
    "Fixed Transparent Fares • Zero Hidden Charges",
    "Sanitized Fleet & Verified Experienced Chauffeurs",
    "Corporate Mobility Solutions & Monthly Billing",
  ];

  return (
    <div className="w-full bg-[#13151b] border-y border-[#1e222d] py-3.5 overflow-hidden select-none">
      <div className="animate-marquee whitespace-nowrap flex items-center gap-8">
        {[...highlights, ...highlights].map((text, idx) => (
          <div key={idx} className="inline-flex items-center gap-2.5 text-xs font-bold uppercase tracking-wider text-slate-300">
            <CheckCircle2 className="w-4 h-4 text-[#b5f63d] flex-shrink-0" />
            <span>{text}</span>
            <span className="text-[#1e222d] font-normal ml-4">•</span>
          </div>
        ))}
      </div>
    </div>
  );
}
