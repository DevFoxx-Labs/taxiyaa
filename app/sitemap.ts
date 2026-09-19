import { MetadataRoute } from 'next';
import { servicesData } from '@/data/servicesData';
import { routesData } from '@/data/routesData';

export default function sitemap(): MetadataRoute.Sitemap {
  const baseUrl = 'https://taxiyaa.com';

  const serviceUrls = servicesData.map((service) => ({
    url: `${baseUrl}/services/${service.slug}`,
    lastModified: new Date(),
    changeFrequency: 'weekly' as const,
    priority: 0.8,
  }));

  const routeUrls = routesData.map((routeItem) => ({
    url: `${baseUrl}/routes/${routeItem.slug}`,
    lastModified: new Date(),
    changeFrequency: 'weekly' as const,
    priority: 0.8,
  }));

  return [
    {
      url: baseUrl,
      lastModified: new Date(),
      changeFrequency: 'daily',
      priority: 1.0,
    },
    ...serviceUrls,
    ...routeUrls,
  ];
}
