require 'style_bitz/rails/style_guide/renderer'

module StyleBitz
  module Rails
    module StyleGuide

      def self.renderable?
        !!(defined?(::Redcarpet) && defined?(::Rouge))
      end

      def self.root
        StyleBitz.root.join "app/views/style_bitz/style_guide"
      end

      def self.cache_dir
        root.join "cache"
      end

      def self.clear_cache!
        Dir["#{cache_dir}/*"].each { |f| File.delete(f) if File.exists?(f) }
      end

      TemplateHandler = if renderable?
        require 'style_bitz/rails/style_guide/renderable'
        Renderable
      else
        require 'style_bitz/rails/style_guide/cached'
        Cached
      end

    end
  end
end
