"use client";

import { Zap, ShieldCheck, DollarSign, Award } from "lucide-react";

export default function FeatureHighlights() {
  const features = [
    {
      icon: Zap,
      title: "Instant Confirmation",
      description: "Quick 2-minute booking via phone or WhatsApp with instant chauffeur assignment.",
    },
    {
      icon: DollarSign,
      title: "Transparent Fixed Rates",
      description: "No surge pricing during peak hours or rainy days. What you see is what you pay.",
    },
    {
      icon: ShieldCheck,
      title: "Sanitized & Clean Fleet",
      description: "Regularly deep-cleaned sedan, SUV, and minibus fleet with dual air conditioning.",
    },
    {
      icon: Award,
      title: "Verified Highway Drivers",
      description: "Polite, licensed, background-checked chauffeurs with extensive long-distance route experience.",
    },
  ];

  return (
    <section className="py-16 bg-nova-dark relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {features.map((item, index) => {
            const IconComponent = item.icon;
            return (
              <div
                key={index}
                className="card-nova p-6 flex flex-col justify-between group hover:border-[#FAB304]/50"
              >
                <div className="space-y-4">
                  <div className="w-12 h-12 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#FAB304] flex items-center justify-center group-hover:scale-110 transition-transform">
                    <IconComponent className="w-6 h-6" />
                  </div>
                  <h3 className="text-lg font-black text-white uppercase tracking-tight">{item.title}</h3>
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







