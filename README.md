# Yojoga

This site is built with [Zola](https://www.getzola.org/).

## Editing content

- Site config: `config.toml`
- Shared layout: `templates/base.html`
- Shared `<head>`: `templates/partials/head.html`
- Header/navigation markup: `templates/partials/header.html`
- Footer markup: `templates/partials/footer.html`
- Navigation items: `data/navigation.toml`
- Class schedule data: `data/schedule.toml`
- Page content templates:
  - Home: `templates/content/home.html`
  - Contact: `templates/content/contact.html`
  - Classes: `templates/content/classes.html`
  - About yoga: `templates/content/yoga.html`
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

- Pushes to `main` build the site only. They do **not** deploy to GitHub Pages.
- Pushes to `release` build and deploy to GitHub Pages.
- Manual workflow runs deploy only when run from the `release` branch.

When deploying from `release`, the workflow publishes two builds together:

- `release` → `https://vintitres.github.io/`
- `main` → `https://vintitres.github.io/test_main/`

In the repository settings, make sure **Settings → Pages → Build and deployment → Source** is set to **GitHub Actions**.

For release deployments to trigger, the `release` branch must contain `.github/workflows/pages.yml`, and the `github-pages` environment must allow deployments from `release`.
