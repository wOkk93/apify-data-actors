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
| **Podcast Host Emails, RSS & Sponsor Lead Enricher** | Business, Lead Generation | `$3.90 / 1,000 podcasts` (`$0.0039`) | [`api-market/podcast-leads-email-enricher`](https://apify.com/api-market/podcast-leads-email-enricher) |
| **Website Contacts, Emails, Socials & Tech Stack Enricher** | Lead Generation, Developer Tools | `$1.99 / 1,000 domains` (`$0.00199`) | [`api-market/website-contacts-tech-enricher`](https://apify.com/api-market/website-contacts-tech-enricher) |
| **USASpending Federal Contracts & GovCon Leads API** | Business, Lead Generation | `$1.99 / 1,000 awards` (`$0.00199`) | [`api-market/usaspending-govcon-tracker`](https://apify.com/api-market/usaspending-govcon-tracker) |
| **DeFiLlama Protocols, TVL, Yields, Fees & Stablecoins** | Business, AI | `$1.49 / 1,000 records` (`$0.00149`) | [`api-market/defillama-unified-intel`](https://apify.com/api-market/defillama-unified-intel) |
| **Y Combinator Startups, Batches & Hiring Directory** | Business, Lead Generation | `$0.99 / 1,000 companies` (`$0.00099`) | [`api-market/yc-companies-intel`](https://apify.com/api-market/yc-companies-intel) |
| **ClinicalTrials.gov Studies, Sponsors & Contacts API** | Business, Lead Generation | `$1.49 / 1,000 studies` (`$0.00149`) | [`api-market/clinicaltrials-studies-intel`](https://apify.com/api-market/clinicaltrials-studies-intel) |
| **openFDA Drug Recalls, 510(k) Devices & Adverse Events** | Business, AI | `$1.49 / 1,000 records` (`$0.00149`) | [`api-market/openfda-regulatory-intel`](https://apify.com/api-market/openfda-regulatory-intel) |
| **WordPress.org Plugins Market & Acquisition Radar** | Developer Tools, Lead Generation | `$0.99 / 1,000 plugins` (`$0.00099`) | [`api-market/wordpress-plugins-intel`](https://apify.com/api-market/wordpress-plugins-intel) |
| **Hacker News Who Is Hiring Jobs & Tech Trends Scraper** | Jobs, Lead Generation | `$0.49 / 1,000 items` (`$0.00049`) | [`api-market/hn-hiring-trends-scraper`](https://apify.com/api-market/hn-hiring-trends-scraper) |
| **Hugging Face Models, Datasets & Spaces Intelligence** | AI, Developer Tools | `$0.79 / 1,000 items` (`$0.00079`) | [`api-market/huggingface-ai-intel`](https://apify.com/api-market/huggingface-ai-intel) |

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

### 10. USASpending Federal Contracts & GovCon Leads API
Query U.S. federal contracts, grants, and IDVs from `api.usaspending.gov` with recipient UEI, NAICS codes, obligated award value, and recompete expiration days.

- **Apify Store:** [apify.com/api-market/usaspending-govcon-tracker](https://apify.com/api-market/usaspending-govcon-tracker)
- **Sample Input:**
```json
{
  "keywords": ["software"],
  "awardType": "contracts",
  "startDate": "2026-01-01",
  "endDate": "2026-12-31",
  "maxAwards": 100
}
```

### 11. DeFiLlama Protocols, TVL, Yields, Fees & Stablecoins
All-in-one DeFiLlama intelligence Actor pulling protocol TVL, yield farming pool APYs, 24h/7d/30d protocol fees, and stablecoin circulating supply with zero API keys.

- **Apify Store:** [apify.com/api-market/defillama-unified-intel](https://apify.com/api-market/defillama-unified-intel)
- **Sample Input:**
```json
{
  "mode": "yields",
  "chain": "Ethereum",
  "stablecoinOnly": true,
  "minTvlUsd": 1000000,
  "maxItems": 100
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

### 12. Podcast Host Emails, RSS & Sponsor Lead Enricher
Discover niche podcasts across 100+ countries and extract `<itunes:email>` / managing editor emails, owner names, activity status, and episode sponsorship signals.

- **Apify Store:** [apify.com/api-market/podcast-leads-email-enricher](https://apify.com/api-market/podcast-leads-email-enricher)
- **Sample Input:**
```json
{
  "queries": ["saas marketing"],
  "country": "us",
  "requireEmail": false,
  "activeWithinDays": 0,
  "maxPodcastsPerQuery": 25,
  "maxTotalPodcasts": 100
}
```

### 13. Website Contacts, Emails, Socials & Tech Stack Enricher
Ultra-fast, browserless B2B website enrichment extracting public emails, phone numbers, social media URLs, metadata, and 40+ detected technologies.

- **Apify Store:** [apify.com/api-market/website-contacts-tech-enricher](https://apify.com/api-market/website-contacts-tech-enricher)
- **Sample Input:**
```json
{
  "domains": ["stripe.com", "linear.app"],
  "crawlContactPages": true,
  "maxPagesPerDomain": 3,
  "maxDomains": 100
}
```

### 14. Y Combinator Startups, Batches & Hiring Directory
Filter and extract 6,400+ Y Combinator companies by cohort batch (`W26`, `S25`, `F26`), lifecycle status, hiring flags, team headcount, tags, and websites.

- **Apify Store:** [apify.com/api-market/yc-companies-intel](https://apify.com/api-market/yc-companies-intel)
- **Sample Input:**
```json
{
  "batches": ["W26", "F26"],
  "hiringOnly": true,
  "maxCompanies": 100
}
```

### 15. ClinicalTrials.gov Studies, Sponsors & Contacts API
Extract ClinicalTrials.gov v2 studies, trial phases, recruiting status, drugs/interventions, sponsors, study countries, and central contact emails.

- **Apify Store:** [apify.com/api-market/clinicaltrials-studies-intel](https://apify.com/api-market/clinicaltrials-studies-intel)
- **Sample Input:**
```json
{
  "condition": "oncology",
  "status": "RECRUITING",
  "maxStudies": 100
}
```

### 16. openFDA Drug Recalls, 510(k) Devices & Adverse Events
Query FDA drug enforcement recalls, medical device recalls, 510(k) clearances, and FAERS adverse events directly from `api.fda.gov`.

- **Apify Store:** [apify.com/api-market/openfda-regulatory-intel](https://apify.com/api-market/openfda-regulatory-intel)
- **Sample Input:**
```json
{
  "mode": "drug_recalls",
  "keyword": "",
  "maxRecords": 100
}
```

### 17. WordPress.org Plugins Market & Acquisition Radar
Scrape 75,000+ WordPress.org plugins with active installs, ratings, support resolution rates, and outdated high-install Micro-PE acquisition signals.

- **Apify Store:** [apify.com/api-market/wordpress-plugins-intel](https://apify.com/api-market/wordpress-plugins-intel)
- **Sample Input:**
```json
{
  "mode": "browse",
  "browse": "popular",
  "minActiveInstalls": 10000,
  "maxPlugins": 100
}
```

### 18. Hacker News Who Is Hiring Jobs & Tech Trends Scraper
Extract parsed startup job postings (company, remote, salary, stack, emails) from monthly *Ask HN: Who is hiring?* threads, Front Page, or Show HN.

- **Apify Store:** [apify.com/api-market/hn-hiring-trends-scraper](https://apify.com/api-market/hn-hiring-trends-scraper)
- **Sample Input:**
```json
{
  "mode": "who_is_hiring",
  "remoteOnly": true,
  "maxItems": 100
}
```

### 19. Hugging Face Models, Datasets & Spaces Intelligence
Extract trending Hugging Face AI models, datasets, and Spaces sorted by downloads, likes, or trending score with pipeline tasks and licenses.

- **Apify Store:** [apify.com/api-market/huggingface-ai-intel](https://apify.com/api-market/huggingface-ai-intel)
- **Sample Input:**
```json
{
  "resourceType": "models",
  "sortBy": "downloads",
  "maxItems": 100
}
```

---

## Quickstart Examples

Set your Apify API token as an environment variable (`export APIFY_TOKEN="your_token_here"`), then run any Actor via Python, Node.js, or cURL. Full runnable scripts live in [`examples/`](examples/):

- [`examples/python_quickstart.py`](examples/python_quickstart.py) — Python client runner supporting all 19 Actors (`python3 examples/python_quickstart.py --list`)
- [`examples/node_quickstart.mjs`](examples/node_quickstart.mjs) — Node.js ESM runner supporting all 19 Actors (`node examples/node_quickstart.mjs --list`)
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
You are billed only per `result-item` saved to the dataset (`$0.09` to `$3.90` per 1,000 records depending on the Actor), plus minimal standard Apify platform compute.

**What output formats are supported?**
Every run stores structured records in an Apify Dataset that can be downloaded or consumed via API in JSON, JSONL, CSV, Excel (`.xlsx`), XML, or HTML table format.

**Need support or a custom schema?**
Open an issue directly on the corresponding Actor page at [apify.com/api-market](https://apify.com/api-market).
