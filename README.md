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

GitHub Actions deploys the site to GitHub Pages using `.github/workflows/pages.yml` whenever you push to `main` or `staging`, or when you run the workflow manually from GitHub.

The workflow builds two versions and publishes them together:

- `main` → `https://vintitres.github.io/`
- `staging` → `https://vintitres.github.io/staging/`

In the repository settings, make sure **Settings → Pages → Build and deployment → Source** is set to **GitHub Actions**.

For staging deployments to trigger on pushes to `staging`, the `staging` branch must also contain `.github/workflows/pages.yml`.
