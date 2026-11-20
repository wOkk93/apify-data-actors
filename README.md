# Apify Data Actors — Fast, Proxy-Free Web Scrapers & Intelligence APIs

API-first, low-latency [Apify Store](https://apify.com/api-market) Actors built for **finance & prediction markets, SEC filings, hiring & ATS job boards, Shopify e-commerce enrichment, app review intelligence, and newsletter data**.

- **Zero proxies required** — direct structured APIs and lightweight endpoints for fast, reliable runs
- **Clean normalized schemas** — export directly as JSON, CSV, Excel, JSONL, or stream via webhooks
- **Pay-Per-Event (PPE) pricing** — pay only for actual result items returned, with no monthly lock-in
- **Ready for any stack** — works out of the box with Python, Node.js, REST API, Make, n8n, and AI Agents via **Apify MCP**

Browse the full creator catalog: **[apify.com/api-market](https://apify.com/api-market)**

---

## Actor Directory & Pricing

| Actor | Category | Pay-Per-Event Pricing | Store Link |
| --- | --- | --- | --- |
| **Polymarket & Kalshi Prediction Markets Unified Scraper** | Business, AI | `$1.00 / 1,000 markets` (`$0.001`) | [`api-market/prediction-markets-unified`](https://apify.com/api-market/prediction-markets-unified) |
| **SEC EDGAR Filings & Form D Startup Raises Tracker** | Business, Lead Generation | `$3.00 / 1,000 filings` (`$0.003`) | [`api-market/sec-edgar-filings-tracker`](https://apify.com/api-market/sec-edgar-filings-tracker) |
| **Greenhouse, Lever & Ashby Unified Jobs Scraper** | Jobs, Lead Generation | `$1.49 / 1,000 jobs` (`$0.00149`) | [`api-market/ats-jobs-unified-scraper`](https://apify.com/api-market/ats-jobs-unified-scraper) |
| **RemoteOK, Remotive, Jobicy & Arbeitnow Remote Jobs Scraper** | Jobs, Lead Generation | `$1.20 / 1,000 jobs` (`$0.0012`) | [`api-market/remote-jobs-unified-scraper`](https://apify.com/api-market/remote-jobs-unified-scraper) |
| **Shopify Store Catalog & B2B Lead Enricher** | E-commerce, Lead Generation | `$2.00 / 1,000 items` (`$0.002`) | [`api-market/shopify-catalog-lead-enricher`](https://apify.com/api-market/shopify-catalog-lead-enricher) |
| **Apple App Store Reviews & Defect Intelligence** | Developer Tools, AI | `$0.09 / 1,000 reviews` (`$0.00009`) | [`api-market/appstore-reviews-intel`](https://apify.com/api-market/appstore-reviews-intel) |
| **Google Play Reviews & Defect Intelligence** | Developer Tools, AI | `$0.09 / 1,000 reviews` (`$0.00009`) | [`api-market/googleplay-reviews-intel`](https://apify.com/api-market/googleplay-reviews-intel) |
| **Shopify App Store Reviews & SaaS Defect Intelligence** | E-commerce, Lead Generation | `$0.50 / 1,000 items` (`$0.0005`) | [`api-market/shopify-appstore-intel`](https://apify.com/api-market/shopify-appstore-intel) |
| **Substack Leaderboards, Newsletters & Posts Scraper** | News, Lead Generation | `$0.90 / 1,000 items` (`$0.0009`) | [`api-market/substack-publications-scraper`](https://apify.com/api-market/substack-publications-scraper) |

---

## Finance & Market Intelligence

### 1. Polymarket & Kalshi Prediction Markets Unified Scraper
Fetch live prediction market odds, implied probabilities, bid-ask spreads, 24h volume, liquidity, and cross-market arbitrage hints across Polymarket and Kalshi with zero API keys or proxies.

- **Apify Store:** [apify.com/api-market/prediction-markets-unified](https://apify.com/api-market/prediction-markets-unified)
- **Sample Input:**
```json
{
  "platforms": ["polymarket", "kalshi"],
  "minVolume24h": 0,
  "maxMarketsPerPlatform": 100,
  "includeCrossMarketMatches": true
}
```

### 2. SEC EDGAR Filings & Form D Startup Raises Tracker
Extract real-time SEC EDGAR `10-K`, `10-Q`, `8-K`, `Form 4` insider trades, and `Form D` startup fundraising disclosures directly from `sec.gov` without proxies.

- **Apify Store:** [apify.com/api-market/sec-edgar-filings-tracker](https://apify.com/api-market/sec-edgar-filings-tracker)
- **Sample Input:**
```json
{
  "mode": "company_filings",
  "tickersOrCiks": ["AAPL", "NVDA"],
  "forms": ["10-K", "10-Q", "8-K"],
  "maxFilings": 50
}
```

---

## Jobs & Hiring Intelligence

### 3. Greenhouse, Lever & Ashby Unified Jobs Scraper
Scrape structured job postings from Greenhouse, Lever, and Ashby career boards with normalized roles, locations, remote flags, departments, and salary ranges.

- **Apify Store:** [apify.com/api-market/ats-jobs-unified-scraper](https://apify.com/api-market/ats-jobs-unified-scraper)
- **Sample Input:**
```json
{
  "boards": ["greenhouse:stripe", "lever:palantir", "ashby:linear"],
  "remoteOnly": false,
  "includeDescription": false,
  "maxJobsPerBoard": 100,
  "maxTotalJobs": 500
}
```

### 4. RemoteOK, Remotive, Jobicy & Arbeitnow Remote Jobs Scraper
Aggregate and deduplicate remote tech, product, and marketing jobs across RemoteOK, Remotive, Jobicy, and Arbeitnow with extracted salaries, tags, regions, and direct apply links.

- **Apify Store:** [apify.com/api-market/remote-jobs-unified-scraper](https://apify.com/api-market/remote-jobs-unified-scraper)
- **Sample Input:**
```json
{
  "sources": ["remoteok", "remotive", "jobicy", "arbeitnow"],
  "remoteOnly": true,
  "includeDescription": false,
  "maxJobsPerSource": 50,
  "maxTotalJobs": 200
}
```

---

## E-commerce, App Reviews & Media Intelligence

### 5. Shopify Store Catalog & B2B Lead Enricher
Extract Shopify product catalogs, variant pricing, stock availability, public contact emails, social links, and detected e-commerce apps (Klaviyo, Meta Pixel, Yotpo, Recharge, etc.) without proxies.

- **Apify Store:** [apify.com/api-market/shopify-catalog-lead-enricher](https://apify.com/api-market/shopify-catalog-lead-enricher)
- **Sample Input:**
```json
{
  "domains": ["allbirds.com"],
  "mode": "products",
  "maxPagesPerStore": 2,
  "maxItems": 200
}
```

### 6. Apple App Store Reviews & Defect Intelligence
Extract iOS App Store reviews across 170+ countries with sentiment signals and automatic defect tagging (crashes, billing, login, performance, UX).

- **Apify Store:** [apify.com/api-market/appstore-reviews-intel](https://apify.com/api-market/appstore-reviews-intel)
- **Sample Input:**
```json
{
  "appIds": ["389801252"],
  "countries": ["us"],
  "sortBy": "mostrecent",
  "maxPagesPerCountry": 3,
  "minRating": 1,
  "maxRating": 5,
  "maxReviews": 200
}
```

### 7. Google Play Reviews & Defect Intelligence
Extract Google Play Store reviews, star ratings, app versions, and developer replies with automatic sentiment classification and mobile bug tagging.

- **Apify Store:** [apify.com/api-market/googleplay-reviews-intel](https://apify.com/api-market/googleplay-reviews-intel)
- **Sample Input:**
```json
{
  "appIds": ["com.instagram.android"],
  "lang": "en",
  "country": "us",
  "sortBy": "newest",
  "minRating": 1,
  "maxRating": 5,
  "maxReviews": 200
}
```

### 8. Shopify App Store Reviews & SaaS Defect Intelligence
Extract Shopify App Store app profiles, ratings, pricing tiers, and merchant reviews with automatic SaaS defect tagging (bugs, sync issues, billing, support).

- **Apify Store:** [apify.com/api-market/shopify-appstore-intel](https://apify.com/api-market/shopify-appstore-intel)
- **Sample Input:**
```json
{
  "appSlugs": ["klaviyo-email-marketing"],
  "mode": "reviews",
  "sortBy": "newest",
  "minRating": 1,
  "maxRating": 5,
  "maxPagesPerApp": 3,
  "maxItems": 100
}
```

### 9. Substack Leaderboards, Newsletters & Posts Scraper
Scrape Substack paid & rising category leaderboards or full newsletter post archives with engagement metrics, author metadata, and custom domains.

- **Apify Store:** [apify.com/api-market/substack-publications-scraper](https://apify.com/api-market/substack-publications-scraper)
- **Sample Input:**
```json
{
  "mode": "posts",
  "publications": ["www.lennysnewsletter.com", "newsletter.pragmaticengineer.com"],
  "maxPages": 2,
  "maxItems": 50
}
```

---

## Quickstart Examples

Set your Apify API token as an environment variable (`export APIFY_TOKEN="your_token_here"`), then run any Actor via Python, Node.js, or cURL. Full runnable scripts live in [`examples/`](examples/):

- [`examples/python_quickstart.py`](examples/python_quickstart.py) — Python client runner supporting all 9 Actors (`python3 examples/python_quickstart.py --list`)
- [`examples/node_quickstart.mjs`](examples/node_quickstart.mjs) — Node.js ESM runner supporting all 9 Actors (`node examples/node_quickstart.mjs --list`)
- [`examples/curl_examples.sh`](examples/curl_examples.sh) — Synchronous REST API examples returning dataset JSON directly

### Python
```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run = client.actor("api-market/prediction-markets-unified").call(
    run_input={
        "platforms": ["polymarket", "kalshi"],
        "maxMarketsPerPlatform": 20,
        "includeCrossMarketMatches": True,
    }
)
items = list(client.dataset(run["defaultDatasetId"]).iterate_items())
print(f"Fetched {len(items)} items")
```

### Node.js
```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const run = await client.actor("api-market/ats-jobs-unified-scraper").call({
  boards: ["greenhouse:stripe", "lever:palantir", "ashby:linear"],
  maxJobsPerBoard: 20,
  maxTotalJobs: 50,
});
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(`Fetched ${items.length} jobs`);
```

### cURL (Synchronous JSON Response)
```bash
curl -sS -X POST \
  "https://api.apify.com/v2/acts/api-market~sec-edgar-filings-tracker/run-sync-get-dataset-items" \
  -H "Authorization: Bearer ${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"mode":"company_filings","tickersOrCiks":["AAPL","NVDA"],"forms":["10-K","10-Q","8-K"],"maxFilings":20}'
```

---

## AI Agents & MCP Integration

All Actors expose strict JSON input schemas and normalized output datasets, making them directly callable from LLM agents (Claude, Cursor, Windsurf, OpenAI, LangChain, LlamaIndex, and custom workflows) via the official **[Apify MCP Server](https://mcp.apify.com)** or Apify's official SDK integrations.

---

## FAQ

**Do these Actors require residential or datacenter proxies?**
No. Every Actor in this collection targets structured endpoints and direct public feeds, keeping run latency low and avoiding extra proxy costs.

**How does Pay-Per-Event (PPE) billing work?**
You are billed only per `result-item` saved to the dataset (`$0.09` to `$3.00` per 1,000 records depending on the Actor), plus minimal standard Apify platform compute.

**What output formats are supported?**
Every run stores structured records in an Apify Dataset that can be downloaded or consumed via API in JSON, JSONL, CSV, Excel (`.xlsx`), XML, or HTML table format.

**Need support or a custom schema?**
Open an issue directly on the corresponding Actor page at [apify.com/api-market](https://apify.com/api-market).
