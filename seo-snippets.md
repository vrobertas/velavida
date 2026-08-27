# Vela Vida — SEO Code Snippets (copy-paste ready)

All snippets go inside `<head>` unless noted otherwise.

---

## 1. index.html (EN) — replace title + meta

```html
<title>Ibiza Flotilla Sailing 2026 — Book a Catamaran Berth from €890 | Vela Vida</title>
<meta name="description" content="Join a catamaran flotilla in Ibiza & Formentera, October 10–17, 2026. Book a single berth from €890 — solo travellers welcome, no sailing experience needed. 8 spots only.">
```

Delete the `meta keywords` tag entirely (Google ignores it, and yours contains
"Stromboli volcano" copied from the Sicily page). Update og:/twitter: title and
description to match the new ones above.

---

## 2. index.html (EN) — hreflang block

```html
<link rel="alternate" hreflang="en" href="https://www.velavidasails.com/">
<link rel="alternate" hreflang="lt" href="https://www.velavidasails.com/lt/">
<link rel="alternate" hreflang="x-default" href="https://www.velavidasails.com/">
```

---

## 3. index.html (EN) — Event + Organization schema

Paste before `</head>`:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "Ibiza Sailing Flotilla 2026 — Catamaran Week aboard Fountaine Pajot Lucia 40",
  "description": "A 7-day flotilla sailing week along Ibiza and Formentera aboard a Fountaine Pajot Lucia 40 catamaran. Book a single berth — solo travellers welcome, no sailing experience needed. Route: Ibiza Town, Formentera, Es Vedrà, Cala Saona, Sant Antoni, Espalmador.",
  "startDate": "2026-10-10",
  "endDate": "2026-10-17",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/OfflineEventAttendanceMode",
  "image": "https://www.velavidasails.com/images/lucia-40-exterior.png",
  "location": {
    "@type": "Place",
    "name": "Marina Ibiza — Ibiza Town (Eivissa)",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Ibiza Town",
      "addressRegion": "Balearic Islands",
      "addressCountry": "ES"
    }
  },
  "offers": {
    "@type": "Offer",
    "name": "Berth on Fountaine Pajot Lucia 40 catamaran",
    "price": "890",
    "priceCurrency": "EUR",
    "availability": "https://schema.org/InStock",
    "validFrom": "2026-01-01",
    "url": "https://www.velavidasails.com/#pricing"
  },
  "organizer": {
    "@type": "Organization",
    "name": "Vela Vida Yachting",
    "url": "https://www.velavidasails.com/"
  },
  "performer": {
    "@type": "Person",
    "name": "Robertas Vaitiekunas",
    "jobTitle": "Skipper"
  }
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Vela Vida Yachting",
  "url": "https://www.velavidasails.com/",
  "logo": "https://www.velavidasails.com/images/lucia-40-exterior.png",
  "email": "join@velavidasails.com",
  "sameAs": [
    "https://instagram.com/velavidasails"
  ]
}
</script>
```

---

## 4. lt/index.html — replace title + meta

```html
<title>Buriavimas Ibizoje 2026 — katamaranų flotilė, vieta nuo €890 | Vela Vida</title>
<meta name="description" content="Buriavimo savaitė katamaranu Ibizoje ir Formenteroje, spalio 10–17, 2026. Rezervuok vietą nuo €890 — patirtis nebūtina, tinka keliaujantiems vieniems. Tik 8 vietos.">
```

hreflang (same block on the LT page):

```html
<link rel="alternate" hreflang="en" href="https://www.velavidasails.com/">
<link rel="alternate" hreflang="lt" href="https://www.velavidasails.com/lt/">
<link rel="alternate" hreflang="x-default" href="https://www.velavidasails.com/">
```

---

## 5. lt/index.html — Event schema (LT)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "Ibizos katamaranų flotilė 2026 — buriavimo savaitė su Fountaine Pajot Lucia 40",
  "description": "7 dienų buriavimo flotilė palei Ibizą ir Formenterą katamaranu Fountaine Pajot Lucia 40. Rezervuokite vieną vietą — patirtis nebūtina, tinka keliaujantiems vieniems. Maršrutas: Ibiza, Formentera, Es Vedrà, Cala Saona, Sant Antoni, Espalmador.",
  "inLanguage": "lt",
  "startDate": "2026-10-10",
  "endDate": "2026-10-17",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/OfflineEventAttendanceMode",
  "image": "https://www.velavidasails.com/images/lucia-40-exterior.png",
  "location": {
    "@type": "Place",
    "name": "Marina Ibiza — Ibizos miestas (Eivissa)",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Ibiza Town",
      "addressRegion": "Balearic Islands",
      "addressCountry": "ES"
    }
  },
  "offers": {
    "@type": "Offer",
    "name": "Vieta katamarane Fountaine Pajot Lucia 40",
    "price": "890",
    "priceCurrency": "EUR",
    "availability": "https://schema.org/InStock",
    "validFrom": "2026-01-01",
    "url": "https://www.velavidasails.com/lt/#pricing"
  },
  "organizer": {
    "@type": "Organization",
    "name": "Vela Vida Yachting",
    "url": "https://www.velavidasails.com/"
  },
  "performer": {
    "@type": "Person",
    "name": "Robertas Vaitiekunas",
    "jobTitle": "Kapitonas"
  }
}
</script>
```

---

## 6. faq.html (EN) — add hreflang

```html
<link rel="alternate" hreflang="en" href="https://www.velavidasails.com/faq.html">
<link rel="alternate" hreflang="lt" href="https://www.velavidasails.com/lt/faq.html">
<link rel="alternate" hreflang="x-default" href="https://www.velavidasails.com/faq.html">
```

Also add the FAQ link to the EN nav in index.html:
```html
<a href="faq.html">FAQ</a>
```

---

## 7. sitemap.xml — full replacement

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <url>
    <loc>https://www.velavidasails.com/</loc>
    <xhtml:link rel="alternate" hreflang="lt" href="https://www.velavidasails.com/lt/"/>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://www.velavidasails.com/lt/</loc>
    <xhtml:link rel="alternate" hreflang="en" href="https://www.velavidasails.com/"/>
  </url>
  <url>
    <loc>https://www.velavidasails.com/faq.html</loc>
    <xhtml:link rel="alternate" hreflang="lt" href="https://www.velavidasails.com/lt/faq.html"/>
  </url>
  <url>
    <loc>https://www.velavidasails.com/lt/faq.html</loc>
    <xhtml:link rel="alternate" hreflang="en" href="https://www.velavidasails.com/faq.html"/>
  </url>
  <url>
    <loc>https://www.velavidasails.com/sicily-2026.html</loc>
  </url>
</urlset>
```

---

## Checklist after pushing

1. Validate schema at https://search.google.com/test/rich-results (test both index pages and both FAQ pages).
2. In Google Search Console: URL Inspection → Request Indexing for all 4 pages.
3. Fix while you're in there: sicily-2026.html has `twitter:url` pointing to the homepage instead of itself.
