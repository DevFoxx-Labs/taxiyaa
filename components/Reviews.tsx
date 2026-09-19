"use client";

import { Star, Quote, CheckCircle2 } from "lucide-react";

export default function Reviews() {
  const reviews = [
    {
      name: "Rohan Mehta",
      role: "Corporate Executive",
      location: "Goregaon West, Mumbai",
      rating: 5,
      comment:
        "Booked Taxiyaa for an urgent early morning CSMIA Terminal 2 flight drop. Driver arrived 10 mins before time in a squeaky-clean Dzire. Zero surge stress. 10/10 recommended!",
    },
    {
      name: "Pooja Sharma",
      role: "Family Vacation",
      location: "Andheri West, Mumbai",
      rating: 5,
      comment:
        "We rented a 17-seater Tempo Traveller from Taxiyaa for a 3-day family pilgrimage to Shirdi & Nashik. Extremely comfortable pushback seats and super polite driver.",
    },
    {
      name: "Amitabh Kulkarni",
      role: "Outstation Commuter",
      location: "Bandra, Mumbai",
      rating: 5,
      comment:
        "Regularly use Taxiyaa for Mumbai to Pune expressway drops. Always fixed per-km pricing with no surprise charges. Driver driving style is safe and smooth.",
    },
  ];

  return (
    <section className="py-20 bg-nova-dark relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-[#13151b] border border-[#1e222d]">
            <div className="flex text-amber-400">
              {[...Array(5)].map((_, i) => (
                <Star key={i} className="w-3.5 h-3.5 fill-amber-400 stroke-amber-400" />
              ))}
            </div>
            <span className="text-xs font-black text-white">4.9 / 5 Rating on Google & Justdial</span>
          </div>

          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            WHAT OUR RIDERS SAY
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Over 10,000+ satisfied passengers trust Taxiyaa for local cab rentals, airport drops & outstation journeys.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {reviews.map((rev, idx) => (
            <div key={idx} className="card-nova p-6 flex flex-col justify-between space-y-4 relative group">
              <div className="space-y-4">
                <div className="flex items-center justify-between">
                  <div className="flex text-amber-400">
                    {[...Array(rev.rating)].map((_, i) => (
                      <Star key={i} className="w-4 h-4 fill-amber-400 stroke-amber-400" />
                    ))}
                  </div>
                  <Quote className="w-8 h-8 text-[#1e222d] group-hover:text-[#FAB304]/30 transition-colors" />
                </div>

                <p className="text-xs sm:text-sm text-slate-300 font-medium italic leading-relaxed">
                  "{rev.comment}"
                </p>
              </div>

              <div className="pt-4 border-t border-[#1e222d] flex items-center justify-between">
                <div>
                  <h3 className="text-sm font-black text-white uppercase flex items-center gap-1">
                    {rev.name}
                    <CheckCircle2 className="w-3.5 h-3.5 text-[#FAB304]" />
                  </h3>
                  <span className="text-[11px] text-slate-400 font-semibold block">{rev.role} • {rev.location}</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}




