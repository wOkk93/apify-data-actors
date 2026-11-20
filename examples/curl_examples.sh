#!/usr/bin/env bash
# Synchronous REST API quickstart examples for all 9 wyattearp Apify Data Actors.
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
  prediction-markets -> wyattearp~prediction-markets-unified
  sec-edgar          -> wyattearp~sec-edgar-filings-tracker
  ats-jobs           -> wyattearp~ats-jobs-unified-scraper
  remote-jobs        -> wyattearp~remote-jobs-unified-scraper
  shopify-catalog    -> wyattearp~shopify-catalog-lead-enricher
  appstore-reviews   -> wyattearp~appstore-reviews-intel
  googleplay-reviews -> wyattearp~googleplay-reviews-intel
  shopify-appstore   -> wyattearp~shopify-appstore-intel
  substack           -> wyattearp~substack-publications-scraper
EOF
}

if [[ "$KEY" == "--list" || "$KEY" == "-l" || "$KEY" == "--help" || "$KEY" == "-h" ]]; then
  print_list
  exit 0
fi

case "$KEY" in
  prediction-markets)
    ACTOR="wyattearp~prediction-markets-unified"
    PAYLOAD='{"platforms":["polymarket","kalshi"],"maxMarketsPerPlatform":20,"includeCrossMarketMatches":true}'
    ;;
  sec-edgar)
    ACTOR="wyattearp~sec-edgar-filings-tracker"
    PAYLOAD='{"mode":"company_filings","tickersOrCiks":["AAPL","NVDA"],"forms":["10-K","10-Q","8-K"],"maxFilings":20}'
    ;;
  ats-jobs)
    ACTOR="wyattearp~ats-jobs-unified-scraper"
    PAYLOAD='{"boards":["greenhouse:stripe","lever:palantir","ashby:linear"],"maxJobsPerBoard":20,"maxTotalJobs":50}'
    ;;
  remote-jobs)
    ACTOR="wyattearp~remote-jobs-unified-scraper"
    PAYLOAD='{"sources":["remoteok","remotive","jobicy","arbeitnow"],"remoteOnly":true,"maxJobsPerSource":20,"maxTotalJobs":50}'
    ;;
  shopify-catalog)
    ACTOR="wyattearp~shopify-catalog-lead-enricher"
    PAYLOAD='{"domains":["allbirds.com"],"mode":"products","maxPagesPerStore":1,"maxItems":25}'
    ;;
  appstore-reviews)
    ACTOR="wyattearp~appstore-reviews-intel"
    PAYLOAD='{"appIds":["389801252"],"countries":["us"],"sortBy":"mostrecent","maxPagesPerCountry":1,"maxReviews":25}'
    ;;
  googleplay-reviews)
    ACTOR="wyattearp~googleplay-reviews-intel"
    PAYLOAD='{"appIds":["com.instagram.android"],"lang":"en","country":"us","sortBy":"newest","maxReviews":25}'
    ;;
  shopify-appstore)
    ACTOR="wyattearp~shopify-appstore-intel"
    PAYLOAD='{"appSlugs":["klaviyo-email-marketing"],"mode":"reviews","sortBy":"newest","maxPagesPerApp":1,"maxItems":25}'
    ;;
  substack)
    ACTOR="wyattearp~substack-publications-scraper"
    PAYLOAD='{"mode":"posts","publications":["www.lennysnewsletter.com","newsletter.pragmaticengineer.com"],"maxPages":1,"maxItems":20}'
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
