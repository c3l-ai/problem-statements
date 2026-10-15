# frozen_string_literal: true

source "https://rubygems.org"

# jekyll-nagymaros is loaded via remote_theme (its gemspec depends on the
# github-pages meta-gem, which requires Ruby < 4.0 and cannot be installed
# on this machine). Locally we run stock Jekyll 4 plus the plugins the
# theme needs; the github-pages dependency is skipped by
# _plugins/remote_theme_deps.rb. On GitHub Pages the full environment is
# provided natively, so no Gemfile entries are needed for production.
gem "jekyll", "~> 4.4"

gem "jekyll-remote-theme"
gem "jekyll-seo-tag"
gem "jekyll-sitemap"
