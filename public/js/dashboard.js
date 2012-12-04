$(document).ready(function() {
	// get the imagedata - ajax call
  	// get the list of parking lots
	function update_parkinglot_list() {
	  $.get('./get_lots', function(d) {
		options = "";
		options += "<option value='0'>Select a Parking Lot<option>";
		_.each(d, function(item) {
		  options += "<option value='"+item.id+"'>"+item.location+"</option>";
		});	

		$('#parkinglot-list').empty().html(options);
	  });
	}
	

	$('#parkinglot-list').on('change', function(e) {
		// perform an ajax call to ./get_lot?id=<id>
		var val = $('#parkinglot-list').val();
	  	$.get('./get_lot?id='+val, function(d) {
			$('#parkinglot-image').html('<img id="lot-image" src="data:image/png;base64,'+d.lot_image+'" />');
		});
	
	});

	update_parkinglot_list();
	//setInterval(update_parkinglot_list, 2000);
});
