
var printFunction = function() {
  window.print();
};

$(function(){

  $('a[data-popup]').on('click', function(e) { window.open($(this).attr('href'), "Payment", "height=600,width=550"); e.preventDefault(); });
});

