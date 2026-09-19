"use client";

import { useState } from "react";
import { X, Send, Phone, Calendar, MapPin, User, Mail, Car, CheckCircle } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

interface BookingModalProps {
  isOpen: boolean;
  onClose: () => void;
  defaultService?: string;
}

export default function BookingModal({
  isOpen,
  onClose,
  defaultService = "Car rental / local & outstation",
}: BookingModalProps) {
  const [name, setName] = useState("");
  const [phone, setPhone] = useState("");
  const [email, setEmail] = useState("");
  const [service, setService] = useState(defaultService);
  const [date, setDate] = useState("");
  const [pickup, setPickup] = useState("");
  const [destination, setDestination] = useState("");
  const [vehicle, setVehicle] = useState("Sedan (Swift Dzire / Etios)");
  const [message, setMessage] = useState("");
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const text = `Hello Taxiyaa! 🚖\n\nNew Booking Enquiry from Website:\n- *Name*: ${name}\n- *Phone*: ${phone}\n- *Email*: ${
      email || "N/A"
    }\n- *Service*: ${service}\n- *Travel Date*: ${date}\n- *Pickup*: ${pickup}\n- *Destination*: ${destination}\n- *Vehicle*: ${vehicle}\n- *Details*: ${
      message || "None"
    }`;

    window.open(`https://wa.me/919833867640?text=${encodeURIComponent(text)}`, "_blank");
    setSubmitted(true);
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-[#0b0c10]/90 backdrop-blur-md"
        >
          <motion.div
            initial={{ scale: 0.9, opacity: 0, y: 20 }}
            animate={{ scale: 1, opacity: 1, y: 0 }}
            exit={{ scale: 0.9, opacity: 0, y: 20 }}
            transition={{ type: "spring", stiffness: 300, damping: 25 }}
            className="bg-[#13151b] border border-[#1e222d] rounded-2xl w-full max-w-xl p-6 sm:p-8 shadow-2xl relative max-h-[90vh] overflow-y-auto text-white"
          >
            {/* Close Button */}
            <button
              onClick={onClose}
              className="absolute top-4 right-4 p-2 rounded-lg bg-[#0b0c10] border border-[#1e222d] text-slate-400 hover:text-white transition-colors"
              aria-label="Close modal"
            >
              <X className="w-5 h-5 text-[#FAB304]" />
            </button>

            {submitted ? (
              <div className="text-center py-8 space-y-4">
                <div className="w-16 h-16 bg-[#0b0c10] text-[#FAB304] rounded-full flex items-center justify-center mx-auto border border-[#1e222d]">
                  <CheckCircle className="w-8 h-8" />
                </div>
                <h3 className="text-2xl font-black text-white uppercase">Enquiry Sent Successfully!</h3>
                <p className="text-sm text-slate-300 font-medium">
                  Your inquiry has been formatted and redirected to our WhatsApp dispatch team (`+91 9833867640`). We will get back to you immediately!
                </p>
                <button
                  onClick={() => {
                    setSubmitted(false);
                    onClose();
                  }}
                  className="btn-nova-neon mt-4 px-8 py-3 uppercase text-xs font-black"
                >
                  Done
                </button>
              </div>
            ) : (
              <div>
                <div className="mb-6 space-y-1">
                  <span className="text-xs uppercase font-extrabold tracking-[0.2em] text-[#FAB304]">
                    BOOK RIDE / SERVICE
                  </span>
                  <h3 className="text-2xl font-black text-white uppercase">Taxiyaa Booking & Enquiry</h3>
                  <p className="text-xs text-slate-400 font-medium">
                    Fill in your travel details to receive an instant transparent quote.
                  </p>
                </div>

                <form onSubmit={handleSubmit} className="space-y-4">
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-xs font-bold text-slate-300 mb-1 flex items-center gap-1 uppercase tracking-wider">
                        <User className="w-3.5 h-3.5 text-[#FAB304]" /> Full Name *
                      </label>
                      <input
                        type="text"
                        required
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        placeholder="Enter your name"
                        className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2 text-sm text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-bold text-slate-300 mb-1 flex items-center gap-1 uppercase tracking-wider">
                        <Phone className="w-3.5 h-3.5 text-[#FAB304]" /> Phone Number *
                      </label>
                      <input
                        type="tel"
                        required
                        value={phone}
                        onChange={(e) => setPhone(e.target.value)}
                        placeholder="+91 Mobile number"
                        className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2 text-sm text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                      />
                    </div>
                  </div>

                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-xs font-bold text-slate-300 mb-1 flex items-center gap-1 uppercase tracking-wider">
                        <Mail className="w-3.5 h-3.5 text-[#FAB304]" /> Email Address
                      </label>
                      <input
                        type="email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        placeholder="name@email.com"
                        className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2 text-sm text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-bold text-slate-300 mb-1 flex items-center gap-1 uppercase tracking-wider">
                        <Car className="w-3.5 h-3.5 text-[#FAB304]" /> Required Service
                      </label>
                      <select
                        value={service}
                        onChange={(e) => setService(e.target.value)}
                        className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-[#FAB304]"
                      >
                        <option value="Car rental / local & outstation" className="bg-[#13151b]">Car rental / local & outstation</option>
                        <option value="Airport Rental Car transfer" className="bg-[#13151b]">Airport Rental Car transfer</option>
                        <option value="Maharaja Tempo Traveller & Force Urbania" className="bg-[#13151b]">Maharaja Tempo Traveller & Force Urbania</option>
                        <option value="Luxury Car & SUV Hire (Mercedes/BMW/Fortuner)" className="bg-[#13151b]">Luxury Car & SUV Hire (Mercedes/BMW/Fortuner)</option>
                        <option value="Mini Bus & Luxury Tourist Bus Hire" className="bg-[#13151b]">Mini Bus & Luxury Tourist Bus Hire</option>
                        <option value="Pilgrimage & Temple Tour Packages" className="bg-[#13151b]">Pilgrimage & Temple Tour Packages</option>
                        <option value="Bus / Tempo traveller booking" className="bg-[#13151b]">Bus / Tempo traveller booking</option>
                        <option value="Corporate travel solutions" className="bg-[#13151b]">Corporate travel solutions</option>
                        <option value="Employee transportation" className="bg-[#13151b]">Employee transportation</option>
                        <option value="Wedding / event transportation" className="bg-[#13151b]">Wedding / event transportation</option>
                        <option value="Other customized service" className="bg-[#13151b]">Other service</option>
                      </select>
                    </div>
                  </div>

                  <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    <div>
                      <label className="block text-xs font-bold text-slate-300 mb-1 flex items-center gap-1 uppercase tracking-wider">
                        <Calendar className="w-3.5 h-3.5 text-[#FAB304]" /> Travel Date *
                      </label>
                      <input
                        type="date"
                        required
                        value={date}
                        onChange={(e) => setDate(e.target.value)}
                        className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3 py-2 text-xs text-white focus:outline-none focus:border-[#FAB304]"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-bold text-slate-300 mb-1 flex items-center gap-1 uppercase tracking-wider">
                        <MapPin className="w-3.5 h-3.5 text-[#FAB304]" /> Pickup Location
                      </label>
                      <input
                        type="text"
                        value={pickup}
                        onChange={(e) => setPickup(e.target.value)}
                        placeholder="Goregaon / Mumbai"
                        className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3 py-2 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-bold text-slate-300 mb-1 flex items-center gap-1 uppercase tracking-wider">
                        <MapPin className="w-3.5 h-3.5 text-[#FAB304]" /> Destination
                      </label>
                      <input
                        type="text"
                        value={destination}
                        onChange={(e) => setDestination(e.target.value)}
                        placeholder="Pune / Shirdi / Goa"
                        className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3 py-2 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                      />
                    </div>
                  </div>

                  <div>
                    <label className="block text-xs font-bold text-slate-300 mb-1 uppercase tracking-wider">
                      Vehicle Preference
                    </label>
                    <select
                      value={vehicle}
                      onChange={(e) => setVehicle(e.target.value)}
                      className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-[#FAB304]"
                    >
                      <option value="Sedan (Swift Dzire / Etios)" className="bg-[#13151b]">Sedan (Swift Dzire / Etios - 4 Seats)</option>
                      <option value="SUV Maruti Ertiga (6 Seats)" className="bg-[#13151b]">SUV Maruti Ertiga (6 Seats)</option>
                      <option value="Toyota Innova Crysta (7 Seats)" className="bg-[#13151b]">Toyota Innova Crysta (7 Seats)</option>
                      <option value="Force Urbania Monocoque Van (10-17 Seats)" className="bg-[#13151b]">Force Urbania Monocoque Van (10-17 Seats)</option>
                      <option value="Maharaja 1x1 VIP Recliner TT (9-12 Seats)" className="bg-[#13151b]">Maharaja 1x1 VIP Recliner TT (9-12 Seats)</option>
                      <option value="Luxury Mercedes / BMW / Fortuner" className="bg-[#13151b]">Luxury Mercedes / BMW / Fortuner</option>
                      <option value="Mini Bus (20-35 Seats)" className="bg-[#13151b]">Mini Bus (20-35 Seats)</option>
                      <option value="Volvo Coach / Bus with Washroom (35-56 Seats)" className="bg-[#13151b]">Volvo Coach / Bus with Washroom (35-56 Seats)</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-xs font-bold text-slate-300 mb-1 uppercase tracking-wider">
                      Additional Notes / Instructions
                    </label>
                    <textarea
                      rows={2}
                      value={message}
                      onChange={(e) => setMessage(e.target.value)}
                      placeholder="Flight numbers, passenger count, return timing..."
                      className="w-full bg-[#0b0c10] border border-[#1e222d] rounded-xl px-3.5 py-2 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-[#FAB304]"
                    />
                  </div>

                  <button
                    type="submit"
                    className="btn-nova-neon w-full flex items-center justify-center gap-2 py-3.5 px-6 uppercase text-xs font-black tracking-wider cursor-pointer"
                  >
                    <Send className="w-4 h-4 fill-[#0b0c10]" />
                    <span>Send to WhatsApp (+91 9833867640)</span>
                  </button>
                </form>
              </div>
            )}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}





