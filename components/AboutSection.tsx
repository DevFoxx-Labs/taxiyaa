"use client";

import { useRef } from "react";
import { motion, useScroll, useTransform } from "framer-motion";
import { ShieldCheck, MapPin, Phone, Info } from "lucide-react";

export default function AboutSection() {
  const sectionRef = useRef<HTMLElement>(null);
  const { scrollYProgress } = useScroll({
    target: sectionRef,
    offset: ["start end", "end start"],
  });

  const parallaxImageY = useTransform(scrollYProgress, [0, 1], [-40, 40]);
  const parallaxGlowY = useTransform(scrollYProgress, [0, 1], [60, -60]);

  return (
    <section ref={sectionRef} id="about" className="py-20 bg-[#13151b] border-y border-[#1e222d] relative overflow-hidden">
      {/* Background Glow with Parallax */}
      <motion.div
        style={{ y: parallaxGlowY }}
        className="absolute top-1/2 left-0 w-96 h-96 bg-[#FAB304]/5 rounded-full blur-3xl pointer-events-none"
      />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
          {/* Left Column: Visual Grid / Image Showcase with Parallax */}
          <motion.div
            style={{ y: parallaxImageY }}
            initial={{ opacity: 0, x: -30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6 }}
            className="lg:col-span-5 space-y-4"
          >
            <div className="relative rounded-2xl overflow-hidden border border-[#1e222d] shadow-2xl group">
              <img
                src="/images/services/service_car_rental.jpg"
                alt="Taxiyaa Fleet Cab Rental Mumbai"
                className="w-full h-80 object-cover group-hover:scale-105 transition-transform duration-700"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-[#0b0c10] via-transparent to-transparent"></div>
              <div className="absolute bottom-4 left-4 right-4 p-4 rounded-xl bg-[#0b0c10]/90 backdrop-blur-md border border-[#1e222d] flex items-center justify-between">
                <div>
                  <span className="text-xs font-black text-[#FAB304] uppercase tracking-wider block">HEADQUARTERS</span>
                  <span className="text-sm font-bold text-white">Goregaon West & Mumbai Suburbs</span>
                </div>
                <div className="w-10 h-10 rounded-lg bg-[#FAB304]/10 text-[#FAB304] flex items-center justify-center font-bold">
                  <MapPin className="w-5 h-5" />
                </div>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <motion.div
                whileHover={{ scale: 1.02 }}
                className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-center space-y-1"
              >
                <span className="text-3xl font-black text-white">10,000+</span>
                <span className="text-[11px] font-bold text-slate-400 uppercase block">Outstation Trips</span>
              </motion.div>
              <motion.div
                whileHover={{ scale: 1.02 }}
                className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-center space-y-1"
              >
                <span className="text-3xl font-black text-[#FAB304]">4.9 ★</span>
                <span className="text-[11px] font-bold text-slate-400 uppercase block">Google Rating</span>
              </motion.div>
            </div>
          </motion.div>

          {/* Right Column: Narrative Content */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6 }}
            className="lg:col-span-7 space-y-6"
          >
            <div className="space-y-2">
              <div className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-[#0b0c10] border border-[#FAB304]/30 text-[#FAB304] text-xs font-black uppercase tracking-wider shadow-lg">
                <Info className="w-3.5 h-3.5" />
                <span>ABOUT TAXIYAA TRAVELS</span>
              </div>
              <h2 className="text-3xl sm:text-4xl font-black text-white uppercase tracking-tight leading-snug">
                REDEFINING PREMIUM & RELIABLE CAB TRAVEL IN MUMBAI
              </h2>
            </div>

            <p className="text-sm sm:text-base text-slate-300 font-normal leading-relaxed">
              Taxiyaa is a premier travel mobility service operating out of Goregaon West, Mumbai. Built on principles of transparency, safety, and guaranteed customer satisfaction, Taxiyaa offers comprehensive car rentals, long-distance outstation taxis, 24/7 CSMIA airport transfers, and group minibus hiring.
            </p>

            <p className="text-xs sm:text-sm text-slate-400 font-normal leading-relaxed">
              Unlike ride-hailing apps with unpredictable cancellations and surge fares, Taxiyaa provides fixed-rate pre-booked cars with background-verified chauffeurs. Whether you are traveling for a business meeting in BKC, an early morning flight from Terminal 2, or a weekend family vacation to Pune, Lonavala, or Goa, Taxiyaa promises top-grade comfort.
            </p>

            {/* Checkpoints */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-2">
              {[
                "24/7 Dispatch Desk & Emergency Hotline",
                "Sanitized Sedans, Ertigas & Innova Crystas",
                "Transparent KM & Hourly Rates (No Hidden Taxes)",
                "Intercity Permits for Maharashtra & Goa Travel",
              ].map((item, idx) => (
                <div key={idx} className="flex items-center gap-2 text-xs font-bold text-slate-200">
                  <ShieldCheck className="w-4 h-4 text-[#FAB304] flex-shrink-0" />
                  <span>{item}</span>
                </div>
              ))}
            </div>

            {/* CTA */}
            <div className="pt-4 flex items-center gap-4">
              <motion.a
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
                href="tel:+916392767985"
                className="btn-nova-neon px-6 py-3.5 text-xs uppercase font-extrabold flex items-center gap-2"
              >
                <Phone className="w-4 h-4" />
                <span>Call +91 88085 27577</span>
              </motion.a>
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  );
}







