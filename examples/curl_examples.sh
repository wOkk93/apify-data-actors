#!/usr/bin/env bash
# Synchronous REST API quickstart examples for all 14 api-market Apify Data Actors.
#
# Usage:
#   export APIFY_TOKEN="your_apify_api_token"
#   bash examples/curl_examples.sh --list
#   bash examples/curl_examples.sh prediction-markets

set -euo pipefail

KEY="${1:-prediction-markets}"

print_list() {
  cat <<'EOF'
Available actor keys:
  prediction-markets -> api-market~prediction-markets-unified
  sec-edgar          -> api-market~sec-edgar-filings-tracker
  ats-jobs           -> api-market~ats-jobs-unified-scraper
  remote-jobs        -> api-market~remote-jobs-unified-scraper
  shopify-catalog    -> api-market~shopify-catalog-lead-enricher
  appstore-reviews   -> api-market~appstore-reviews-intel
  googleplay-reviews -> api-market~googleplay-reviews-intel
  shopify-appstore   -> api-market~shopify-appstore-intel
  substack           -> api-market~substack-publications-scraper
  podcast-leads      -> api-market~podcast-leads-email-enricher
  website-contacts   -> api-market~website-contacts-tech-enricher
  usaspending        -> api-market~usaspending-govcon-tracker
  defillama          -> api-market~defillama-unified-intel
  yc-companies       -> api-market~yc-companies-intel
EOF
}

if [[ "$KEY" == "--list" || "$KEY" == "-l" || "$KEY" == "--help" || "$KEY" == "-h" ]]; then
  print_list
  exit 0
fi

case "$KEY" in
  prediction-markets)
    ACTOR="api-market~prediction-markets-unified"
    PAYLOAD='{"platforms":["polymarket","kalshi"],"maxMarketsPerPlatform":20,"includeCrossMarketMatches":true}'
    ;;
  sec-edgar)
    ACTOR="api-market~sec-edgar-filings-tracker"
    PAYLOAD='{"mode":"company_filings","tickersOrCiks":["AAPL","NVDA"],"forms":["10-K","10-Q","8-K"],"maxFilings":20}'
    ;;
  ats-jobs)
    ACTOR="api-market~ats-jobs-unified-scraper"
    PAYLOAD='{"boards":["greenhouse:stripe","lever:palantir","ashby:linear"],"maxJobsPerBoard":20,"maxTotalJobs":50}'
    ;;
  remote-jobs)
    ACTOR="api-market~remote-jobs-unified-scraper"
    PAYLOAD='{"sources":["remoteok","remotive","jobicy","arbeitnow"],"remoteOnly":true,"maxJobsPerSource":20,"maxTotalJobs":50}'
    ;;
  shopify-catalog)
    ACTOR="api-market~shopify-catalog-lead-enricher"
    PAYLOAD='{"domains":["allbirds.com"],"mode":"products","maxPagesPerStore":1,"maxItems":25}'
    ;;
  appstore-reviews)
    ACTOR="api-market~appstore-reviews-intel"
    PAYLOAD='{"appIds":["389801252"],"countries":["us"],"sortBy":"mostrecent","maxPagesPerCountry":1,"maxReviews":25}'
    ;;
  googleplay-reviews)
    ACTOR="api-market~googleplay-reviews-intel"
    PAYLOAD='{"appIds":["com.instagram.android"],"lang":"en","country":"us","sortBy":"newest","maxReviews":25}'
    ;;
  shopify-appstore)
    ACTOR="api-market~shopify-appstore-intel"
    PAYLOAD='{"appSlugs":["klaviyo-email-marketing"],"mode":"reviews","sortBy":"newest","maxPagesPerApp":1,"maxItems":25}'
    ;;
  substack)
    ACTOR="api-market~substack-publications-scraper"
    PAYLOAD='{"mode":"posts","publications":["www.lennysnewsletter.com","newsletter.pragmaticengineer.com"],"maxPages":1,"maxItems":20}'
    ;;
  podcast-leads)
    ACTOR="api-market~podcast-leads-email-enricher"
    PAYLOAD='{"queries":["saas marketing"],"country":"us","maxPodcastsPerQuery":10,"maxTotalPodcasts":20}'
    ;;
  website-contacts)
    ACTOR="api-market~website-contacts-tech-enricher"
    PAYLOAD='{"domains":["stripe.com","linear.app"],"crawlContactPages":true,"maxPagesPerDomain":2,"maxDomains":10}'
    ;;
  usaspending)
    ACTOR="api-market~usaspending-govcon-tracker"
    PAYLOAD='{"keywords":["software"],"awardType":"contracts","startDate":"2026-01-01","endDate":"2026-12-31","maxAwards":20}'
    ;;
  defillama)
    ACTOR="api-market~defillama-unified-intel"
    PAYLOAD='{"mode":"protocols","maxItems":20}'
    ;;
  yc-companies)
    ACTOR="api-market~yc-companies-intel"
    PAYLOAD='{"batches":["W26","F26"],"hiringOnly":true,"maxCompanies":20}'
    ;;
  *)
    echo "Unknown actor key: $KEY" >&2
    print_list >&2
    exit 1
    ;;
esac

if [[ -z "${APIFY_TOKEN:-}" ]]; then
  echo 'Missing APIFY_TOKEN environment variable. Run: export APIFY_TOKEN="your_apify_api_token"' >&2
  exit 1
fi

curl -sS -X POST \
  "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items" \
  -H "Authorization: Bearer ${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${PAYLOAD}"
echo
