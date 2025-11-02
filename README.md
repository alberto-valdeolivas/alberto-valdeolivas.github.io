# Personal Site (Jekyll + Minimal Mistakes)

A modern, free personal website powered by **GitHub Pages** and the **Minimal Mistakes** theme.

## Quick start

1. Create a repository named **`alberto-valdeolivas.github.io`** on GitHub.
2. Download this folder as a ZIP and extract it locally.
3. Copy all files into the repository and push.
4. In your repo, go to **Settings → Pages** and ensure the site builds from the `main` branch (root).

> You don't need a `Gemfile` locally because we use the **remote_theme** that GitHub Pages builds for you.

## Customize

- Replace `/assets/img/avatar.jpg` with your photo (keep the same filename).
- (Optional) Add a banner image at `/assets/img/hero.jpg` (size ~2000×1200). If you don't add one, the splash will render with a solid overlay.
- Edit `_config.yml` to tweak your bio, links, and theme skin (try `air`, `contrast`, or `neon`).

## Add content

- **Publications**: Edit `_pages/publications.md`.
- **Projects**: Edit `_pages/projects.md`.
- **Blog posts**: Add markdown files under `_posts/` using `YYYY-MM-DD-title.md`.

## Custom domain (optional)

1. Buy a domain from any registrar.
2. In the repo root, create a `CNAME` file containing your domain, e.g. `alberto-valdeolivas.dev`.
3. In repo **Settings → Pages**, add the custom domain and enable HTTPS.

## Local preview (optional)

If you want to run locally:

```bash
gem install bundler jekyll
bundle init
# (Optional) Add theme gems if you want to run locally; not required for GitHub Pages.
bundle exec jekyll serve
```

## License

MIT for this starter; publications and linked code keep their original licenses.