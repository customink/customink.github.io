(function(){

  var preTags = $('.sg-Example').next();

  preTags.each(function(){
    var preTag = $(this);
    preTag.css({
      'margin-top': 0,
      'border-top-left-radius': 0,
      'border-top-right-radius': 0
    });
  });

})();



