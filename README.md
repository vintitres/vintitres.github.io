# yojoga

This site is built with [Zola](https://www.getzola.org/).

## Editing content

- Site config: `config.toml`
- Shared layout: `templates/base.html`
- Shared `<head>`: `templates/partials/head.html`
- Header/navigation markup: `templates/partials/header.html`
- Footer markup: `templates/partials/footer.html`
- Navigation items: `data/navigation.toml`
- Social links: `data/social.toml`
- Class schedule data: `data/schedule.toml`
- Page content templates:
  - Home: `templates/content/home.html`
  - Contact: `templates/content/contact.html`
  - Classes: `templates/content/classes.html`
  - About yoga: Markdown body in `content/o-jodze.md`
- Public page entries:
  - Home: `content/_index.md`
  - Contact: `content/kontakt.md`
  - Classes: `content/zajecia.md`
  - About yoga: `content/o-jodze.md`

The `content/*.md` files mostly define page metadata and select the template. The visible HTML content is kept in `templates/content/` so each part is easy to modify separately.



## Running locally

Install Zola, then run:

```sh
zola serve
```

Then open `http://127.0.0.1:1111`.

To test a production build:

```sh
zola build
```

## Deployment

GitHub Actions uses `.github/workflows/pages.yml`.

Pushes to `main` and pushes to release tags both deploy one combined GitHub Pages artifact:

- latest release tag → `https://vintitres.github.io/`
- current `main` → `https://vintitres.github.io/test_main/`

Release tag names should match one of these patterns:

- `release-*`, for example `release-2026-06-27`
- `v*`, for example `v1.0.0`

On a `main` push, the workflow finds the latest release tag by tag creation date and keeps that version at `/`, while refreshing `/test_main/` from `main`.

On a release tag push, the pushed tag is deployed at `/`, and current `main` is deployed at `/test_main/`.

In the repository settings, make sure **Settings → Pages → Build and deployment → Source** is set to **GitHub Actions**.

If the `github-pages` environment uses deployment restrictions, allow the `main` branch and tags matching `release-*` and/or `v*`.

### Creating a release

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
