(function(){

  var header = $('.sg-Header'),
      toc = $('.sg-Toc'),
      tocArea = $('.sg-Toc-area'),
      tocResize = function(){
        var width = toc.width();
        tocArea.css({width: width});
      };

  // Header
  header.affix({offset: {top: 1}});

  // TOC - Resize
  $(window).resize(tocResize);
  $(tocResize);

  // TOC - Remove H1
  tocArea.find('> ul > li').each(function(){
    var h1Item = $(this);
    var h2List = h1Item.find('> ul');
    if (h2List.length) { h1Item.replaceWith(h2List.find('li')); }
  });

})();

