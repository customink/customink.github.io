module StyleBitz
  module Rails
    module StyleGuide
      class Cached < Renderer

        def html
          read_cache
        end

        def toc
          read_cache toc: true
        end

      end
    end
  end
end
