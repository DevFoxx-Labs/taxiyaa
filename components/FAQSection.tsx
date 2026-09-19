"use client";

import { useState } from "react";
import { HelpCircle, ChevronDown, ShieldCheck } from "lucide-react";

export default function FAQSection() {
  const [openIndex, setOpenIndex] = useState<number | null>(0);

  const faqs = [
    {
      category: "Pricing & Fares",
      question: "What are the rental rates for Taxiyaa vehicles?",
      answer:
        "Taxiyaa rates start at ₹12/km for economy sedans (Swift Dzire/Etios), ₹15/km for family SUVs (Ertiga), ₹18/km for Innova Crysta, ₹20-₹25/km for Tempo Travellers, ₹28/km for Force Urbania VIP vans, ₹35-₹55/km for luxury cars (Mercedes/BMW/Fortuner), and ₹30-₹45/km for executive buses. All rates feature zero surge pricing.",
    },
    {
      category: "Vehicle Amenities",
      question: "What is the difference between regular and Maharaja Tempo Travellers?",
      answer:
        "Regular Tempo Travellers feature 2x2 pushback seating. Maharaja Tempo Travellers feature exclusive 1x1 extra-wide VIP recliners with legrests, ambient LED lighting, Smart TV, individual AC vents, and onboard charging ports for maximum luxury.",
    },
    {
      category: "Buses & Facilities",
      question: "Do you offer luxury buses equipped with onboard washroom facilities?",
      answer:
        "Yes! Taxiyaa provides 35 to 45-seater luxury tourist buses equipped with clean, sanitized onboard washroom/restroom facilities, ideal for long-distance family pilgrimage tours and overnight interstate roadtrips.",
    },
    {
      category: "Airport Transfers",
      question: "How do CSMIA Mumbai Airport pickups work?",
      answer:
        "Our dispatch team tracks your flight landing status in real time. Your chauffeur meets you directly at the official arrival pickup zone at Terminal 1 (Domestic) or Terminal 2 (International) with zero delay fees.",
    },
    {
      category: "Outstation & Tolls",
      question: "Can I book a one-way outstation cab drop from Mumbai?",
      answer:
        "Yes! Taxiyaa provides fixed-fare one-way drops from Mumbai to Pune, Lonavala, Nashik, Shirdi, Goa, Surat, and Mahabaleshwar with zero hidden charges.",
    },
    {
      category: "Pilgrimage Tours",
      question: "Do you offer custom pilgrimage packages like the Ashtavinayak Yatra?",
      answer:
        "Yes! We offer customized door-to-door packages for the Ashtavinayak 8-Ganesh Temple Circuit, Shirdi Sai Baba + Shanisingnapur, 3-Jyotirlinga tour (Trimbakeshwar, Bhimashankar, Grishneshwar), and Mahalaxmi Kolhapur.",
    },
    {
      category: "Corporate Contracts",
      question: "Do you provide corporate billing and GST tax invoices?",
      answer:
        "Yes, all Taxiyaa corporate bookings come with detailed GST-compliant tax invoices. Established companies can also sign up for formal monthly corporate credit contracts with net 30 billing cycles.",
    },
  ];

  const toggleFAQ = (index: number) => {
    setOpenIndex(openIndex === index ? null : index);
  };

  return (
    <section id="faqs" className="py-20 bg-nova-dark border-t border-[#1e222d] relative">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16 space-y-3">
          <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-[#13151b] border border-[#1e222d] text-[#FAB304] text-xs font-black uppercase">
            <HelpCircle className="w-4 h-4" /> FREQUENTLY ASKED QUESTIONS
          </div>
          <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white uppercase tracking-tight">
            EVERYTHING YOU NEED TO KNOW
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 font-medium">
            Clear answers on fares, vehicle amenities, outstation rules, and booking procedures.
          </p>
        </div>

        <div className="space-y-4">
          {faqs.map((faq, index) => {
            const isOpen = openIndex === index;
            return (
              <div
                key={index}
                className="card-nova overflow-hidden transition-all duration-300 border border-[#1e222d]"
              >
                <button
                  onClick={() => toggleFAQ(index)}
                  className="w-full p-5 text-left flex items-center justify-between gap-4 focus:outline-none"
                >
                  <div className="flex items-center gap-3">
                    <span className="px-2.5 py-1 rounded-lg bg-[#0b0c10] border border-[#1e222d] text-[#FAB304] text-[10px] font-black uppercase">
                      {faq.category}
                    </span>
                    <h3 className="text-base font-black text-white uppercase tracking-tight">
                      {faq.question}
                    </h3>
                  </div>
                  <ChevronDown
                    className={`w-5 h-5 text-[#FAB304] flex-shrink-0 transition-transform duration-300 ${
                      isOpen ? "rotate-180" : ""
                    }`}
                  />
                </button>

                {isOpen && (
                  <div className="px-5 pb-5 pt-1 text-xs sm:text-sm text-slate-300 font-medium leading-relaxed border-t border-[#1e222d]/60 bg-[#0b0c10]/40">
                    {faq.answer}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}







