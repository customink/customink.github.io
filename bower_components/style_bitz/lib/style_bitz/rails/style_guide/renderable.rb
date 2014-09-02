require 'rouge/plugins/redcarpet'

module StyleBitz
  module Rails
    module StyleGuide
      class Renderable < Renderer

        class HTML < Redcarpet::Render::HTML
          include Rouge::Plugins::Redcarpet
        end

        def html
          write_cache render_page
        end

        def toc
          write_cache render_toc, toc: true
        end

        private

        def render_page
          extensions = markdown_extensions
          Redcarpet::Markdown.new(HTML.new(extensions), extensions).render(source)
        end

        def render_toc
          extensions = markdown_extensions nesting_level: 2
          Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC.new(extensions), extensions).render(source)
        end

        def markdown_extensions(overrides={})
          { no_intra_emphasis: true,
            fenced_code_blocks: true,
            autolink: true,
            strikethrough: true,
            lax_spacing: true,
            superscript: true,
            with_toc_data: true }.merge(overrides)
        end

      end
    end
  end
end
