module StyleBitz
  module Rails
    class Engine < ::Rails::Engine

      isolate_namespace StyleBitz
      engine_name :style_bitz

      initializer 'style_bitz.initializers', :before => :load_config_initializers do |app|
        require 'style_bitz/rails/style_guide'
      end

      initializer 'style_bitz.assets' do |app|
        app.config.assets.precompile += %w(style_bitz/style_bitz.css style_bitz.js)
      end

      config.to_prepare do
        ::ApplicationController.helper(StyleBitz::ApplicationHelper)
      end

    end
  end
end
