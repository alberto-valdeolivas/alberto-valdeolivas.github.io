# Free search-visibility setup

Site: https://alberto-valdeolivas.github.io/

## Implemented on the website

- Full name, Roche role and Basel location in the opening introduction and description.
- Connected Person, WebSite and ProfilePage structured data on the homepage.
- A research overview at `/projects/random-walk-restart/`, linked from the homepage's project card and the projects page.
- A sitemap generated from published pages using the default layout, with the 404 page excluded.
- Direct website, publication and project links at the top of this repository's README.
- Optional Google Search Console verification through `_config.yml`.

These improvements support discovery and clearer identity information. They do not confirm that Google has indexed a page or guarantee search rankings.

## Google Search Console: account verification pending

1. Open https://search.google.com/search-console/ using the Google account that should own the property.
2. Add a **URL-prefix** property for `https://alberto-valdeolivas.github.io/`.
3. Choose **HTML tag** verification and copy its `content` value into `google_site_verification` in `_config.yml`. The tag is rendered only when this value is supplied. Alternatively, send the full tag to the assistant for deployment.
4. Build and publish the site, then click **Verify** in Search Console.
5. Submit `sitemap.xml` in the Sitemaps section.
6. Inspect the homepage and `/projects/random-walk-restart/` with URL Inspection. Check the reported indexing status and request indexing where appropriate.

The empty verification setting does not create a Search Console property or submit a sitemap. Those steps remain pending until the account is verified.

References: [Google ownership verification](https://support.google.com/webmasters/answer/9008080), [sitemap submission](https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap), [requesting a crawl](https://developers.google.com/search/docs/crawling-indexing/ask-google-to-recrawl).

## Profile links: account access pending

Use `https://alberto-valdeolivas.github.io/` as the website link on GitHub, Google Scholar, LinkedIn and ORCID. The GitHub public API reported an empty website field during the 14 November 2026 audit. Other profile settings have not been inspected or changed.

## Track progress

After verification, use Search Console to check which pages are indexed and whether impressions for the full name and research topics grow over time. Record the initial status before comparing later results. Indexing and ranking changes can take time; repeated indexing requests do not speed up crawling.
