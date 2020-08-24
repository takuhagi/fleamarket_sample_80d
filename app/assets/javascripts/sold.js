$(window).on('load',function(){
  $('.image_sold').children().andSelf().contents().each(function() {
  if (this.nodeType == 3) {
  $(this).replaceWith($(this).text().replace(/(\S)/g, '<span>$1</span>'));
  }
  });
  $('.image_sold').css({'opacity':1});
  for (var i = 0; i <= $('.image_sold').children().size(); i++) {
  $('.image_sold').children('span:eq('+i+')').delay(50*i).animate({'opacity':1});
  };
  });