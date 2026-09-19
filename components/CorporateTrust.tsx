"use client";

import { Building2, ShieldCheck, Award } from "lucide-react";

export default function CorporateTrust() {
  const corporateClients = [
    "TechMahindra BKC",
    "Tata Consultancy Services",
    "Reliance Industries",
    "L&T Infotech NESCO",
    "Capgemini Mindspace",
    "Accenture Powai",
    "Infosys Mumbai",
    "Godrej Industries",
    "HDFC Bank Corporate",
    "ICICI Prudential",
  ];

  return (
    <section className="py-16 bg-[#13151b] border-t border-[#1e222d] relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-10 space-y-2">
          <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-[#0b0c10] border border-[#1e222d] text-[#b5f63d] text-xs font-black uppercase">
            <Building2 className="w-4 h-4" /> CORPORATE PARTNERSHIPS
          </div>
          <h2 className="text-2xl sm:text-3xl lg:text-4xl font-black text-white uppercase tracking-tight">
            TRUSTED BY 100+ TOP CORPORATE HUBS & ENTERPRISES
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Preferred mobility partner for executive travel, VIP client delegations, and daily staff shift commute.
          </p>
        </div>

        {/* Corporate Client Ticker */}
        <div className="bg-[#0b0c10] border border-[#1e222d] rounded-2xl p-4 overflow-hidden shadow-xl select-none">
          <div className="animate-marquee whitespace-nowrap flex items-center gap-8">
            {[...corporateClients, ...corporateClients].map((client, idx) => (
              <div
                key={idx}
                className="inline-flex items-center gap-2.5 px-4 py-2 rounded-xl bg-[#13151b] border border-[#1e222d] text-xs font-extrabold text-slate-200 uppercase tracking-wider"
              >
                <ShieldCheck className="w-4 h-4 text-[#b5f63d] flex-shrink-0" />
                <span>{client}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
