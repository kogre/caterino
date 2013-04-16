
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
  
  var products;

  
  if ($("#quick_component_entry").length > 0) {
    
    $.getJSON('/products', function(data){
      products = data;
      $("#quick_component_entry").prop('disabled', false);
    });
    
    function parsePidEntry(str){
      var amount = str.substr(-2,1); //-2 IE 8 and earlier incompatible
      var pid = str.substr(0, str.length-2);
    
      for (var i = 0; i < products.length; i++) {
        if (products[i].pid == pid){
          var field = $("[data-product-id='"+products[i].id+"']").find(".product-component-amount-form");
          field.val(parseInt(amount));
          return;
        }
      }
      alert("Invalid PID Entry: "+str);
    };
    
    function parseHotkey(str){
      for (var i = 0; i < products.length; i++) {
        if (products[i].hotkey == str){
          $("[data-product-id='"+products[i].id+"']").click();
          return;
        }
      }
      alert("Invalid Hotkey: "+str);
    };
    
    $("#quick_component_entry").keyup(function(){
      var pidEntryMatch=/^[0-9]{2,4}\.$/;
      var hotkeyMatch=/^[a-z]{1}$/;
      
      var str = $("#quick_component_entry").val()
      
      if (pidEntryMatch.test(str)==true){
        parsePidEntry(str);
        $("#quick_component_entry").val("");
      }
      
      else if(hotkeyMatch.test(str)==true){
        parseHotkey(str);
        $("#quick_component_entry").val("");
      }

    });

  }
  
  
});
