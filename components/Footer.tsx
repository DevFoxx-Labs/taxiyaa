"use client";

import Link from "next/link";
import { Phone, Mail, MapPin } from "lucide-react";
import { servicesData } from "@/data/servicesData";

export default function Footer() {
  return (
    <footer className="bg-[#0b0c10] border-t border-[#1e222d] text-slate-400 pt-16 pb-12">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-12 gap-10 pb-12 border-b border-[#1e222d]">
          {/* Brand Info */}
          <div className="lg:col-span-4 space-y-4">
            <Link href="/" className="inline-block">
              <img
                src="/taxyiaa-logo-light.webp"
                alt="Taxiyaa Travels Logo"
                className="h-12 w-auto object-contain"
              />
            </Link>

            <p className="text-xs text-slate-400 font-normal leading-relaxed">
              Taxiyaa is Mumbai's premier 24/7 cab rental and outstation taxi service based in Goregaon West. Providing fixed transparent fares, sanitized sedans & SUVs, CSMIA airport transfers, Force Urbania luxury vans, and Tempo Travellers.
            </p>

            <div className="space-y-2 text-xs font-semibold text-slate-300">
              <div className="flex items-center gap-2">
                <MapPin className="w-4 h-4 text-[#FAB304] flex-shrink-0" />
                <span>Kaveri Mahima Soc, Bangur Nagar, Goregaon West, Mumbai 400104</span>
              </div>
              <div className="flex items-center gap-2">
                <Phone className="w-4 h-4 text-[#FAB304] flex-shrink-0" />
                <a href="tel:+919833867640" className="hover:text-white font-bold">+91 98338 67640</a>
              </div>
              <div className="flex items-center gap-2">
                <Mail className="w-4 h-4 text-[#FAB304] flex-shrink-0" />
                <span>support@taxiyaa.com</span>
              </div>
            </div>
          </div>

          {/* Quick Links */}
          <div className="lg:col-span-2 space-y-4">
            <h3 className="text-xs font-black text-white uppercase tracking-widest">Quick Navigation</h3>
            <ul className="space-y-2.5 text-xs font-semibold">
              <li><Link href="/" className="hover:text-[#FAB304] transition-colors">Home</Link></li>
              <li><a href="#services" className="hover:text-[#FAB304] transition-colors">Services Catalog</a></li>
              <li><a href="#fleet" className="hover:text-[#FAB304] transition-colors">Sanitized Fleet</a></li>
              <li><a href="#routes" className="hover:text-[#FAB304] transition-colors">Outstation Routes</a></li>
              <li><a href="#faqs" className="hover:text-[#FAB304] transition-colors">FAQs & Rules</a></li>
              <li><a href="#about" className="hover:text-[#FAB304] transition-colors">About Us</a></li>
              <li><a href="#contact" className="hover:text-[#FAB304] transition-colors">Contact</a></li>
            </ul>
          </div>

          {/* Service Links */}
          <div className="lg:col-span-3 space-y-4">
            <h3 className="text-xs font-black text-white uppercase tracking-widest">Our Services</h3>
            <ul className="space-y-2 text-xs font-semibold">
              {servicesData.slice(0, 7).map((s) => (
                <li key={s.id}>
                  <Link href={`/services/${s.slug}`} className="hover:text-[#FAB304] transition-colors flex items-center gap-1">
                    <span className="text-[#FAB304] font-bold">•</span>
                    <span className="truncate">{s.title}</span>
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Popular Outstation Routes */}
          <div className="lg:col-span-3 space-y-4">
            <h3 className="text-xs font-black text-white uppercase tracking-widest">Outstation Taxi Drops</h3>
            <ul className="space-y-2 text-xs font-semibold">
              <li><Link href="/routes/mumbai-to-pune-cab" className="hover:text-[#FAB304] transition-colors">Mumbai to Pune Taxi Cab</Link></li>
              <li><Link href="/routes/mumbai-to-lonavala-cab" className="hover:text-[#FAB304] transition-colors">Mumbai to Lonavala Cab Service</Link></li>
              <li><Link href="/routes/mumbai-to-nashik-taxi" className="hover:text-[#FAB304] transition-colors">Mumbai to Nashik Outstation Cab</Link></li>
              <li><Link href="/routes/mumbai-to-shirdi-taxi" className="hover:text-[#FAB304] transition-colors">Mumbai to Shirdi Taxi Service</Link></li>
              <li><Link href="/routes/mumbai-to-goa-outstation" className="hover:text-[#FAB304] transition-colors">Mumbai to Goa Outstation Cab</Link></li>
              <li><Link href="/routes/mumbai-to-ashtavinayak-tour" className="hover:text-[#FAB304] transition-colors">Ashtavinayak Pilgrimage Yatra</Link></li>
            </ul>
          </div>
        </div>

        {/* Copyright Bar */}
        <div className="pt-8 flex flex-col sm:flex-row items-center justify-between text-xs font-semibold text-slate-500 gap-4">
          <p>© {new Date().getFullYear()} Taxiyaa Travels. All rights reserved.</p>
          <div className="flex items-center gap-1 text-slate-400">
            <span>Designed for 24/7 Premium Mobility & Outstation Cab Travel in Mumbai</span>
          </div>
        </div>
      </div>
    </footer>
  );
}




