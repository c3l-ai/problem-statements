#!/usr/bin/env bash
# Serve the site locally at http://127.0.0.1:4000
set -euo pipefail
cd "$(dirname "$0")"

bundle check >/dev/null 2>&1 || {
  bundle config set --local path 'vendor/bundle'
  bundle install
}

exec bundle exec jekyll serve "$@"
