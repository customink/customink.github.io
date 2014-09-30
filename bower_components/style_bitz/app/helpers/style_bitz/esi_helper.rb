module StyleBitz
  module EsiHelper

    def sb_render_esi(path, options={})
      if respond_to?(:render_esi) && !request.ssl? && !Rails.env.development? && !Rails.env.test?
        render_esi(path, options)
      else
        sb_render_esi_local(path)
      end
    end


    private

    def sb_render_esi_local(path, options={})
      render partial: "style_bitz/esi/#{path}"
    end

  end
end
