# yojoga

Static site built with [Zola](https://www.getzola.org/).

## Editing page content

For normal content changes, edit only the Markdown files in `content/`:

- Home: `content/_index.md`
- Contact: `content/kontakt.md`
- Classes: `content/zajecia.md`
- About yoga: `content/o-jodze.md`

Markdown internal links should use Zola's page-link syntax so they work both on production and
`/test_main/`:

```md
- [Kontakt](@/kontakt.md)
- [Zajęcia](@/zajecia.md)
- [O Jodze](@/o-jodze.md)
```

External links use normal Markdown:

```md
[Instagram](https://www.instagram.com/yojogapol)
```

Raw HTML can be placed directly in Markdown when needed. The home page contains a small example
using `<div class="html-example">...</div>`.

## Editing structured data

Use these files for values that are reused by templates/shortcodes:

- Navigation: `data/navigation.toml`
- Social links: `data/social.toml`
- Contact phone/email: `data/contact.toml`
- Class schedule: `data/schedule.toml`

The classes page uses this shortcode in Markdown:

```md
{{ schedule_table() }}
```

The contact page uses this shortcode in Markdown:

```md
{{ contact_cards() }}
```

## Layout and components

You usually do not need to edit these for content updates:

- Shared layout: `templates/base.html`
- Page content template: `templates/page.html`
- Header/head/footer and JSON-LD metadata: `templates/partials/`
- Shortcodes: `templates/shortcodes/`
- Styles: `static/style.css`
- Static assets and favicons: `static/`

## Running locally

Install Zola, then run:

```sh
zola serve
```

Open:

```text
http://127.0.0.1:1111
```

To test a production build:

```sh
zola build
```

Generated output goes to `public/`, which is ignored by git.

## Deployment

GitHub Actions uses `.github/workflows/pages.yml`.

Pushes to `main` and pushes to release tags both deploy one combined GitHub Pages artifact:

- latest release tag → `https://vintitres.github.io/`
- current `main` → `https://vintitres.github.io/test_main/`

The `/test_main/` version shows a persistent test banner. Crawlers are asked not to index it via
`static/robots.txt`.

Release tag names should match one of these patterns:

- `release-*`, for example `release-2026-06-27`
- `v*`, for example `v1.0.0`

On a `main` push, the workflow finds the latest release tag by tag creation date and keeps that
version at `/`, while refreshing `/test_main/` from `main`.

On a release tag push, the pushed tag is deployed at `/`, and current `main` is deployed at
`/test_main/`.

In GitHub, make sure **Settings → Pages → Build and deployment → Source** is set to **GitHub
Actions**.

If the `github-pages` environment uses deployment restrictions, allow the `main` branch and tags
matching `release-*` and/or `v*`.

## Creating a release

From `main`, tag the commit you want to publish and push the tag:

```sh
git checkout main
git pull
git tag release-2026-06-27
git push origin release-2026-06-27
```

Or use a version tag:

```sh
git tag v1.0.0
git push origin v1.0.0
```

Or create release in github UI
