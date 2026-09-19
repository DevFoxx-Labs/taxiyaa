"use client";

import { Zap, ShieldCheck, DollarSign, Award, Sparkles } from "lucide-react";
import { motion } from "framer-motion";

export default function FeatureHighlights() {
  const features = [
    {
      icon: Zap,
      title: "Instant Confirmation",
      description: "Quick 2-minute booking via phone or WhatsApp with instant chauffeur assignment.",
      tag: "2 MIN DISPATCH",
    },
    {
      icon: DollarSign,
      title: "Transparent Fixed Rates",
      description: "No surge pricing during peak hours or rainy days. What you see is what you pay.",
      tag: "ZERO SURGE",
    },
    {
      icon: ShieldCheck,
      title: "Sanitized & Clean Fleet",
      description: "Regularly deep-cleaned sedan, SUV, and minibus fleet with dual air conditioning.",
      tag: "100% SANITIZED",
    },
    {
      icon: Award,
      title: "Verified Highway Drivers",
      description: "Polite, licensed, background-checked chauffeurs with extensive long-distance route experience.",
      tag: "TOP RATED",
    },
  ];

  return (
    <section className="py-16 bg-[#0b0c10] relative overflow-hidden">
      {/* Background Animated Glows */}
      <div className="absolute top-1/2 left-1/4 -translate-y-1/2 w-96 h-96 bg-[#FAB304]/5 rounded-full blur-[120px] pointer-events-none" />
      <div className="absolute top-1/2 right-1/4 -translate-y-1/2 w-96 h-96 bg-[#FAB304]/5 rounded-full blur-[120px] pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {features.map((item, index) => {
            const IconComponent = item.icon;
            return (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 25 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.5, delay: index * 0.1 }}
                whileHover={{ y: -6, transition: { duration: 0.2 } }}
                className="card-nova p-6 flex flex-col justify-between group relative overflow-hidden border border-[#1e222d] hover:border-[#FAB304]/60 shadow-xl"
              >
                {/* Decorative Glowing Accent Bar */}
                <div className="absolute top-0 left-0 right-0 h-1 bg-gradient-to-r from-transparent via-[#FAB304]/50 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />

                <div className="space-y-4 relative z-10">
                  <div className="flex items-center justify-between">
                    <div className="w-12 h-12 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#FAB304] flex items-center justify-center group-hover:scale-110 group-hover:border-[#FAB304]/40 transition-all duration-300 shadow-inner">
                      <IconComponent className="w-6 h-6 stroke-[2.5]" />
                    </div>
                    <span className="text-[10px] font-black uppercase tracking-wider px-2.5 py-1 rounded-full bg-[#FAB304]/10 text-[#FAB304] border border-[#FAB304]/20">
                      {item.tag}
                    </span>
                  </div>

                  <h3 className="text-lg font-black text-white uppercase tracking-tight group-hover:text-[#FAB304] transition-colors">
                    {item.title}
                  </h3>
                  <p className="text-xs text-slate-400 font-medium leading-relaxed">
                    {item.description}
                  </p>
                </div>

                <div className="pt-4 mt-4 border-t border-[#1e222d]/60 flex items-center gap-1.5 text-[11px] font-bold text-[#FAB304]">
                  <Sparkles className="w-3.5 h-3.5 animate-pulse" />
                  <span className="uppercase tracking-wider">Taxiyaa Guarantee</span>
                </div>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}







