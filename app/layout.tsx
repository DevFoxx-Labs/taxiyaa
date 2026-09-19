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
    "Taxiyaa provides top-rated 24/7 Car Rentals, Outstation Taxis to Pune, Lonavala, Nashik & Goa, CSMIA Airport Transfers, and Luxury Tempo Travellers in Goregaon West & Mumbai. Rated 4.9★ on Google & Justdial. Call +91 98338 67640.",
  keywords: [
    "Taxiyaa",
    "Taxiyaa Mumbai",
    "Taxiyaa Goregaon West",
    "Car Rental Goregaon West",
    "Taxi Service Goregaon West",
    "Cab Booking Bangur Nagar",
    "Travel Agency Goregaon West",
    "Andheri West Car Rental",
    "24/7 Taxi Service Mumbai",
    "Outstation Cab Mumbai",
    "Mumbai to Pune Taxi",
    "Mumbai to Lonavala Cab",
    "Mumbai to Nashik Taxi",
    "Mumbai to Shirdi Cab",
    "Mumbai to Goa Outstation Taxi",
    "CSMIA Mumbai Airport Taxi",
    "Mumbai Airport Terminal 2 Cab",
    "Mumbai Airport Terminal 1 Taxi",
    "Tempo Traveller 12 Seater Mumbai",
    "Tempo Traveller 17 Seater Mumbai",
    "Corporate Car Rental Mumbai",
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
      "Top-rated 24/7 Car Rentals, Outstation Cabs to Pune & Goa, CSMIA Airport Transfers in Goregaon West & Mumbai. Call +91 98338 67640.",
    siteName: "Taxiyaa",
    images: ["/taxyiaa-logo-light.webp"],
  },
  twitter: {
    card: "summary_large_image",
    title: "Taxiyaa | 24/7 Car Rentals & Outstation Cabs Mumbai",
    description:
      "Top-rated 24/7 Car Rentals, Outstation Cabs, Airport Transfers in Goregaon West & Mumbai. Call +91 98338 67640.",
    images: ["/taxyiaa-logo-light.webp"],
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
          "Taxiyaa provides top-rated 24/7 Car Rentals, Outstation Taxis to Pune, Lonavala, Nashik & Goa, CSMIA Airport Transfers, and Luxury Tempo Travellers in Goregaon West & Mumbai.",
        telephone: "+91-9833867640",
        email: "support@taxiyaa.com",
        priceRange: "₹₹",
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
          reviewCount: "420",
          bestRating: "5",
          worstRating: "1",
        },
        contactPoint: [
          {
            "@type": "ContactPoint",
            telephone: "+91-9833867640",
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




