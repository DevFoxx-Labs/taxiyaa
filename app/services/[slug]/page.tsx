import { notFound } from "next/navigation";
import { servicesData, getServiceBySlug } from "@/data/servicesData";
import ServiceDetailClient from "./ServiceDetailClient";
import type { Metadata } from "next";

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

  return {
    title: `${service.title} | Taxiyaa Cab Services Goregaon West Mumbai`,
    description: service.description,
    openGraph: {
      title: `${service.title} | Taxiyaa Travels Mumbai`,
      description: service.description,
      images: [service.heroImage],
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

  return <ServiceDetailClient service={service} />;
}
