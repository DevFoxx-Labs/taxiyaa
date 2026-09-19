"use client";

import Link from "next/link";
import { Compass, ShieldCheck, ChevronRight, ArrowRight } from "lucide-react";

interface PilgrimageSectionProps {
  onOpenBookingModal?: (service?: string) => void;
}

export default function PilgrimageSection({ onOpenBookingModal }: PilgrimageSectionProps) {
  const packages = [
    {
      title: "Ashtavinayak 8-Ganesh Temple Yatra",
      duration: "2-3 Days Circuit",
      description: "Complete sacred pilgrimage visiting all 8 Swayambhu Ganesha temples across Maharashtra: Morgaon, Siddhatek, Pali, Mahad, Theur, Lenyadri, Ozar & Ranjangaon.",
      vehicles: "Ertiga SUV / Innova Crysta / Tempo Traveller",
      badge: "Most Popular Pilgrimage",
      slug: "mumbai-to-ashtavinayak-tour",
      image: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80",
    },
    {
      title: "Shirdi Sai Baba & Shanisingnapur Tour",
      duration: "1-2 Days Trip",
      description: "Fast smooth journey via Samruddhi Mahamarg Expressway. Includes VIP darshan coordination support and optional Shanisingnapur temple stopover.",
      vehicles: "Swift Dzire / Ertiga / Innova / Minibus",
      badge: "Expressway Route",
      slug: "mumbai-to-shirdi-taxi",
      image: "https://images.unsplash.com/photo-1540339832862-47459980783b?auto=format&fit=crop&w=800&q=80",
    },
    {
      title: "3 Jyotirlinga Roadtrip (Trimbakeshwar, Bhimashankar, Grishneshwar)",
      duration: "3-4 Days Circuit",
      description: "Reverent pilgrimage covering 3 sacred Lord Shiva Jyotirlingas in Maharashtra with experienced senior-citizen-friendly chauffeurs.",
      vehicles: "Innova Crysta / Force Urbania / Maharaja TT",
      badge: "Divine Circuit",
      slug: "mumbai-to-jyotirlinga-circuit",
      image: "https://images.unsplash.com/photo-1511795409834-ef04bbd61622?auto=format&fit=crop&w=800&q=80",
    },
  ];

  return (
    <section className="py-20 bg-[#13151b] border-t border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-[#0b0c10] border border-[#1e222d] text-[#b5f63d] text-xs font-black uppercase">
            <Compass className="w-4 h-4" /> SACRED PILGRIMAGE PACKAGES
          </div>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            TEMPLE TOURS & DEVOTIONAL ROADTRIPS
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Dedicated door-to-door pilgrimage cab & bus packages with courteous chauffeurs trained in temple routes.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {packages.map((pkg, idx) => (
            <div key={idx} className="card-nova overflow-hidden flex flex-col justify-between group border border-[#1e222d]">
              <div className="relative h-48 border-b border-[#1e222d]">
                <img src={pkg.image} alt={pkg.title} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-[#13151b]/40 to-transparent" />
                <span className="absolute top-3 left-3 px-3 py-1 rounded-full bg-[#0b0c10]/90 text-[#b5f63d] text-[10px] font-black uppercase border border-[#1e222d]">
                  {pkg.badge}
                </span>
                <span className="absolute bottom-3 right-3 px-3 py-1 rounded-full bg-[#13151b]/90 text-white text-[10px] font-extrabold uppercase">
                  {pkg.duration}
                </span>
              </div>

              <div className="p-6 space-y-4 flex-1 flex flex-col justify-between">
                <div className="space-y-2">
                  <h3 className="text-xl font-black text-white uppercase group-hover:text-[#b5f63d] transition-colors">
                    {pkg.title}
                  </h3>
                  <p className="text-xs text-slate-400 font-medium leading-relaxed">
                    {pkg.description}
                  </p>
                </div>

                <div className="p-3 rounded-xl bg-[#0b0c10] border border-[#1e222d]">
                  <span className="text-[10px] text-slate-500 uppercase font-extrabold block">Recommended Fleet</span>
                  <span className="text-xs font-bold text-slate-200">{pkg.vehicles}</span>
                </div>

                <div className="pt-4 flex items-center justify-between gap-3 border-t border-[#1e222d]">
                  <Link
                    href={`/routes/${pkg.slug}`}
                    className="text-xs font-extrabold text-slate-300 hover:text-[#b5f63d] flex items-center gap-1 transition-colors uppercase tracking-wider"
                  >
                    <span>View Itinerary</span>
                    <ArrowRight className="w-3.5 h-3.5 text-[#b5f63d]" />
                  </Link>
                  {onOpenBookingModal && (
                    <button
                      onClick={() => onOpenBookingModal(`Pilgrimage Package - ${pkg.title}`)}
                      className="btn-nova-neon px-4 py-2 text-[11px] uppercase font-black tracking-wider flex items-center gap-1"
                    >
                      <span>Book Package</span>
                      <ChevronRight className="w-3.5 h-3.5" />
                    </button>
                  )}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
