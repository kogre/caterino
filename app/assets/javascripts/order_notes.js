
$(function(){

  $(".plus-button").click(function() {
     var field = $(this).find(".product-component-amount-form");
     field.val(parseInt(field.val())+1);
  });
  
  $(".minus-button").click(function() {
     var field = $(this).parent().find(".product-component-amount-form");
     if (parseInt(field.val()) > 0){
        field.val(parseInt(field.val())-1);
     }
  });
  
  $("#customer_name").focus();
  
});
