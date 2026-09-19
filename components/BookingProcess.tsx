"use client";

import { Search, Car, FileCheck, ThumbsUp } from "lucide-react";

export default function BookingProcess() {
  const steps = [
    {
      step: "01",
      icon: Search,
      title: "Choose Route / Service",
      description: "Select local hourly rental, outstation trip, or CSMIA airport transfer.",
    },
    {
      step: "02",
      icon: Car,
      title: "Select Vehicle",
      description: "Choose from Swift Dzire sedans, Ertigas, Innova Crystas, or Tempo Travellers.",
    },
    {
      step: "03",
      icon: FileCheck,
      title: "Instant Fare Quote",
      description: "Receive transparent fixed fare via WhatsApp with driver & cab details.",
    },
    {
      step: "04",
      icon: ThumbsUp,
      title: "Enjoy Doorstep Ride",
      description: "Your verified chauffeur arrives on time for a clean, comfortable journey.",
    },
  ];

  return (
    <section className="py-20 bg-nova-dark relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-2xl mx-auto mb-16 space-y-2">
          <span className="text-xs font-black tracking-[0.2em] text-[#FAB304] uppercase">
            HOW IT WORKS
          </span>
          <h2 className="text-3xl sm:text-4xl font-black text-white uppercase tracking-tight">
            BOOKING YOUR TAXIYAA CAB IN 4 SIMPLE STEPS
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Fast, hassle-free booking with zero upfront payment friction.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {steps.map((item, idx) => {
            const IconComponent = item.icon;
            return (
              <div key={idx} className="card-nova p-6 relative flex flex-col justify-between group">
                <div className="space-y-4">
                  <div className="flex items-center justify-between">
                    <div className="w-12 h-12 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#FAB304] flex items-center justify-center font-bold group-hover:scale-110 transition-transform">
                      <IconComponent className="w-6 h-6" />
                    </div>
                    <span className="text-2xl font-black text-slate-700 font-mono">{item.step}</span>
                  </div>
                  <h3 className="text-lg font-black text-white uppercase">{item.title}</h3>
                  <p className="text-xs text-slate-400 font-medium leading-relaxed">{item.description}</p>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}




