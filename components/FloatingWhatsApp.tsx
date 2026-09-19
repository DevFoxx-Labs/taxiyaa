"use client";

import { MessageSquare, Phone } from "lucide-react";

interface FloatingWhatsAppProps {
  onOpenBookingModal: () => void;
}

export default function FloatingWhatsApp({ onOpenBookingModal }: FloatingWhatsAppProps) {
  return (
    <div className="fixed bottom-6 right-6 z-40 flex flex-col gap-3">
      {/* Phone Call Trigger */}
      <a
        href="tel:+919833867640"
        className="w-12 h-12 rounded-full bg-[#13151b] border-2 border-[#1e222d] text-[#FAB304] flex items-center justify-center shadow-xl hover:scale-110 transition-transform"
        title="Call Taxiyaa Hotline"
        aria-label="Call Taxiyaa Hotline"
      >
        <Phone className="w-5 h-5" />
      </a>

      {/* WhatsApp Button */}
      <a
        href="https://wa.me/919833867640?text=Hello%20Taxiyaa!%20I%20want%20to%20book%20a%20cab."
        target="_blank"
        rel="noopener noreferrer"
        className="w-14 h-14 rounded-full bg-[#25D366] text-white flex items-center justify-center shadow-2xl hover:scale-110 transition-transform relative group"
        title="Chat on WhatsApp"
        aria-label="Chat on WhatsApp"
      >
        <MessageSquare className="w-7 h-7 fill-white" />
        <span className="absolute right-16 top-1/2 -translate-y-1/2 bg-[#0b0c10] text-white text-[11px] font-bold px-3 py-1.5 rounded-lg border border-[#1e222d] whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none shadow-xl">
          Instant WhatsApp Booking
        </span>
      </a>
    </div>
  );
}





