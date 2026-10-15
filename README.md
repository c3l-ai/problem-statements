# LAK 2027 Workshop Website

Participant-facing one-page site for the LAK 2027 workshop
"A Dataset for Studying the History of Learning Analytics: A Workshop
Launching the LAK and JLA Archive".

Planning and content decisions live in `LAK27_workshop_website_plan.md`.
The exact front matter and data keys follow the
[jekyll-nagymaros documentation](https://piazzai.github.io/jekyll-nagymaros/).

## Where things live

| Path | Purpose |
|------|---------|
| `_config.yml` | Site metadata, theme, plugins. `url`/`baseurl` are TBD until hosting is decided (open decision 5) |
| `index.md` | The one page, all ten sections |
| `_data/index.yml` | Hero alerts and the registration CTA button |
| `_data/program.yml` | Schedule: the five workshop blocks (theme expects `program.yml`, not `programme.yml`) |
| `_sass/_custom.scss` | Accent colour and minor overrides (theme's customisation path) |
| `_plugins/remote_theme_deps.rb` | Local-only shim: skips the theme's `github-pages` dependency (needs Ruby < 4.0) so `jekyll build` works with stock Jekyll. Harmless on Pages |

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

GitHub Pages builds Jekyll natively; `remote_theme` requires no GitHub
Actions workflow. There, the theme's `github-pages` dependency is provided
by the Pages environment itself, so `_plugins/remote_theme_deps.rb` is a
no-op. `indexing: false` in `_config.yml` keeps crawlers away until launch;
flip it to `true` when publishing. TBD values (room, times, registration
link, dataset DOI) are marked neutrally in the source so they are trivial
to fill in later.
