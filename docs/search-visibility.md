# Free search-visibility setup

Site: https://alberto-valdeolivas.github.io/

## Implemented on the website

- Full name, Roche role and Basel location in the opening introduction and description.
- Connected Person, WebSite and ProfilePage structured data on the homepage.
- A research overview at `/projects/random-walk-restart/`, linked from the homepage's project card and the projects page.
- A sitemap generated from published pages using the default layout, with the 404 page excluded.
- Direct website, publication and project links at the top of this repository's README.
- Google's supplied HTML verification file at `/google677150bd4a8d77c0.html`, copied without layout or metadata changes.
- Optional support for Google's alternative HTML-tag method through `_config.yml`.

These improvements support discovery and clearer identity information. They do not confirm that Google has indexed a page or guarantee search rankings.

## Google Search Console: verification file prepared; account confirmation pending

Alberto supplied this verification-file content on 14 November 2026:

```text
google-site-verification: google677150bd4a8d77c0.html
```

1. Check that https://alberto-valdeolivas.github.io/google677150bd4a8d77c0.html displays exactly the line above.
2. Open https://search.google.com/search-console/ with the Google account that supplied the file and select the **URL-prefix** property `https://alberto-valdeolivas.github.io/`.
3. In **HTML file** verification, click **Verify**.
4. Submit `sitemap.xml` in the Sitemaps section.
5. Inspect the homepage and `/projects/random-walk-restart/` with URL Inspection. Check the reported indexing status and request indexing where appropriate.

Publishing the file does not by itself confirm ownership in the account or submit a sitemap. Keep the file published after verification so Google can recheck ownership. The alternative `google_site_verification` meta-tag setting remains empty because this property is using the file method.

References: [Google ownership verification](https://support.google.com/webmasters/answer/9008080), [sitemap submission](https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap), [requesting a crawl](https://developers.google.com/search/docs/crawling-indexing/ask-google-to-recrawl).

## Profile links: account access pending

Use `https://alberto-valdeolivas.github.io/` as the website link on GitHub, Google Scholar, LinkedIn and ORCID. The GitHub public API reported an empty website field during the 14 November 2026 audit. Other profile settings have not been inspected or changed.

## Track progress

After verification, use Search Console to check which pages are indexed and whether impressions for the full name and research topics grow over time. Record the initial status before comparing later results. Indexing and ranking changes can take time; repeated indexing requests do not speed up crawling.
