# frozen_string_literal: true

# jekyll-nagymaros's gemspec declares github-pages (~> 232) as its only
# runtime dependency. jekyll-remote-theme requires every theme runtime
# dependency at build time, which is correct on GitHub Pages (where the
# gem exists as part of the Pages environment) but fails locally, because
# the meta-gem requires Ruby < 4.0.
#
# This shim filters out that single dependency so local builds work with
# stock Jekyll. It mirrors Jekyll::PluginManager#require_theme_deps and is
# harmless on GitHub Pages: the dependency is already loaded there, so
# requiring it was a no-op to begin with.

if defined?(Jekyll::PluginManager) && Jekyll::PluginManager.method_defined?(:require_theme_deps)
  Jekyll::PluginManager.class_eval do
    def require_theme_deps
      return false unless site.theme.runtime_dependencies

      site.theme.runtime_dependencies.each do |dep|
        next if %w(jekyll github-pages).include?(dep.name)

        Jekyll::External.require_with_graceful_fail(dep.name) if plugin_allowed?(dep.name)
      end
    end
  end
end
