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
	
	function get_lot_info(id) {
		$.get('./get_lot?id='+id, function(d) {
			console.log(d);
		});
	}

	$('#parkinglot-list').on('change', function(e) {
		// perform an ajax call to ./get_lot?id=<id>
		var val = $('#parkinglot-list').val();
	  	$.get('./get_lot?id='+val, function(res) {
			console.log(res);
		});
	
	});

	get_lot_info(1);
	update_parkinglot_list();
	//setInterval(update_parkinglot_list, 2000);
});
