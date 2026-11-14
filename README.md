# Alberto Valdeolivas · Personal website

[Visit the website](https://alberto-valdeolivas.github.io/) · [Publications](https://alberto-valdeolivas.github.io/publications/) · [Research software](https://alberto-valdeolivas.github.io/projects/)

A custom Jekyll portfolio for research in applied AI, spatial omics and network biology. The website is designed for the existing GitHub Pages repository, with no remote theme, frontend framework or client-side build step.

## Pages

- `/`: research directions, selected work, open-source projects and biography.
- `/publications/`: searchable selection with research-area filters, research notes and article/code/data links. Filter state can be shared through the URL, for example `/publications/?topic=ai&q=protein`.
- `/projects/`: four collaborative tools and analysis workflows.
- `/contact/`: LinkedIn, email and research profiles.
- `/404.html`: custom missing-page response.

## Preview and check

With Ruby, Bundler and Jekyll available:

```powershell
bundle exec jekyll serve
```

Open `http://127.0.0.1:4000/`. Stop the server with Ctrl+C before running a separate build against the same `_site` directory.

```powershell
bundle exec jekyll build
ruby scripts/verify_site.rb
git diff --check
```

The verification script checks generated pages, local links and fragments, asset/font references, publication ordering and counts, JSON-LD, SVG syntax and the sitemap. It does not replace a visual browser review. Check narrow and wide screens, keyboard navigation, mobile menu, combined search/filters, no-results reset and expandable research notes before publishing.

The local `Gemfile` and lockfile are intentionally ignored, matching the original project setup. A fresh clone can use this minimal `Gemfile`:

```ruby
source "https://rubygems.org"
gem "jekyll", "~> 4.4"
gem "webrick", "~> 1.8"
gem "logger", "~> 1.6"
gem "fiddle", "~> 1.1"
```

Run `bundle install` once after creating it. GitHub Pages supplies its own Jekyll environment and needs no Gemfile for branch-based builds.

## Update content

| File | Content |
| --- | --- |
| `_config.yml` | Name, role, description, profile links and email |
| `index.md` | Homepage introduction, research directions and biography |
| `_data/pubs.yml` | Exact article titles, years, summaries and DOI/code/data links |
| `_data/projects.yml` | Project descriptions, contribution labels and repository/documentation links |
| `_data/navigation.yml` | Main navigation |
| `_pages/` | Publication, project and contact pages |
| `_layouts/default.html` | Shared header, footer, metadata and structured data |
| `assets/css/site.css` | Colors, locally hosted typography and responsive layout |
| `assets/js/site.js` | Mobile menu and publication search/filter behavior |

Publications are ordered newest first in the data file. Set `selected: true` to feature an article on the homepage. `short_title` is an optional editorial heading for the homepage; the publication page always displays the exact title. Keep `topic` to `spatial`, `ai` or `networks`.

All article content and navigation work without JavaScript. With JavaScript disabled, the publication list remains fully visible and the mobile navigation remains expanded. The implementation includes keyboard focus styles, a skip link, labelled controls, reduced-motion support and print styles. No analytics, cookies or runtime requests to font providers are included.

## Artwork and sources

The scientific graphics are original vector illustrations, rather than experimental data. Rebuild them with:

```powershell
ruby scripts/generate_artwork.rb
```

On Windows, rebuild the social image with:

```powershell
./scripts/generate_social_card.ps1
```

The portrait is Alberto's LinkedIn photo, supplied by Alberto and saved locally as `assets/img/portrait-linkedin.jpg`. DM Sans and Instrument Serif are self-hosted under the licenses in `assets/fonts/`. Public research sources and structural design references are recorded in [docs/research-and-design.md](docs/research-and-design.md).

## Publish

Search Console's HTML verification file is stored at the repository root as `google677150bd4a8d77c0.html`. Keep it unchanged and published after verification. The remaining account steps are documented in [docs/search-visibility.md](docs/search-visibility.md). An optional alternative HTML-tag setting, `google_site_verification` in `_config.yml`, remains empty.

The site retains the existing `https://alberto-valdeolivas.github.io` URL and routes. After reviewing the changes, commit and push to the branch configured in GitHub **Settings → Pages** (previously `main`, root). GitHub builds the Jekyll source and publishes it; `_site/` stays ignored. This redesign does not change repository settings or create another hosting service.

## License

The repository's MIT license applies to the site code. Linked papers, software projects, the profile photograph and bundled fonts retain their respective rights and licenses.
