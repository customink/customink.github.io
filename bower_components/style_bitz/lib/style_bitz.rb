require 'pathname'
require 'style_bitz/paths'
StyleBitz.append_sass_path(StyleBitz.sass_path.to_s)
StyleBitz.register_gem_sass_path 'bourbon', 'app/assets/stylesheets'
StyleBitz.register_gem_sass_path 'sassy-maps', 'sass'
StyleBitz.register_gem_sass_path 'breakpoint', 'stylesheets'
StyleBitz.register_gem_sass_path 'susy', 'sass'
require 'style_bitz/rails' if defined?(Rails)
require 'sass'

module StyleBitz

end
