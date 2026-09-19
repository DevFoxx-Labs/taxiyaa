"use client";

import { ShieldCheck, Award, MapPin, Users, Phone } from "lucide-react";

export default function AboutSection() {
  return (
    <section id="about" className="py-20 bg-[#13151b] border-y border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
          {/* Left Column: Visual Grid / Image Showcase */}
          <div className="lg:col-span-5 space-y-4">
            <div className="relative rounded-2xl overflow-hidden border border-[#1e222d] shadow-2xl">
              <img
                src="https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&w=1000&q=80"
                alt="Taxiyaa Fleet Cab Rental Mumbai"
                className="w-full h-80 object-cover"
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
              <div className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-center space-y-1">
                <span className="text-3xl font-black text-white">10,000+</span>
                <span className="text-[11px] font-bold text-slate-400 uppercase block">Outstation Trips</span>
              </div>
              <div className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-center space-y-1">
                <span className="text-3xl font-black text-[#FAB304]">4.9 ★</span>
                <span className="text-[11px] font-bold text-slate-400 uppercase block">Google Rating</span>
              </div>
            </div>
          </div>

          {/* Right Column: Narrative Content */}
          <div className="lg:col-span-7 space-y-6">
            <div className="space-y-2">
              <span className="text-xs font-black tracking-[0.2em] text-[#FAB304] uppercase">
                ABOUT TAXIYAA TRAVELS
              </span>
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
              <a
                href="tel:+919833867640"
                className="btn-nova-neon px-6 py-3.5 text-xs uppercase font-extrabold flex items-center gap-2"
              >
                <Phone className="w-4 h-4" />
                <span>Call +91 98338 67640</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}




