var current_lot;
var clean=false;

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
		var fade = false;
		if(!window.clean) fade = true;
		if(window.current_lot != '0' && typeof(window.current_lot) != 'undefined') {
			$.ajax({
				method: 'get',
				url: './get_lot?id='+window.current_lot,
				success: function(d) {
					// this line creates a new image tag with the blob data and adds it to the #parkinglot-image div
					$('#parkinglot-image').empty();
					$('#parkinglot-image').hide().html("<div class='loading'></div>");
					if (typeof(d.lot_image) != "undefined") {
						$('#parkinglot-image').html('<img id="lot-image" src="data:image/png;base64,'+d.lot_image+'" />');
						$('#parkinglot-name').html('<h4>'+d.lot_info.location+'</h4>');
						// now add the parkingspaces over the parkinglot
						_.each(d.spaces, function(e) {
							if(e.state == 1) {
								car = $("<div class='car'></div>").css('left', e.x+'px').css('top', e.y+'px').css('-webkit-transform', 'rotate('+e.rot+'deg)');
								$('#parkinglot-image').append(car);
							}
						});
						// load the lot description
						$("#lot-description").html(d.lot_info.description);

						$('#capacity-data').html(d.capacity);
						$('#available-data').html(d.available);
						$('#capacity-label').html('capacity');
						$('#available-label').html('available');
						
						// now add the announcements
						$("#announcements #announcements-body").hide().empty();
						_.each(d.announcements, function(d) {
							announcement = $("<p class='date'><strong>"+d.created_at+" </strong></p>" + d.announcement + "<hr/>");
							$("#announcements #announcements-body").append(announcement);
						});
						if(fade) {
							$('#announcements #announcements-body').fadeIn();
							$('#parkinglot-image').fadeIn('slow');
							$('#space-count').fadeIn();
						} else {
							$('#parkinglot-image').show();
							$('#space-count').show();
							$('#announcements #announcements-body').show();
						}
						window.clean = true;
					}
					else {
						$("#announcements #announcements-body").empty();
						$("#announcements #announcements-body").html("<p><strong>Select a parking lot to see announcements.</strong></p>");
					}

					// add the comments
					  $('#comments-body').empty();
					_.each(d.comments, function(comment) {
						c = $("<span><strong>"+comment.commenter+": </strong>"+comment.comment + "</span><hr/>");
						$("#comments-body").append(c);
					});

				},
				beforeSend: function() {
					// open up the loader
					if(!window.clean)
						$('#parkinglot-loader').show();
				},
				complete: function() {
					// remove the loader
					_.delay(function() {
						$('#parkinglot-loader').hide();
					}, 1500);
				}});
		}
	}
	$('#parkinglot-list').on('change', function(e) {
		// perform an ajax call to ./get_lot?id=<id>
		var val = $('#parkinglot-list').val();
		if(window.current_lot != val)
			window.clean=false;
		window.current_lot = val;
		console.log(window.current_lot);
		update_parkinglot();	
	});

	$('#add-comment').live('click', function(e) {
		if(window.current_lot != '0' && typeof(window.current_lot) != 'undefined') {
		  $('#comment-box').fadeIn('fast');
		}
	});
	
	$('#comment-box #add-comment-button').live('click', function(e) {
		$('#id_parkinglot').val(window.current_lot);
		$.ajax({
			type: 'POST',
			url: './add_comment',
			data: $(this).parent().serialize(),
			sucess: function(d) {
				update_parkinglot();
				$('#comment-content').empty();
			},
			beforeSend: function(e) {
				$('#loader').show();
			}
		});
	});

	update_parkinglot_list();
	setInterval(update_parkinglot, 1000);
});
