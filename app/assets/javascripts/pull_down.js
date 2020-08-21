$(function() {
  $(".listsLeft__item--first").hover(function() {
  $("ul.category1").toggle();
  });
  $(".nav-category li").hover(function() {
      $(">ul", this).slideDown("fast");
  }, function() {
      $(">ul", this).hide();
  });
});

$(function() {
  $(".listsLeft__item--second").hover(function() {
  $("ul.brandsPulldown").toggle();
  });
});