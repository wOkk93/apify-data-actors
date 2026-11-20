#!/usr/bin/env python3
"""Quickstart runner for all 19 api-market Apify Data Actors.

Usage:
    export APIFY_TOKEN="your_apify_api_token"
    python3 examples/python_quickstart.py --list
    python3 examples/python_quickstart.py prediction-markets
"""

from __future__ import annotations

import json
import os
import sys
from typing import Any

ACTORS: dict[str, tuple[str, dict[str, Any]]] = {
    "prediction-markets": (
        "api-market/prediction-markets-unified",
        {
            "platforms": ["polymarket", "kalshi"],
            "maxMarketsPerPlatform": 20,
            "includeCrossMarketMatches": True,
        },
    ),
    "sec-edgar": (
        "api-market/sec-edgar-filings-tracker",
        {
            "mode": "company_filings",
            "tickersOrCiks": ["AAPL", "NVDA"],
            "forms": ["10-K", "10-Q", "8-K"],
            "maxFilings": 20,
        },
    ),
    "ats-jobs": (
        "api-market/ats-jobs-unified-scraper",
        {
            "boards": ["greenhouse:stripe", "lever:palantir", "ashby:linear"],
            "maxJobsPerBoard": 20,
            "maxTotalJobs": 50,
        },
    ),
    "remote-jobs": (
        "api-market/remote-jobs-unified-scraper",
        {
            "sources": ["remoteok", "remotive", "jobicy", "arbeitnow"],
            "remoteOnly": True,
            "maxJobsPerSource": 20,
            "maxTotalJobs": 50,
        },
    ),
    "shopify-catalog": (
        "api-market/shopify-catalog-lead-enricher",
        {
            "domains": ["allbirds.com"],
            "mode": "products",
            "maxPagesPerStore": 1,
            "maxItems": 25,
        },
    ),
    "appstore-reviews": (
        "api-market/appstore-reviews-intel",
        {
            "appIds": ["389801252"],
            "countries": ["us"],
            "sortBy": "mostrecent",
            "maxPagesPerCountry": 1,
            "maxReviews": 25,
        },
    ),
    "googleplay-reviews": (
        "api-market/googleplay-reviews-intel",
        {
            "appIds": ["com.instagram.android"],
            "lang": "en",
            "country": "us",
            "sortBy": "newest",
            "maxReviews": 25,
        },
    ),
    "shopify-appstore": (
        "api-market/shopify-appstore-intel",
        {
            "appSlugs": ["klaviyo-email-marketing"],
            "mode": "reviews",
            "sortBy": "newest",
            "maxPagesPerApp": 1,
            "maxItems": 25,
        },
    ),
    "substack": (
        "api-market/substack-publications-scraper",
        {
            "mode": "posts",
            "publications": [
                "www.lennysnewsletter.com",
                "newsletter.pragmaticengineer.com",
            ],
            "maxPages": 1,
            "maxItems": 20,
        },
    ),
    "podcast-leads": (
        "api-market/podcast-leads-email-enricher",
        {
            "queries": ["saas marketing"],
            "country": "us",
            "maxPodcastsPerQuery": 10,
            "maxTotalPodcasts": 20,
        },
    ),
    "website-contacts": (
        "api-market/website-contacts-tech-enricher",
        {
            "domains": ["stripe.com", "linear.app"],
            "crawlContactPages": True,
            "maxPagesPerDomain": 2,
            "maxDomains": 10,
        },
    ),
    "usaspending": (
        "api-market/usaspending-govcon-tracker",
        {
            "keywords": ["software"],
            "awardType": "contracts",
            "startDate": "2026-01-01",
            "endDate": "2026-12-31",
            "maxAwards": 20,
        },
    ),
    "defillama": (
        "api-market/defillama-unified-intel",
        {
            "mode": "protocols",
            "maxItems": 20,
        },
    ),
    "yc-companies": (
        "api-market/yc-companies-intel",
        {
            "batches": ["W26", "F26"],
            "hiringOnly": True,
            "maxCompanies": 20,
        },
    ),
    "clinicaltrials": (
        "api-market/clinicaltrials-studies-intel",
        {
            "condition": "oncology",
            "status": "RECRUITING",
            "maxStudies": 20,
        },
    ),
    "openfda": (
        "api-market/openfda-regulatory-intel",
        {
            "mode": "drug_recalls",
            "maxRecords": 20,
        },
    ),
    "wordpress-plugins": (
        "api-market/wordpress-plugins-intel",
        {
            "mode": "browse",
            "browse": "popular",
            "maxPlugins": 20,
        },
    ),
    "hn-hiring": (
        "api-market/hn-hiring-trends-scraper",
        {
            "mode": "who_is_hiring",
            "maxItems": 20,
        },
    ),
    "huggingface": (
        "api-market/huggingface-ai-intel",
        {
            "resourceType": "models",
            "sortBy": "downloads",
            "maxItems": 20,
        },
    ),
}


def print_actors() -> None:
    print("Available actor keys:")
    for key, (actor_id, _) in ACTORS.items():
        print(f"  {key:<20} -> https://apify.com/{actor_id}")


def main() -> int:
    arg = sys.argv[1] if len(sys.argv) > 1 else "prediction-markets"
    if arg in {"--list", "-l", "--help", "-h"}:
        print_actors()
        return 0

    if arg not in ACTORS:
        print(f"Unknown actor key: {arg}", file=sys.stderr)
        print_actors()
        return 1

    token = os.environ.get("APIFY_TOKEN")
    if not token:
        print(
            "Missing APIFY_TOKEN environment variable.\n"
            "Run: export APIFY_TOKEN=\"your_apify_api_token\"",
            file=sys.stderr,
        )
        return 1

    try:
        from apify_client import ApifyClient
    except ImportError:
        print("Install dependency first: pip install apify-client", file=sys.stderr)
        return 1

    actor_id, run_input = ACTORS[arg]
    client = ApifyClient(token)
    print(f"Running {actor_id} ...")
    run = client.actor(actor_id).call(run_input=run_input)
    items = list(client.dataset(run["defaultDatasetId"]).iterate_items())
    print(f"Fetched {len(items)} items. Sample (first 3):")
    print(json.dumps(items[:3], indent=2, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
