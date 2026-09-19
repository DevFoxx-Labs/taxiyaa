"use client";

import { MapPin, Phone, Mail, Clock, ShieldCheck, MessageSquare } from "lucide-react";

export default function ContactLocations() {
  return (
    <section id="contact" className="py-20 bg-[#13151b] border-t border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <span className="text-xs font-black tracking-[0.2em] text-[#b5f63d] uppercase">
            REACH US 24/7
          </span>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            CONTACT TAXIYAA DISPATCH & RESERVATIONS
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Have questions or need an emergency cab booking? Our hotline & WhatsApp desk is active 24/7.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
          {/* Contact Details Cards */}
          <div className="lg:col-span-5 space-y-4">
            <div className="card-nova p-6 space-y-3">
              <div className="w-10 h-10 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#b5f63d] flex items-center justify-center font-bold">
                <MapPin className="w-5 h-5" />
              </div>
              <h3 className="text-lg font-black text-white uppercase">Main Office Location</h3>
              <p className="text-xs text-slate-300 font-medium leading-relaxed">
                Kaveri Mahima Soc, Maharaja Agrasen Marg, Bangur Nagar, Goregaon West, Mumbai, Maharashtra 400104.
              </p>
            </div>

            <div className="card-nova p-6 space-y-3">
              <div className="w-10 h-10 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#b5f63d] flex items-center justify-center font-bold">
                <Phone className="w-5 h-5" />
              </div>
              <h3 className="text-lg font-black text-white uppercase">24/7 Booking Hotline</h3>
              <p className="text-xs text-slate-300 font-medium">Call for instant cab dispatch & outstation quotes.</p>
              <a href="tel:+919833867640" className="text-xl font-black text-[#b5f63d] block hover:underline">
                +91 98338 67640
              </a>
            </div>

            <div className="card-nova p-6 space-y-3">
              <div className="w-10 h-10 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-[#b5f63d] flex items-center justify-center font-bold">
                <Mail className="w-5 h-5" />
              </div>
              <h3 className="text-lg font-black text-white uppercase">Email & WhatsApp Desk</h3>
              <p className="text-xs text-slate-300 font-medium">
                Email: <span className="text-white font-bold">support@taxiyaa.com</span>
              </p>
              <div className="pt-2">
                <a
                  href="https://wa.me/919833867640?text=Hello%20Taxiyaa%20I%20have%20an%20enquiry"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="btn-nova-neon inline-flex items-center gap-2 px-5 py-2.5 text-xs uppercase font-extrabold"
                >
                  <MessageSquare className="w-4 h-4 fill-[#0b0c10]" />
                  <span>Chat on WhatsApp</span>
                </a>
              </div>
            </div>
          </div>

          {/* Location Map Placeholder / Coverage Box */}
          <div className="lg:col-span-7 card-nova p-6 space-y-6">
            <div className="space-y-2">
              <span className="text-xs font-black text-[#b5f63d] uppercase tracking-wider block">
                SERVICE COVERAGE AREA
              </span>
              <h3 className="text-2xl font-black text-white uppercase">
                SERVING ALL MUMBAI & SUBURBAN REGIONS
              </h3>
              <p className="text-xs text-slate-400 font-medium leading-relaxed">
                24/7 doorstep pickup available across Goregaon West, Goregaon East, Andheri West, Andheri East, Malad, Kandivali, Borivali, Bandra, Juhu, BKC, Powai, Thane, Navi Mumbai, and CSMIA Terminals 1 & 2.
              </p>
            </div>

            <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 pt-2">
              {[
                "Goregaon West & East",
                "Andheri West & East",
                "Bandra & BKC Complex",
                "Malad & Kandivali",
                "Borivali & Dahisar",
                "Powai & Kanjurmarg",
                "CSMIA Airport T1 & T2",
                "Thane & Mulund",
                "Navi Mumbai & Vashi",
              ].map((loc, i) => (
                <div key={i} className="p-3 rounded-xl bg-[#0b0c10] border border-[#1e222d] text-center">
                  <span className="text-xs font-extrabold text-slate-200 block">{loc}</span>
                </div>
              ))}
            </div>

            <div className="p-4 rounded-xl bg-[#0b0c10] border border-[#b5f63d]/30 flex items-center gap-3">
              <Clock className="w-6 h-6 text-[#b5f63d] flex-shrink-0" />
              <div>
                <span className="text-xs font-black text-white uppercase block">OPERATING HOURS</span>
                <span className="text-xs text-slate-300 font-semibold">24 Hours a Day, 365 Days a Year (Zero Holiday Downtime)</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
