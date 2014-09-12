module StyleBitz
  module Rails
    module StyleGuide
      class Renderer

        attr_reader :page

        def self.render(page)
          renderer = new(page)
          [renderer.html, renderer.toc]
        end

        def initialize(page)
          @page = page
        end

        def page_path
          StyleGuide.root.join "#{page}.md"
        end

        def source
          File.read(page_path)
        end

        def html
          raise NotImplementedError
        end

        def toc
          raise NotImplementedError
        end


        private

        def read_cache(options={})
          File.read(cache_file(options)).html_safe
        end

        def write_cache(data, options={})
          File.open(cache_file(options),'w') { |f| f.write(data) }
          data.html_safe
        end

        def cache_file(options={})
          path = StyleGuide.cache_dir.join File.basename(page_path,'.md')
          options[:toc] ? "#{path}.toc" : "#{path}.html"
        end

      end
    end
  end
end

