import { notFound } from "next/navigation";
import { routesData, getRouteBySlug } from "@/data/routesData";
import RouteDetailClient from "./RouteDetailClient";
import type { Metadata } from "next";

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

  return {
    title: `${routeItem.title} | Taxiyaa Outstation Cabs Mumbai`,
    description: routeItem.description,
    openGraph: {
      title: `${routeItem.title} | Taxiyaa Travels Mumbai`,
      description: routeItem.description,
      images: [routeItem.heroImage],
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

  return <RouteDetailClient routeItem={routeItem} />;
}




