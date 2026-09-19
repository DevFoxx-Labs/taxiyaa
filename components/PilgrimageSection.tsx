"use client";

import Link from "next/link";
import { motion } from "framer-motion";
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
      image: "/images/shirdi_temple.jpg",
    },
    {
      title: "Shirdi Sai Baba & Shanisingnapur Tour",
      duration: "1-2 Days Trip",
      description: "Fast smooth journey via Samruddhi Mahamarg Expressway. Includes VIP darshan coordination support and optional Shanisingnapur temple stopover.",
      vehicles: "Swift Dzire / Ertiga / Innova / Minibus",
      badge: "Expressway Route",
      slug: "mumbai-to-shirdi-taxi",
      image: "/images/shirdi_temple.jpg",
    },
    {
      title: "3 Jyotirlinga Roadtrip (Trimbakeshwar, Bhimashankar, Grishneshwar)",
      duration: "3-4 Days Circuit",
      description: "Reverent pilgrimage covering 3 sacred Lord Shiva Jyotirlingas in Maharashtra with experienced senior-citizen-friendly chauffeurs.",
      vehicles: "Innova Crysta / Force Urbania / Maharaja TT",
      badge: "Divine Circuit",
      slug: "mumbai-to-jyotirlinga-circuit",
      image: "/images/fleet/innova_crysta.jpg",
    },
  ];

  return (
    <section className="py-20 bg-[#13151b] border-t border-[#1e222d] relative overflow-hidden">
      {/* Background Glow */}
      <div className="absolute top-1/2 right-1/4 w-80 h-80 bg-[#FAB304]/5 rounded-full blur-3xl pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <motion.div
          initial={{ opacity: 0, y: 25 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6 }}
          className="text-center max-w-3xl mx-auto mb-16 space-y-3"
        >
          <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-[#0b0c10] border border-[#FAB304]/30 text-[#FAB304] text-xs font-black uppercase tracking-wider shadow-lg">
            <Compass className="w-4 h-4 animate-spin-slow" />
            <span>SACRED PILGRIMAGE PACKAGES</span>
          </div>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            TEMPLE TOURS & DEVOTIONAL ROADTRIPS
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Dedicated door-to-door pilgrimage cab & bus packages with courteous chauffeurs trained in temple routes.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {packages.map((pkg, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 35 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: idx * 0.12 }}
              whileHover={{ y: -8 }}
              className="card-nova overflow-hidden flex flex-col justify-between group border border-[#1e222d] transition-all duration-300 hover:border-[#FAB304]/60 hover:shadow-[0_10px_30px_rgba(250,179,4,0.15)]"
            >
              <div className="relative h-48 border-b border-[#1e222d] overflow-hidden">
                <img
                  src={pkg.image}
                  alt={pkg.title}
                  className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 ease-out"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-[#13151b]/40 to-transparent" />
                <span className="absolute top-3 left-3 px-3 py-1 rounded-full bg-[#0b0c10]/90 text-[#FAB304] text-[10px] font-black uppercase border border-[#1e222d] backdrop-blur-md">
                  {pkg.badge}
                </span>
                <span className="absolute bottom-3 right-3 px-3 py-1 rounded-full bg-[#13151b]/90 text-white text-[10px] font-extrabold uppercase backdrop-blur-md">
                  {pkg.duration}
                </span>
              </div>

              <div className="p-6 space-y-4 flex-1 flex flex-col justify-between">
                <div className="space-y-2">
                  <h3 className="text-xl font-black text-white uppercase group-hover:text-[#FAB304] transition-colors">
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
                    className="text-xs font-extrabold text-slate-300 hover:text-[#FAB304] flex items-center gap-1 transition-colors uppercase tracking-wider group/link"
                  >
                    <span>View Itinerary</span>
                    <ArrowRight className="w-3.5 h-3.5 text-[#FAB304] group-hover/link:translate-x-1 transition-transform" />
                  </Link>
                  {onOpenBookingModal && (
                    <motion.button
                      whileTap={{ scale: 0.95 }}
                      onClick={() => onOpenBookingModal(`Pilgrimage Package - ${pkg.title}`)}
                      className="btn-nova-neon px-4 py-2 text-[11px] uppercase font-black tracking-wider flex items-center gap-1"
                    >
                      <span>Book Package</span>
                      <ChevronRight className="w-3.5 h-3.5" />
                    </motion.button>
                  )}
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}







