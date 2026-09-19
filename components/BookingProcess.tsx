"use client";

import { useRef } from "react";
import { Search, Car, FileCheck, ThumbsUp, ArrowRight } from "lucide-react";
import { motion, useScroll, useTransform } from "framer-motion";

export default function BookingProcess() {
  const containerRef = useRef<HTMLElement>(null);
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start end", "end start"],
  });

  const parallaxGlowY = useTransform(scrollYProgress, [0, 1], [-50, 50]);

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
    <section ref={containerRef} className="py-20 bg-[#0b0c10] border-t border-[#1e222d] relative overflow-hidden">
      {/* Background Animated Accents with Parallax */}
      <motion.div
        style={{ y: parallaxGlowY }}
        className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-[#FAB304]/5 rounded-full blur-[140px] pointer-events-none"
      />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center max-w-2xl mx-auto mb-16 space-y-2">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-xs font-black tracking-[0.2em] text-[#FAB304] uppercase"
          >
            HOW IT WORKS
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 15 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl sm:text-4xl font-black text-white uppercase tracking-tight"
          >
            BOOKING YOUR TAXIYAA CAB IN 4 SIMPLE STEPS
          </motion.h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Fast, hassle-free booking with zero upfront payment friction.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 relative">
          {steps.map((item, idx) => {
            const IconComponent = item.icon;
            return (
              <motion.div
                key={idx}
                initial={{ opacity: 0, y: 30 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.5, delay: idx * 0.12 }}
                whileHover={{ y: -6, transition: { duration: 0.2 } }}
                className="card-nova p-6 relative flex flex-col justify-between group border border-[#1e222d] hover:border-[#FAB304]/60 shadow-xl"
              >
                {/* Step Connector Line for Desktop */}
                {idx < steps.length - 1 && (
                  <div className="hidden lg:block absolute top-12 -right-3 z-20 text-[#FAB304]/40 group-hover:text-[#FAB304] transition-colors">
                    <ArrowRight className="w-5 h-5 animate-pulse" />
                  </div>
                )}

                <div className="space-y-4">
                  <div className="flex items-center justify-between">
                    <div className="w-13 h-13 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#FAB304] flex items-center justify-center font-bold group-hover:scale-110 group-hover:border-[#FAB304]/40 transition-all duration-300 shadow-inner">
                      <IconComponent className="w-6 h-6 stroke-[2.5]" />
                    </div>
                    <span className="text-3xl font-black text-slate-800 font-mono group-hover:text-[#FAB304]/30 transition-colors">
                      {item.step}
                    </span>
                  </div>

                  <h3 className="text-lg font-black text-white uppercase group-hover:text-[#FAB304] transition-colors">
                    {item.title}
                  </h3>
                  <p className="text-xs text-slate-400 font-medium leading-relaxed">
                    {item.description}
                  </p>
                </div>

                <div className="pt-4 mt-4 border-t border-[#1e222d]/60 flex items-center justify-between text-[11px] font-bold text-slate-500 group-hover:text-[#FAB304] transition-colors">
                  <span className="uppercase tracking-wider">Step {item.step}</span>
                  <span className="w-2 h-2 rounded-full bg-[#FAB304] opacity-0 group-hover:opacity-100 transition-opacity" />
                </div>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}







