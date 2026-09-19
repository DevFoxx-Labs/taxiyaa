"use client";

import { useState } from "react";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import FloatingWhatsApp from "@/components/FloatingWhatsApp";
import BookingModal from "@/components/BookingModal";
import { RouteItem } from "@/data/routesData";
import { MapPin, Clock, ShieldCheck, ChevronRight, Phone, ArrowLeft, Car, HelpCircle, Compass } from "lucide-react";

interface RouteDetailClientProps {
  routeItem: RouteItem;
}

export default function RouteDetailClient({ routeItem }: RouteDetailClientProps) {
  const [isModalOpen, setIsModalOpen] = useState(false);

  return (
    <main className="min-h-screen bg-[#0b0c10] text-slate-100 flex flex-col selection:bg-[#FAB304] selection:text-[#0b0c10]">
      <Navbar onOpenBookingModal={() => setIsModalOpen(true)} />

      {/* Hero Header */}
      <section className="relative py-20 bg-nova-dark border-b border-[#1e222d] overflow-hidden">
        <div className="absolute inset-0 bg-grid-pattern opacity-30 pointer-events-none" />
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="space-y-4">
            <Link
              href="/#routes"
              className="inline-flex items-center gap-2 text-xs font-bold text-[#FAB304] hover:underline uppercase tracking-wider"
            >
              <ArrowLeft className="w-4 h-4" /> Back to All Routes
            </Link>

            <div className="flex flex-wrap items-center gap-3">
              <span className="px-3.5 py-1 rounded-full bg-[#13151b] border border-[#1e222d] text-[#FAB304] text-xs font-black uppercase">
                {routeItem.category} Circuit
              </span>
              <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
                <Clock className="w-3.5 h-3.5 text-[#FAB304]" /> {routeItem.duration}
              </span>
              <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
                <MapPin className="w-3.5 h-3.5 text-[#FAB304]" /> {routeItem.distance}
              </span>
            </div>

            <h1 className="text-3xl sm:text-5xl lg:text-6xl font-black uppercase text-white tracking-tight leading-tight">
              {routeItem.title}
            </h1>

            <div className="pt-4 flex flex-wrap items-center gap-4">
              <button
                onClick={() => setIsModalOpen(true)}
                className="btn-nova-neon px-8 py-4 uppercase text-xs font-extrabold flex items-center gap-2"
              >
                <span>Book This Route</span>
                <ChevronRight className="w-4 h-4 stroke-[3]" />
              </button>
              <a
                href="tel:+916392767985"
                className="px-6 py-4 rounded-lg border border-[#1e222d] bg-[#13151b] text-slate-200 text-xs font-bold uppercase hover:border-[#FAB304] transition-colors flex items-center gap-2"
              >
                <Phone className="w-4 h-4 text-[#FAB304]" />
                <span>Call Hotline</span>
              </a>
            </div>
          </div>
        </div>
      </section>

      {/* Main Details */}
      <section className="py-16 bg-[#13151b]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12">
            {/* Left Column: Route Deep Dive */}
            <div className="lg:col-span-8 space-y-10">
              {/* Image Banner */}
              <div className="rounded-2xl overflow-hidden border border-[#1e222d] shadow-2xl h-80 relative">
                <img
                  src={routeItem.heroImage}
                  alt={routeItem.title}
                  width={800}
                  height={320}
                  loading="lazy"
                  decoding="async"
                  className="w-full h-full object-cover"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-transparent to-transparent" />
              </div>

              {/* Description */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase">Route Overview & Highway Guide</h2>
                <p className="text-sm sm:text-base text-slate-300 leading-relaxed font-normal">
                  {routeItem.description}
                </p>
              </div>

              {/* Highlights */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase">Trip Highlights & Advantages</h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {routeItem.highlights.map((h, idx) => (
                    <div key={idx} className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] flex items-start gap-3">
                      <ShieldCheck className="w-5 h-5 text-[#FAB304] flex-shrink-0 mt-0.5" />
                      <span className="text-xs font-bold text-slate-200">{h}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Key Attractions */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase flex items-center gap-2">
                  <Compass className="w-6 h-6 text-[#FAB304]" /> Key Sightseeing & Stopovers
                </h2>
                <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                  {routeItem.keyAttractions.map((spot, idx) => (
                    <div key={idx} className="p-3 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-center">
                      <span className="text-xs font-bold text-slate-200">{spot}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Vehicle Options & Fare Rates */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase flex items-center gap-2">
                  <Car className="w-6 h-6 text-[#FAB304]" /> Recommended Fleet Options
                </h2>
                <div className="bg-[#0b0c10] border border-[#1e222d] rounded-2xl overflow-hidden">
                  <div className="grid grid-cols-12 bg-[#13151b] p-3 text-xs font-black uppercase text-slate-300 border-b border-[#1e222d]">
                    <div className="col-span-6">Vehicle Name</div>
                    <div className="col-span-3">Seating Type</div>
                    <div className="col-span-3 text-right">Dispatch Status</div>
                  </div>
                  <div className="divide-y divide-[#1e222d]">
                    {routeItem.recommendedFleet.map((f, idx) => (
                      <div key={idx} className="grid grid-cols-12 p-3.5 text-xs items-center">
                        <div className="col-span-6 font-black text-white">{f.vehicle}</div>
                        <div className="col-span-3 font-semibold text-slate-300">{f.type}</div>
                        <div className="col-span-3 text-right font-bold text-[#FAB304]">Ready for Dispatch</div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              {/* FAQs */}
              {routeItem.faqs && routeItem.faqs.length > 0 && (
                <div className="space-y-4 pt-4 border-t border-[#1e222d]">
                  <h2 className="text-2xl font-black text-white uppercase flex items-center gap-2">
                    <HelpCircle className="w-6 h-6 text-[#FAB304]" /> Route FAQs
                  </h2>
                  <div className="space-y-3">
                    {routeItem.faqs.map((faq, idx) => (
                      <div key={idx} className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] space-y-1.5">
                        <h3 className="text-sm font-black text-white">{faq.question}</h3>
                        <p className="text-xs text-slate-400 font-medium leading-relaxed">{faq.answer}</p>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>

            {/* Right Column: Quick Booking Card Sidebar */}
            <div className="lg:col-span-4 space-y-6">
              <div className="card-nova p-6 space-y-6 sticky top-28">
                <div className="space-y-2">
                  <span className="text-[10px] font-black tracking-widest text-[#FAB304] uppercase">
                    INSTANT ROUTE BOOKING
                  </span>
                  <h3 className="text-xl font-black text-white uppercase">{routeItem.from} ➔ {routeItem.to}</h3>
                  <p className="text-xs text-slate-400 font-medium">
                    Pre-book your intercity cab with zero surge fees & instant WhatsApp dispatch confirmation.
                  </p>
                </div>

                <div className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] space-y-2">
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span>Starting Fare</span>
                    <span className="text-[#FAB304] font-black text-sm">{routeItem.startingFare}</span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span>Est. Distance</span>
                    <span className="text-white font-bold">{routeItem.distance}</span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span>Est. Travel Time</span>
                    <span className="text-white font-bold">{routeItem.duration}</span>
                  </div>
                </div>

                <button
                  onClick={() => setIsModalOpen(true)}
                  className="btn-nova-neon w-full py-4 uppercase text-xs font-black tracking-wider flex items-center justify-center gap-2"
                >
                  <span>Book {routeItem.title}</span>
                  <ChevronRight className="w-4 h-4 stroke-[3]" />
                </button>

                <div className="pt-2 text-center">
                  <a
                    href="tel:+916392767985"
                    className="text-xs font-bold text-slate-300 hover:text-[#FAB304] flex items-center justify-center gap-1.5"
                  >
                    <Phone className="w-3.5 h-3.5 text-[#FAB304]" />
                    <span>Call Hotline: +91 88085 27577</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <Footer />
      <FloatingWhatsApp onOpenBookingModal={() => setIsModalOpen(true)} />

      <BookingModal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        defaultService={`Outstation - ${routeItem.title}`}
      />
    </main>
  );
}






