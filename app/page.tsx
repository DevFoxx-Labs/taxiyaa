"use client";

import { useState } from "react";
import Navbar from "@/components/Navbar";
import Hero from "@/components/Hero";
import MarqueeBar from "@/components/MarqueeBar";
import FeatureHighlights from "@/components/FeatureHighlights";
import CorporateTrust from "@/components/CorporateTrust";
import AboutSection from "@/components/AboutSection";
import BookingProcess from "@/components/BookingProcess";
import Services from "@/components/Services";
import PilgrimageSection from "@/components/PilgrimageSection";
import WhyChooseUs from "@/components/WhyChooseUs";
import Fleet from "@/components/Fleet";
import PopularRoutes from "@/components/PopularRoutes";
import CityCoverage from "@/components/CityCoverage";
import FAQSection from "@/components/FAQSection";
import TravelGuides from "@/components/TravelGuides";
import Gallery from "@/components/Gallery";
import Reviews from "@/components/Reviews";
import ContactLocations from "@/components/ContactLocations";
import Footer from "@/components/Footer";
import FloatingWhatsApp from "@/components/FloatingWhatsApp";
import BookingModal from "@/components/BookingModal";

export default function Home() {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalService, setModalService] = useState("Car rental / local & outstation");

  const handleOpenBookingModal = (service?: string) => {
    if (service) setModalService(service);
    setIsModalOpen(true);
  };

  return (
    <main className="min-h-screen bg-[#0b0c10] text-slate-100 flex flex-col selection:bg-[#b5f63d] selection:text-[#0b0c10]">
      <Navbar onOpenBookingModal={handleOpenBookingModal} />
      <Hero onOpenBookingModal={() => handleOpenBookingModal()} />
      <MarqueeBar />
      <FeatureHighlights />
      <CorporateTrust />
      <AboutSection />
      <BookingProcess />
      <Services onOpenBookingModal={handleOpenBookingModal} />
      <PilgrimageSection onOpenBookingModal={handleOpenBookingModal} />
      <WhyChooseUs />
      <Fleet onOpenBookingModal={handleOpenBookingModal} />
      <PopularRoutes onOpenBookingModal={handleOpenBookingModal} />
      <CityCoverage />
      <FAQSection />
      <TravelGuides />
      <Gallery />
      <Reviews />
      <ContactLocations />
      <Footer />
      <FloatingWhatsApp onOpenBookingModal={() => handleOpenBookingModal()} />

      <BookingModal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        defaultService={modalService}
      />
    </main>
  );
}
