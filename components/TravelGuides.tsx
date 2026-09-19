"use client";

import Link from "next/link";
import { BookOpen, ArrowRight, Calendar, User } from "lucide-react";

export default function TravelGuides() {
  const articles = [
    {
      title: "Complete Ashtavinayak Yatra Route Map & Travel Tips from Mumbai",
      category: "Pilgrimage Guide",
      date: "September 2026",
      author: "Taxiyaa Editorial",
      snippet: "Planning the 8-Ganesh Temple pilgrimage circuit? Learn the ideal sequence, recommended 2-day vs 3-day itinerary, and vehicle choices for families.",
      link: "/routes/mumbai-to-ashtavinayak-tour",
      image: "/images/shirdi_temple.jpg",
    },
    {
      title: "Mumbai to Pune Expressway Cab Fares & Toll Guide",
      category: "Outstation Travel",
      date: "September 2026",
      author: "Taxiyaa Editorial",
      snippet: "Everything you need to know about one-way cab drops from Mumbai to Hinjewadi, Baner, and Pune city. Fixed fare calculations vs toll booth rules.",
      link: "/routes/mumbai-to-pune-cab",
      image: "/images/fleet/swift_dzire.jpg",
    },
    {
      title: "Force Urbania vs Maharaja Tempo Traveller: Which Luxury Van to Rent?",
      category: "Fleet Comparison",
      date: "September 2026",
      author: "Taxiyaa Editorial",
      snippet: "Detailed comparison between monocoque Force Urbania vans and 1x1 Maharaja VIP recliners for destination weddings and corporate travel.",
      link: "/services/maharaja-tempo-traveller-force-urbania",
      image: "/images/fleet/maharaja_traveller.jpg",
    },
    {
      title: "CSMIA Mumbai Airport Pickup Guide (Terminal 1 & Terminal 2)",
      category: "Airport Guide",
      date: "September 2026",
      author: "Taxiyaa Editorial",
      snippet: "Avoid long taxi queues and surge pricing at Mumbai Airport. Tips for real-time flight tracking, driver meet & greet, and baggage loading.",
      link: "/services/airport-rental-car-transfer",
      image: "/images/services/service_airport.jpg",
    },
  ];

  return (
    <section className="py-20 bg-[#13151b] border-t border-[#1e222d] relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-[#0b0c10] border border-[#1e222d] text-[#FAB304] text-xs font-black uppercase">
            <BookOpen className="w-4 h-4" /> TRAVEL GUIDES & ARTICLES
          </div>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            EXPERT ROADTRIP & CAB GUIDES
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Useful articles, route maps, and vehicle guides to help plan your journey.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {articles.map((art, idx) => (
            <div key={idx} className="card-nova overflow-hidden flex flex-col justify-between group border border-[#1e222d]">
              <div className="relative h-44 border-b border-[#1e222d]">
                <img src={art.image} alt={art.title} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                <div className="absolute inset-0 bg-gradient-to-t from-[#13151b] via-[#13151b]/40 to-transparent" />
                <span className="absolute top-3 left-3 px-3 py-1 rounded-full bg-[#0b0c10]/90 text-[#FAB304] text-[10px] font-black uppercase border border-[#1e222d]">
                  {art.category}
                </span>
              </div>

              <div className="p-5 space-y-3 flex-1 flex flex-col justify-between">
                <div className="space-y-2">
                  <div className="flex items-center gap-2 text-[10px] text-slate-400 font-bold uppercase">
                    <span className="flex items-center gap-1"><Calendar className="w-3 h-3 text-[#FAB304]" /> {art.date}</span>
                    <span>•</span>
                    <span className="flex items-center gap-1"><User className="w-3 h-3 text-[#FAB304]" /> {art.author}</span>
                  </div>
                  <h3 className="text-sm font-black text-white uppercase line-clamp-2 group-hover:text-[#FAB304] transition-colors">
                    {art.title}
                  </h3>
                  <p className="text-xs text-slate-400 font-medium line-clamp-3 leading-relaxed">
                    {art.snippet}
                  </p>
                </div>

                <div className="pt-3 border-t border-[#1e222d]">
                  <Link
                    href={art.link}
                    className="text-xs font-extrabold text-slate-300 hover:text-[#FAB304] flex items-center justify-between transition-colors uppercase tracking-wider"
                  >
                    <span>Read Guide</span>
                    <ArrowRight className="w-3.5 h-3.5 text-[#FAB304]" />
                  </Link>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}







