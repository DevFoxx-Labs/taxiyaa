import { notFound } from "next/navigation";
import { routesData, getRouteBySlug } from "@/data/routesData";
import RouteDetailClient from "./RouteDetailClient";
import type { Metadata } from "next";

const siteUrl = "https://taxiyaa.com";

export async function generateStaticParams() {
  return routesData.map((routeItem) => ({
    slug: routeItem.slug,
  }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const routeItem = getRouteBySlug(slug);

  if (!routeItem) {
    return {
      title: "Route Not Found | Taxiyaa Travels Mumbai",
    };
  }

  const canonicalUrl = `${siteUrl}/routes/${routeItem.slug}`;

  return {
    title: `${routeItem.title} - Fixed Rates ₹0 Surge | Taxiyaa`,
    description: `Book ${routeItem.title} (${routeItem.distance}, ~${routeItem.duration}). Doorstep pickup from Mumbai. ${routeItem.description} Call +91 63927 67985 for instant quote.`,
    keywords: [
      routeItem.title,
      `${routeItem.from} to ${routeItem.to} cab`,
      `${routeItem.from} to ${routeItem.to} taxi`,
      `${routeItem.from} to ${routeItem.to} fare`,
      `${routeItem.from} to ${routeItem.to} one way drop`,
      "Taxiyaa Outstation Cabs",
      "Mumbai Outstation Cab Service",
    ],
    alternates: {
      canonical: canonicalUrl,
    },
    openGraph: {
      type: "article",
      locale: "en_IN",
      url: canonicalUrl,
      title: `${routeItem.title} | Taxiyaa Outstation Cabs Mumbai`,
      description: routeItem.description,
      siteName: "Taxiyaa Travels",
      images: [
        {
          url: `${siteUrl}${routeItem.heroImage}`,
          width: 1200,
          height: 630,
          alt: routeItem.title,
        },
      ],
    },
    twitter: {
      card: "summary_large_image",
      title: `${routeItem.title} | Taxiyaa Outstation Cabs Mumbai`,
      description: routeItem.description,
      images: [`${siteUrl}${routeItem.heroImage}`],
    },
  };
}

export default async function RoutePage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const routeItem = getRouteBySlug(slug);

  if (!routeItem) {
    notFound();
  }

  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "Trip",
        "@id": `${siteUrl}/routes/${routeItem.slug}#trip`,
        name: routeItem.title,
        description: routeItem.description,
        itinerary: {
          "@type": "ItemList",
          numberOfItems: 2,
          itemListElement: [
            {
              "@type": "ListItem",
              position: 1,
              name: routeItem.from,
            },
            {
              "@type": "ListItem",
              position: 2,
              name: routeItem.to,
            },
          ],
        },
        provider: {
          "@type": "TaxiService",
          name: "Taxiyaa",
          telephone: "+91-6392767985",
          url: siteUrl,
        },
        image: `${siteUrl}${routeItem.heroImage}`,
      },
      {
        "@type": "BreadcrumbList",
        itemListElement: [
          {
            "@type": "ListItem",
            position: 1,
            name: "Home",
            item: siteUrl,
          },
          {
            "@type": "ListItem",
            position: 2,
            name: "Outstation Routes",
            item: `${siteUrl}/#routes`,
          },
          {
            "@type": "ListItem",
            position: 3,
            name: routeItem.title,
            item: `${siteUrl}/routes/${routeItem.slug}`,
          },
        ],
      },
      {
        "@type": "FAQPage",
        mainEntity: routeItem.faqs.map((faq) => ({
          "@type": "Question",
          name: faq.question,
          acceptedAnswer: {
            "@type": "Answer",
            text: faq.answer,
          },
        })),
      },
    ],
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <RouteDetailClient routeItem={routeItem} />
    </>
  );
}






