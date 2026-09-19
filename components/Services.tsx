"use client";

import Link from "next/link";
import { servicesData } from "@/data/servicesData";
import { ChevronRight, ArrowRight, ShieldCheck, Star } from "lucide-react";

interface ServicesProps {
  onOpenBookingModal: (service?: string) => void;
}

export default function Services({ onOpenBookingModal }: ServicesProps) {
  return (
    <section id="services" className="py-20 bg-[#13151b] border-t border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <span className="text-xs font-black tracking-[0.2em] text-[#FAB304] uppercase">
            OUR OFFERINGS
          </span>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            COMPREHENSIVE CAB & TRAVEL SERVICES
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            From local city taxi rentals to intercity outstation cabs, airport drops, and luxury minibuses.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {servicesData.map((service, index) => (
            <div
              key={service.id}
              className={`card-nova overflow-hidden flex flex-col justify-between group ${
                index === 0 ? "border-[#FAB304]/50" : ""
              }`}
            >
              {/* Image & Badge Header */}
              <div className="relative h-48 overflow-hidden border-b border-[#1e222d]">
                <img
                  src={service.heroImage}
                  alt={service.title}
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-[#13151b]/40 to-transparent" />
                <span className="absolute top-3 left-3 px-3 py-1 rounded-full bg-[#0b0c10]/90 backdrop-blur-md text-[#FAB304] text-[10px] font-black uppercase tracking-wider border border-[#1e222d]">
                  {service.badge}
                </span>
              </div>

              {/* Body Content */}
              <div className="p-6 space-y-4 flex-1 flex flex-col justify-between">
                <div className="space-y-2">
                  <h3 className="text-xl font-black text-white uppercase tracking-tight group-hover:text-[#FAB304] transition-colors">
                    {service.title}
                  </h3>
                  <p className="text-xs text-slate-400 font-medium line-clamp-2 leading-relaxed">
                    {service.description}
                  </p>
                </div>

                {/* Key Bullet Highlights */}
                <div className="space-y-1.5 pt-2 border-t border-[#1e222d]/60">
                  {service.keyFeatures.slice(0, 3).map((feat, fIdx) => (
                    <div key={fIdx} className="flex items-center gap-2 text-[11px] font-semibold text-slate-300">
                      <ShieldCheck className="w-3.5 h-3.5 text-[#FAB304] flex-shrink-0" />
                      <span className="truncate">{feat}</span>
                    </div>
                  ))}
                </div>

                {/* Buttons */}
                <div className="pt-4 flex items-center justify-between gap-3 border-t border-[#1e222d]">
                  <Link
                    href={`/services/${service.slug}`}
                    className="text-xs font-extrabold text-slate-300 hover:text-[#FAB304] flex items-center gap-1 transition-colors uppercase tracking-wider"
                  >
                    <span>View Details</span>
                    <ArrowRight className="w-3.5 h-3.5 text-[#FAB304]" />
                  </Link>
                  <button
                    onClick={() => onOpenBookingModal(service.title)}
                    className="btn-nova-neon px-4 py-2 text-[11px] uppercase font-black tracking-wider flex items-center gap-1"
                  >
                    <span>Book Now</span>
                    <ChevronRight className="w-3.5 h-3.5" />
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}







