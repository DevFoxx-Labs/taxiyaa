"use client";

import { useState } from "react";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import FloatingWhatsApp from "@/components/FloatingWhatsApp";
import BookingModal from "@/components/BookingModal";
import { ServiceItem } from "@/data/servicesData";
import { ShieldCheck, CheckCircle2, ChevronRight, Phone, ArrowLeft, HelpCircle } from "lucide-react";

interface ServiceDetailClientProps {
  service: ServiceItem;
}

export default function ServiceDetailClient({ service }: ServiceDetailClientProps) {
  const [isModalOpen, setIsModalOpen] = useState(false);

  return (
    <main className="min-h-screen bg-[#0b0c10] text-slate-100 flex flex-col selection:bg-[#FAB304] selection:text-[#0b0c10]">
      <Navbar onOpenBookingModal={() => setIsModalOpen(true)} />

      {/* Hero Section */}
      <section className="relative py-20 bg-nova-dark border-b border-[#1e222d] overflow-hidden">
        <div className="absolute inset-0 bg-grid-pattern opacity-30 pointer-events-none" />
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="space-y-4">
            <Link
              href="/#services"
              className="inline-flex items-center gap-2 text-xs font-bold text-[#FAB304] hover:underline uppercase tracking-wider"
            >
              <ArrowLeft className="w-4 h-4" /> Back to All Services
            </Link>

            <div className="flex flex-wrap items-center gap-3">
              <span className="px-3.5 py-1 rounded-full bg-[#13151b] border border-[#1e222d] text-[#FAB304] text-xs font-black uppercase">
                {service.badge}
              </span>
              <span className="text-xs font-bold text-slate-400">Taxiyaa Premium Mobility</span>
            </div>

            <h1 className="text-3xl sm:text-5xl lg:text-6xl font-black uppercase text-white tracking-tight leading-tight">
              {service.title}
            </h1>
            <p className="text-base sm:text-xl text-slate-300 max-w-3xl font-medium">
              {service.subtitle}
            </p>

            <div className="pt-4 flex flex-wrap items-center gap-4">
              <button
                onClick={() => setIsModalOpen(true)}
                className="btn-nova-neon px-8 py-4 uppercase text-xs font-extrabold flex items-center gap-2"
              >
                <span>Book This Service</span>
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

      {/* Main Content & Features */}
      <section className="py-16 bg-[#13151b]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12">
            {/* Left Column: Deep Dive */}
            <div className="lg:col-span-8 space-y-10">
              {/* Image Banner */}
              <div className="rounded-2xl overflow-hidden border border-[#1e222d] shadow-2xl h-80 relative">
                <img src={service.heroImage} alt={service.title} className="w-full h-full object-cover" />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-transparent to-transparent" />
              </div>

              {/* Long Description */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase">Overview & Service Standards</h2>
                <p className="text-sm sm:text-base text-slate-300 leading-relaxed font-normal">
                  {service.longDescription}
                </p>
              </div>

              {/* Key Features */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase">Key Highlights & Inclusions</h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {service.keyFeatures.map((feat, idx) => (
                    <div key={idx} className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] flex items-start gap-3">
                      <ShieldCheck className="w-5 h-5 text-[#FAB304] flex-shrink-0 mt-0.5" />
                      <span className="text-xs font-bold text-slate-200">{feat}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Benefits */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase">Why Riders Love This Service</h2>
                <div className="space-y-2">
                  {service.benefits.map((ben, idx) => (
                    <div key={idx} className="flex items-center gap-3 p-3 rounded-lg bg-[#0b0c10]/60 border border-[#1e222d]">
                      <CheckCircle2 className="w-4 h-4 text-[#FAB304] flex-shrink-0" />
                      <span className="text-xs font-semibold text-slate-300">{ben}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Recommended Fleet Table */}
              <div className="space-y-4">
                <h2 className="text-2xl font-black text-white uppercase">Recommended Fleet Options</h2>
                <div className="bg-[#0b0c10] border border-[#1e222d] rounded-2xl overflow-hidden">
                  <div className="grid grid-cols-12 bg-[#13151b] p-3 text-xs font-black uppercase text-slate-300 border-b border-[#1e222d]">
                    <div className="col-span-6">Vehicle Name</div>
                    <div className="col-span-3">Capacity</div>
                    <div className="col-span-3 text-right">Service Status</div>
                  </div>
                  <div className="divide-y divide-[#1e222d]">
                    {service.recommendedVehicles.map((v, idx) => (
                      <div key={idx} className="grid grid-cols-12 p-3.5 text-xs items-center">
                        <div className="col-span-6 font-black text-white">{v.name} <span className="text-[10px] text-slate-400 block font-normal">{v.type}</span></div>
                        <div className="col-span-3 font-semibold text-slate-300">{v.capacity}</div>
                        <div className="col-span-3 text-right font-bold text-[#FAB304]">Available 24/7</div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              {/* FAQs */}
              {service.faqs && service.faqs.length > 0 && (
                <div className="space-y-4 pt-4 border-t border-[#1e222d]">
                  <h2 className="text-2xl font-black text-white uppercase flex items-center gap-2">
                    <HelpCircle className="w-6 h-6 text-[#FAB304]" /> Frequently Asked Questions
                  </h2>
                  <div className="space-y-3">
                    {service.faqs.map((faq, idx) => (
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
                    INSTANT RESERVATION
                  </span>
                  <h3 className="text-xl font-black text-white uppercase">Book {service.badge}</h3>
                  <p className="text-xs text-slate-400 font-medium">
                    Get fixed rates and immediate driver dispatch confirmation.
                  </p>
                </div>

                <div className="p-4 rounded-xl bg-[#0b0c10] border border-[#1e222d] space-y-2">
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span>24/7 Availability</span>
                    <span className="text-[#FAB304]">Active Now</span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span>Surge Fares</span>
                    <span className="text-white font-black">₹0 Surge</span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-bold text-slate-300">
                    <span>Rating</span>
                    <span className="text-amber-400 font-bold">4.9 ★</span>
                  </div>
                </div>

                <button
                  onClick={() => setIsModalOpen(true)}
                  className="btn-nova-neon w-full py-4 uppercase text-xs font-black tracking-wider flex items-center justify-center gap-2"
                >
                  <span>Book {service.title}</span>
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
        defaultService={service.title}
      />
    </main>
  );
}






