#!/usr/bin/env node
/**
 * Quickstart runner for all 14 api-market Apify Data Actors.
 *
 * Usage:
 *   npm install apify-client
 *   export APIFY_TOKEN="your_apify_api_token"
 *   node examples/node_quickstart.mjs --list
 *   node examples/node_quickstart.mjs prediction-markets
 */

const ACTORS = {
  "prediction-markets": [
    "api-market/prediction-markets-unified",
    {
      platforms: ["polymarket", "kalshi"],
      maxMarketsPerPlatform: 20,
      includeCrossMarketMatches: true,
    },
  ],
  "sec-edgar": [
    "api-market/sec-edgar-filings-tracker",
    {
      mode: "company_filings",
      tickersOrCiks: ["AAPL", "NVDA"],
      forms: ["10-K", "10-Q", "8-K"],
      maxFilings: 20,
    },
  ],
  "ats-jobs": [
    "api-market/ats-jobs-unified-scraper",
    {
      boards: ["greenhouse:stripe", "lever:palantir", "ashby:linear"],
      maxJobsPerBoard: 20,
      maxTotalJobs: 50,
    },
  ],
  "remote-jobs": [
    "api-market/remote-jobs-unified-scraper",
    {
      sources: ["remoteok", "remotive", "jobicy", "arbeitnow"],
      remoteOnly: true,
      maxJobsPerSource: 20,
      maxTotalJobs: 50,
    },
  ],
  "shopify-catalog": [
    "api-market/shopify-catalog-lead-enricher",
    {
      domains: ["allbirds.com"],
      mode: "products",
      maxPagesPerStore: 1,
      maxItems: 25,
    },
  ],
  "appstore-reviews": [
    "api-market/appstore-reviews-intel",
    {
      appIds: ["389801252"],
      countries: ["us"],
      sortBy: "mostrecent",
      maxPagesPerCountry: 1,
      maxReviews: 25,
    },
  ],
  "googleplay-reviews": [
    "api-market/googleplay-reviews-intel",
    {
      appIds: ["com.instagram.android"],
      lang: "en",
      country: "us",
      sortBy: "newest",
      maxReviews: 25,
    },
  ],
  "shopify-appstore": [
    "api-market/shopify-appstore-intel",
    {
      appSlugs: ["klaviyo-email-marketing"],
      mode: "reviews",
      sortBy: "newest",
      maxPagesPerApp: 1,
      maxItems: 25,
    },
  ],
  substack: [
    "api-market/substack-publications-scraper",
    {
      mode: "posts",
      publications: [
        "www.lennysnewsletter.com",
        "newsletter.pragmaticengineer.com",
      ],
      maxPages: 1,
      maxItems: 20,
    },
  ],
  "podcast-leads": [
    "api-market/podcast-leads-email-enricher",
    {
      queries: ["saas marketing"],
      country: "us",
      maxPodcastsPerQuery: 10,
      maxTotalPodcasts: 20,
    },
  ],
  "website-contacts": [
    "api-market/website-contacts-tech-enricher",
    {
      domains: ["stripe.com", "linear.app"],
      crawlContactPages: true,
      maxPagesPerDomain: 2,
      maxDomains: 10,
    },
  ],
  usaspending: [
    "api-market/usaspending-govcon-tracker",
    {
      keywords: ["software"],
      awardType: "contracts",
      startDate: "2026-01-01",
      endDate: "2026-12-31",
      maxAwards: 20,
    },
  ],
  defillama: [
    "api-market/defillama-unified-intel",
    {
      mode: "protocols",
      maxItems: 20,
    },
  ],
  "yc-companies": [
    "api-market/yc-companies-intel",
    {
      batches: ["W26", "F26"],
      hiringOnly: true,
      maxCompanies: 20,
    },
  ],
};

function printActors() {
  console.log("Available actor keys:");
  for (const [key, [actorId]] of Object.entries(ACTORS)) {
    console.log(`  ${key.padEnd(20)} -> https://apify.com/${actorId}`);
  }
}

async function main() {
  const arg = process.argv[2] || "prediction-markets";
  if (arg === "--list" || arg === "-l" || arg === "--help" || arg === "-h") {
    printActors();
    return;
  }

  const entry = ACTORS[arg];
  if (!entry) {
    console.error(`Unknown actor key: ${arg}`);
    printActors();
    process.exitCode = 1;
    return;
  }

  const token = process.env.APIFY_TOKEN;
  if (!token) {
    console.error(
      'Missing APIFY_TOKEN environment variable.\nRun: export APIFY_TOKEN="your_apify_api_token"'
    );
    process.exitCode = 1;
    return;
  }

  let ApifyClient;
  try {
    ({ ApifyClient } = await import("apify-client"));
  } catch {
    console.error("Install dependency first: npm install apify-client");
    process.exitCode = 1;
    return;
  }

  const [actorId, runInput] = entry;
  const client = new ApifyClient({ token });
  console.log(`Running ${actorId} ...`);
  const run = await client.actor(actorId).call(runInput);
  const { items } = await client.dataset(run.defaultDatasetId).listItems();
  console.log(`Fetched ${items.length} items. Sample (first 3):`);
  console.log(JSON.stringify(items.slice(0, 3), null, 2));
}

main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
