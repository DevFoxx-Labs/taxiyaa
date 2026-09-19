"use client";

import { motion } from "framer-motion";
import { Check, X, ShieldCheck, Zap } from "lucide-react";

export default function WhyChooseUs() {
  const comparisons = [
    {
      feature: "Surge Pricing",
      taxiyaa: "Zero Surge Fares (Fixed Rates)",
      aggregators: "High 2x-3x Surge during Peak & Rain",
    },
    {
      feature: "Driver Cancellation",
      taxiyaa: "100% Guaranteed Driver Dispatch",
      aggregators: "Frequent Last-Minute Cancellations",
    },
    {
      feature: "Vehicle Hygiene",
      taxiyaa: "Sanitized, AC-Inspected Fleet",
      aggregators: "Unpredictable Car Condition",
    },
    {
      feature: "Airport Transfers",
      taxiyaa: "24/7 CSMIA Flight Tracking & Pickup",
      aggregators: "Long Pickup Waiting Lines at Terminals",
    },
    {
      feature: "Outstation Comfort",
      taxiyaa: "Experienced Highway Chauffeurs",
      aggregators: "Inexperienced City-only Drivers",
    },
    {
      feature: "Customer Support",
      taxiyaa: "Direct Phone & WhatsApp Hotline",
      aggregators: "Automated Bot Support Tickets",
    },
  ];

  return (
    <section className="py-20 bg-nova-dark relative overflow-hidden">
      {/* Ambient Glow */}
      <div className="absolute bottom-0 left-1/3 w-96 h-96 bg-[#FAB304]/5 rounded-full blur-3xl pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <motion.div
          initial={{ opacity: 0, y: 25 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6 }}
          className="text-center max-w-3xl mx-auto mb-16 space-y-3"
        >
          <div className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-[#13151b] border border-[#FAB304]/30 text-[#FAB304] text-xs font-black uppercase tracking-wider shadow-lg">
            <Zap className="w-3.5 h-3.5 text-[#FAB304]" />
            <span>THE TAXIYAA ADVANTAGE</span>
          </div>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            WHY CHOOSE TAXIYAA OVER STANDARD CAB APPS
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Reliable pre-booked mobility designed for stress-free travel.
          </p>
        </motion.div>

        {/* Comparison Table */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6 }}
          className="bg-[#13151b] border border-[#1e222d] rounded-2xl overflow-hidden shadow-2xl"
        >
          <div className="grid grid-cols-12 bg-[#0b0c10] border-b border-[#1e222d] p-4 text-xs font-black uppercase tracking-wider text-slate-300">
            <div className="col-span-4 sm:col-span-4">Feature / Service</div>
            <div className="col-span-4 sm:col-span-4 text-[#FAB304] flex items-center gap-1">
              <ShieldCheck className="w-4 h-4" /> TAXIYAA TRAVELS
            </div>
            <div className="col-span-4 sm:col-span-4 text-slate-500">Other Cab Apps</div>
          </div>

          <div className="divide-y divide-[#1e222d]">
            {comparisons.map((row, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, x: -15 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.4, delay: idx * 0.08 }}
                className="grid grid-cols-12 p-4 items-center text-xs font-semibold hover:bg-[#0b0c10]/60 transition-colors"
              >
                <div className="col-span-4 font-extrabold text-white">{row.feature}</div>
                <div className="col-span-4 text-slate-200 font-bold flex items-center gap-1.5">
                  <span className="w-5 h-5 rounded-full bg-[#FAB304]/10 text-[#FAB304] flex items-center justify-center flex-shrink-0">
                    <Check className="w-3.5 h-3.5 stroke-[3]" />
                  </span>
                  <span>{row.taxiyaa}</span>
                </div>
                <div className="col-span-4 text-slate-400 flex items-center gap-1.5">
                  <span className="w-5 h-5 rounded-full bg-rose-500/10 text-rose-400 flex items-center justify-center flex-shrink-0">
                    <X className="w-3.5 h-3.5 stroke-[3]" />
                  </span>
                  <span className="line-through opacity-70">{row.aggregators}</span>
                </div>
              </motion.div>
            ))}
          </div>
        </motion.div>
      </div>
    </section>
  );
}







