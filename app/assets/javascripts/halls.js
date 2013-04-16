$(function(){

  // ----------- Hall Form ---------------

  $("#hall_container").resizable({
  
    stop: function( event, ui ) {
      $("#hall_w").val(ui.size.width);
      $("#hall_h").val(ui.size.height);
    },
    grid: 10
    
  });
  
  var lastEditedW = 50;
  var lastEditedH = 50;
  var lastInsertedTid = 1;
  
  var synchronize_hidden_position_fields = function(container){
    container.find(".table_w_selector").val(container.width());
    container.find(".table_h_selector").val(container.height());
    container.find(".table_x_selector").val(container.position().left);
    container.find(".table_y_selector").val(container.position().top);
  };

  var setup_table_container = function(container){
    $(container).resizable({
      stop: function(event, ui) {
        synchronize_hidden_position_fields($(event.target));
        lastEditedW = ui.size.width;
        lastEditedH = ui.size.height;
      },
      containment: $("#hall_container"),
      grid: 10
    });
    
    $(container).draggable({
      stop: function(event, ui) {
        synchronize_hidden_position_fields($(event.target));
      },
      containment: $("#hall_container"),
      snap: "#hall_container",
      grid: [10,10]
    });
  };
  
  $(".table_container").each( function(index, element) {
    setup_table_container(element);
  });
  
  $(document).on('nested:fieldAdded', function(event){
    var container = $(event.field);
    setup_table_container(container);
    container.css("width", lastEditedW);
    container.css("height", lastEditedH);
    container.find("input[type=text]").val(lastInsertedTid++);
    synchronize_hidden_position_fields(container);
  });
  
  window.nestedFormEvents.insertFields = function(content, assoc, link) {
    return $(content).appendTo($("#hall_container"));
  }
  
  
  
  // ----------- Hall Show ---------------
  
  if ($(".hall").length > 0){
  
    var dispatcher = new WebSocketRails('localhost:3000/websocket');
  
    $(".hall").each(function(index){
        var channel = dispatcher.subscribe('hall' + $(this).attr('data-id'));
        
        channel.bind('table_update', function(table) {
          $.getScript('/halls/table_update/' + table.id);
        });
    });
  
  
  };
  
  
  
});
