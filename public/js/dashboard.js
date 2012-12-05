var current_lot;
$(document).ready(function() {

	// get the imagedata - ajax call
  	// get the list of parking lots
	function update_parkinglot_list() {
	  $.get('./get_lots', function(d) {
		options = "";
		options += "<option value='0'>Select a parking lot...</option>";
		_.each(d, function(item) {
		  options += "<option value='"+item.id+"'>"+item.location+"</option>";
		});	

		$('#parkinglot-list').empty().html(options);
	  });
	}
	

  function update_parkinglot() {
	 $.get('./get_lot?id='+window.current_lot, function(d) {
      // this line creates a new image tag with the blob data and adds it to the #parkinglot-image div
      $('#parkinglot-image').empty();
      console.log(d.lot_image);
      if (typeof(d.lot_image) != "undefined") {
			  $('#parkinglot-image').html('<img id="lot-image" src="data:image/png;base64,'+d.lot_image+'" />');

        // now add the parkingspaces over the parkinglot
        _.each(d.spaces, function(d) {
          if(d.state == 1) {
            car = $("<div class='car'></div>").css('left', d.x+'px').css('top', d.y+'px');
            $('#parkinglot-image').append(car);
          }
        });

        // now add the announcements
        $("#announcements #announcements-body").empty();
        _.each(d.announcements, function(d) {
          announcement = $("<p>" + d.announcement + "</p>");
          $("#announcements #announcements-body").append(announcement);
        });
      }
      else {
        $("#announcements #announcements-body").empty();
        $("#announcements #announcements-body").html("<p>Select a parking lot to see announcements.</p>");
      }
    });
  }
	$('#parkinglot-list').on('change', function(e) {
		// perform an ajax call to ./get_lot?id=<id>
		var val = $('#parkinglot-list').val();
    window.current_lot = val;
    console.log(window.current_lot);
    update_parkinglot();	
	});

  update_parkinglot_list();
	setInterval(update_parkinglot, 2000);
});
