import { notFound } from "next/navigation";
import { servicesData, getServiceBySlug } from "@/data/servicesData";
import ServiceDetailClient from "./ServiceDetailClient";
import type { Metadata } from "next";

const siteUrl = "https://taxiyaa.com";

export async function generateStaticParams() {
  return servicesData.map((service) => ({
    slug: service.slug,
  }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const service = getServiceBySlug(slug);

  if (!service) {
    return {
      title: "Service Not Found | Taxiyaa Travels Mumbai",
    };
  }

  const canonicalUrl = `${siteUrl}/services/${service.slug}`;

  return {
    title: `${service.title} | 24/7 Cab Hire Goregaon West Mumbai`,
    description: `${service.subtitle}. ${service.description} Guaranteed zero surge rates in Mumbai & outstation. Book online or call +91 63927 67985.`,
    keywords: [
      service.title,
      `${service.title} Mumbai`,
      `${service.title} Goregaon West`,
      ...service.keyFeatures.map((f) => `${f} Taxiyaa`),
      "Taxiyaa Travels",
      "24/7 Cab Rental Mumbai",
    ],
    alternates: {
      canonical: canonicalUrl,
    },
    openGraph: {
      type: "article",
      locale: "en_IN",
      url: canonicalUrl,
      title: `${service.title} | Taxiyaa Travels Mumbai`,
      description: service.description,
      siteName: "Taxiyaa Travels",
      images: [
        {
          url: `${siteUrl}${service.heroImage}`,
          width: 1200,
          height: 630,
          alt: service.title,
        },
      ],
    },
    twitter: {
      card: "summary_large_image",
      title: `${service.title} | Taxiyaa Travels Mumbai`,
      description: service.description,
      images: [`${siteUrl}${service.heroImage}`],
    },
  };
}

export default async function ServicePage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const service = getServiceBySlug(slug);

  if (!service) {
    notFound();
  }

  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "Service",
        "@id": `${siteUrl}/services/${service.slug}#service`,
        name: service.title,
        description: service.description,
        provider: {
          "@type": "TaxiService",
          name: "Taxiyaa",
          telephone: "+91-6392767985",
          url: siteUrl,
        },
        areaServed: {
          "@type": "City",
          name: "Mumbai",
        },
        serviceType: service.badge,
        image: `${siteUrl}${service.heroImage}`,
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
            name: "Services",
            item: `${siteUrl}/#services`,
          },
          {
            "@type": "ListItem",
            position: 3,
            name: service.title,
            item: `${siteUrl}/services/${service.slug}`,
          },
        ],
      },
      {
        "@type": "FAQPage",
        mainEntity: service.faqs.map((faq) => ({
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
      <ServiceDetailClient service={service} />
    </>
  );
}






