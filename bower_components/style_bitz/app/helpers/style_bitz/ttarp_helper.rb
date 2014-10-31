module StyleBitz
  module TtarpHelper

    DEFAULT_NUMBER = '800-293-4232'

    def sb_ttarp_number_span
      content_tag :span, sb_ttarp_number, data: {js: 'ttarp-overrideable'}
    end

    def sb_ttarp_number
      sb_ttarp_number_override || DEFAULT_NUMBER
    end

    def sb_ttarp_number_override(value=nil)
      if value
        @sb_ttarp_number_override = value
      else
        @sb_ttarp_number_override
      end
    end

    def sb_ttarp_number_override_cookied(value)
      sb_ttarp_number_override(value)
      content_for(:sb_footer) { "<script>StyleBitz.TtarpHelper.setOverride(#{value.to_json});</script>".html_safe }
    end

  end
end
