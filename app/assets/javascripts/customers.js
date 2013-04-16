$(function(){
  
  
  if ($("#customer_selection").length > 0){
  
    $("#customer_selection").autocomplete({
      source: [],
      delay: 0,
      minLength: 0
    }).focus(function() {
      $(this).autocomplete("search", "");
    });
  
    $.getJSON('/customers/autocomplete_customer_name.json', function(data){
      $("#customer_selection").autocomplete( "option", "source", data );
      $("#customer_selection").focus();
    });

  }
   
  
});
