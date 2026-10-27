# LAK 2027 Workshop Website

Participant-facing site for the LAK 2027 workshop
"A Dataset for Studying the History of Learning Analytics: A Workshop
Launching the LAK and JLA Archive".

Planning and content decisions live in `LAK27_workshop_website_plan.md`.
The exact front matter and data keys follow the
[jekyll-nagymaros documentation](https://piazzai.github.io/jekyll-nagymaros/).

## Where things live

| Path | Purpose |
|------|---------|
| `_config.yml` | Site metadata, theme, plugins. Hosted at `https://c3l-ai.github.io/problem-statements/` |
| `index.md` | Landing page: workshop description, audience, practicalities, FAQ, contact |
| `program.md` | Schedule page (`program` layout), rendered from `_data/program.yml` |
| `participants.md` | Organisers page (`participants` layout), rendered from `_data/participants.yml` |
| `_data/index.yml` | Optional: hero alerts and CTA buttons. Currently absent, so none render |
| `_data/program.yml` | Schedule: the five workshop blocks (theme expects `program.yml`, not `programme.yml`) |
| `_data/participants.yml` | Organisers with affiliations and emails |
| `_sass/_custom.scss` | Accent colour and minor overrides (theme's customisation path) |
| `_layouts/program.html`, `_layouts/participants.html` | Local overrides of the theme's layouts: the schedule accordion renders expanded, and member names link to staff profiles via a `url` field |
| `_plugins/remote_theme_deps.rb` | Local-only shim: skips the theme's `github-pages` dependency (needs Ruby < 4.0) so `jekyll build` works with stock Jekyll. Harmless on Pages |

Pages appear in the navigation bar via their `navorder` front-matter key
(the home page is reached through the header title instead). A `map.md`
venue page can be added once the room is known.

## Working locally

```sh
./serve.sh
```

Installs gems on first run (into `vendor/bundle`) and serves the site at
`http://[IP_ADDRESS]:4000`. Manual equivalent:

```sh
bundle config set --local path 'vendor/bundle'
bundle install
bundle exec jekyll serve
```

## Deployment

GitHub Pages builds the site from `main` using `.github/workflows/jekyll.yml`
and publishes it as the project site at
`https://c3l-ai.github.io/problem-statements/`. The workflow passes the Pages
base path to Jekyll so theme assets are generated under `/problem-statements/`.
`indexing: false` in `_config.yml` keeps crawlers away until launch; flip it to
`true` when publishing. TBD values (room, times, registration link, dataset DOI)
are marked neutrally in the source so they are trivial to fill in later.
