module StyleBitz
  module CoreHelper

    include TtarpHelper

    def sb_head
      render partial: 'style_bitz/core/head'
    end

    def sb_page_title
      content_for?(:sb_page_title) ? content_for(:sb_page_title).gsub(/<.*>/,'').strip : sb_page_title_default
    end

    def sb_header
      render partial: 'style_bitz/core/header'
    end

    def sb_footer
      render partial: 'style_bitz/core/footer'
    end

    def sb_liveperson_link_to(*args)
      options = args.extract_options!
      link_text = args.first || '' unless block_given?
      image_url_base = request.protocol + request.host_with_port
      href = "https://server.iad.liveperson.net/hc/78638587/?cmd=file&file=visitorWantsToChat&site=78638587&byhref=1&imageUrl=#{image_url_base}/images/customink/live_chat"
      onclick = "lpButtonCTTUrl = 'https://server.iad.liveperson.net/hc/78638587/?cmd=file&file=visitorWantsToChat&site=78638587&imageUrl=#{image_url_base}/images/customink/live_chat&referrer='+escape(document.location); lpButtonCTTUrl = (typeof(lpAppendVisitorCookies) != 'undefined' ? lpAppendVisitorCookies(lpButtonCTTUrl) : lpButtonCTTUrl); lpButtonCTTUrl = ((typeof(lpMTag)!='undefined' && typeof(lpMTag.addFirstPartyCookies)!='undefined')?lpMTag.addFirstPartyCookies(lpButtonCTTUrl):lpButtonCTTUrl);window.open(lpButtonCTTUrl,'chat78638587','width=475,height=400,resizable=yes'); return false;"
      options.reverse_merge! target: 'chat78638587', onclick: onclick
      if block_given?
        link_to(href, options) { yield }
      else
        link_to link_text, href, options
      end
    end


    private

    def sb_page_title_default
      "T-Shirts - Custom T-Shirts - Shirt Screen Printers - Design Online at CustomInk"
    end

  end
end
