import type { Metadata } from "next";
import "./globals.css";

const siteUrl = "https://taxiyaa.com";

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: "Taxiyaa | 24/7 Car Rentals, Outstation Cabs & Airport Transfers Mumbai",
    template: "%s | Taxiyaa Goregaon West, Mumbai",
  },
  description:
    "Taxiyaa is Mumbai's premier 24/7 Cab Service based in Goregaon West. Guaranteed zero surge pricing for CSMIA Airport Drops, Outstation Cabs to Pune, Lonavala, Nashik, Shirdi & Goa, Force Urbania & Maharaja Tempo Travellers. Call +91 63927 67985 / +91 88085 27577.",
  keywords: [
    // Brand & Core Location Keywords
    "Taxiyaa",
    "Taxiyaa Travels",
    "Taxiyaa Mumbai",
    "Taxiyaa Goregaon West",
    "Taxiyaa Cab Service",
    "Taxiyaa Hotline",
    "Taxiyaa Car Rental",
    "Car Rental Goregaon West",
    "Taxi Service Goregaon West",
    "Cab Booking Bangur Nagar",
    "Travel Agency Goregaon West",
    "Car Rental Andheri West",
    "Cab Booking Malad West",
    "Taxi Service BKC Mumbai",
    "24/7 Taxi Service Mumbai",
    // Airport Transfer Keywords
    "CSMIA Mumbai Airport Taxi",
    "Mumbai Airport Terminal 2 Cab",
    "Mumbai Airport Terminal 1 Taxi",
    "Airport Drop Taxi Goregaon",
    "Mumbai Airport Pickup Cab",
    "Flat Rate Airport Taxi Mumbai",
    // Outstation Cab Keywords
    "Outstation Cab Mumbai",
    "Mumbai to Pune Cab Service",
    "Mumbai to Lonavala Taxi",
    "Mumbai to Nashik Taxi",
    "Mumbai to Shirdi Cab",
    "Samruddhi Mahamarg Shirdi Taxi",
    "Mumbai to Goa Outstation Taxi",
    "Mumbai to Mahabaleshwar Cab",
    "Mumbai to Surat Taxi",
    "One Way Outstation Drop Mumbai",
    // Fleet & Minibus Hiring Keywords
    "Tempo Traveller 12 Seater Mumbai",
    "Tempo Traveller 17 Seater Mumbai",
    "Maharaja Tempo Traveller 1x1 Recliner",
    "Force Urbania Monocoque Van Hire Mumbai",
    "Innova Crysta Cab Rental Mumbai",
    "Ertiga SUV Car Rental Mumbai",
    "Mercedes Luxury Car Hire Mumbai",
    "BMW Luxury Car Hire Mumbai",
    "Toyota Fortuner Rental Mumbai",
    "Bus Rental with Washroom Mumbai",
    "20 Seater Minibus Booking Mumbai",
    "Volvo Coach Rental Mumbai",
    // Tour & Event Packages Keywords
    "Ashtavinayak 8 Ganesh Tour Package",
    "3 Jyotirlinga Tour Package from Mumbai",
    "Wedding Groom Car Rental Mumbai",
    "Corporate Employee Transportation Mumbai",
    "Corporate Car Rental BKC Mumbai",
    // Value Proposition Keywords
    "Zero Surge Pricing Cab Mumbai",
    "Fixed Fare Outstation Taxi",
    "Sanitized Cab Service Mumbai",
    "Pre Booked Taxi Mumbai",
  ],
  authors: [{ name: "Taxiyaa Travels", url: siteUrl }],
  creator: "Taxiyaa",
  publisher: "Taxiyaa",
  icons: {
    icon: [
      { url: "/favicon-32x32.png", sizes: "32x32", type: "image/png" },
      { url: "/favicon-16x16.png", sizes: "16x16", type: "image/png" },
    ],
    apple: [
      { url: "/apple-touch-icon.png", sizes: "180x180", type: "image/png" },
    ],
  },
  manifest: "/site.webmanifest",
  formatDetection: {
    email: true,
    address: true,
    telephone: true,
  },
  alternates: {
    canonical: siteUrl,
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  openGraph: {
    type: "website",
    locale: "en_IN",
    url: siteUrl,
    title: "Taxiyaa | 24/7 Car Rentals, Outstation Cabs & Airport Transfers Mumbai",
    description:
      "Top-rated 24/7 Car Rentals, Outstation Cabs to Pune & Goa, CSMIA Airport Transfers in Goregaon West & Mumbai. Fixed rates with zero surge pricing. Call +91 63927 67985 / +91 88085 27577.",
    siteName: "Taxiyaa Travels",
    images: [
      {
        url: `${siteUrl}/taxyiaa-logo-light.webp`,
        width: 1200,
        height: 630,
        alt: "Taxiyaa Travels Mumbai Cab Service",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "Taxiyaa | 24/7 Car Rentals & Outstation Cabs Mumbai",
    description:
      "Top-rated 24/7 Car Rentals, Outstation Cabs, CSMIA Airport Transfers in Goregaon West & Mumbai. Call +91 63927 67985.",
    images: [`${siteUrl}/taxyiaa-logo-light.webp`],
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  // Rich Schema.org Multi-Entity JSON-LD for Search Engines
  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": ["TaxiService", "TravelAgency", "AutoRental", "LocalBusiness"],
        "@id": `${siteUrl}/#organization`,
        name: "Taxiyaa",
        alternateName: [
          "Taxiyaa Travels",
          "Taxiyaa Mumbai",
          "Taxiyaa Goregaon West",
          "Taxiyaa Cab Services",
        ],
        url: siteUrl,
        logo: `${siteUrl}/taxyiaa-logo-light.webp`,
        image: `${siteUrl}/taxyiaa-logo-light.webp`,
        description:
          "Taxiyaa provides top-rated 24/7 Car Rentals, Outstation Taxis to Pune, Lonavala, Nashik & Goa, CSMIA Airport Transfers, Force Urbania & Luxury Tempo Travellers in Goregaon West & Mumbai.",
        telephone: ["+91-6392767985", "+91-8808527577"],
        email: "support@taxiyaa.com",
        priceRange: "₹₹",
        paymentAccepted: ["Cash", "Credit Card", "Debit Card", "UPI", "Net Banking"],
        currenciesAccepted: "INR",
        address: {
          "@type": "PostalAddress",
          streetAddress:
            "Kaveri Mahima Soc, Maharaja Agrasen Marg, Bangur Nagar",
          addressLocality: "Goregaon West, Mumbai",
          addressRegion: "Maharashtra",
          postalCode: "400104",
          addressCountry: "IN",
        },
        geo: {
          "@type": "GeoCoordinates",
          latitude: 19.1677,
          longitude: 72.8144,
        },
        areaServed: [
          { "@type": "City", name: "Mumbai" },
          { "@type": "City", name: "Thane" },
          { "@type": "City", name: "Navi Mumbai" },
          { "@type": "City", name: "Pune" },
          { "@type": "City", name: "Nashik" },
          { "@type": "City", name: "Lonavala" },
          { "@type": "City", name: "Shirdi" },
          { "@type": "State", name: "Goa" },
        ],
        openingHoursSpecification: {
          "@type": "OpeningHoursSpecification",
          dayOfWeek: [
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
            "Sunday",
          ],
          opens: "00:00",
          closes: "23:59",
        },
        aggregateRating: {
          "@type": "AggregateRating",
          ratingValue: "4.9",
          reviewCount: "480",
          bestRating: "5",
          worstRating: "1",
        },
        contactPoint: [
          {
            "@type": "ContactPoint",
            telephone: "+91-6392767985",
            contactType: "reservations",
            availableLanguage: ["English", "Hindi", "Marathi"],
            areaServed: "IN",
          },
          {
            "@type": "ContactPoint",
            telephone: "+91-8808527577",
            contactType: "customer service",
            availableLanguage: ["English", "Hindi", "Marathi"],
            areaServed: "IN",
          },
        ],
      },
      {
        "@type": "WebSite",
        "@id": `${siteUrl}/#website`,
        url: siteUrl,
        name: "Taxiyaa",
        publisher: { "@id": `${siteUrl}/#organization` },
      },
    ],
  };

  return (
    <html lang="en" className="scroll-smooth dark">
      <head>
        <meta name="theme-color" content="#0b0c10" />
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
        <link rel="manifest" href="/site.webmanifest" />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
        />
      </head>
      <body className="antialiased min-h-screen flex flex-col bg-[#0b0c10] text-slate-100 selection:bg-[#FAB304] selection:text-[#0b0c10]">
        {children}
      </body>
    </html>
  );
}






