module StyleBitz
  class StyleGuideController < StyleBitz::ApplicationController

    layout :set_layout

    def show
      @page_html, @page_toc = render_page
    end

    def demo
      render "style_bitz/style_guide/pages/#{params[:demo_page]}"
    end


    private

    def current_demo_page?
      params[:demo_page].present?
    end

    def current_guide_page
      params[:page] || 'index'.downcase
    end
    helper_method :current_guide_page

    def current_guide_page_active_class(page_name)
      'is-active' if current_guide_page.starts_with?(page_name.to_s)
    end
    helper_method :current_guide_page_active_class

    def render_page
      StyleBitz::Rails::StyleGuide::TemplateHandler.render(current_guide_page)
    end

    def set_layout
      current_demo_page? ? 'style_bitz/layouts/core' : 'style_bitz/layouts/style_guide'
    end

  end
end

