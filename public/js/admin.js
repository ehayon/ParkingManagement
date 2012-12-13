$(document).ready(function() {

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


	$('#parkinglot-list').on('change', function(e) {
		$('#edit-parkinglot').fadeIn('fast');	
	});

	$('form#new_announcement #submit').on('click', function(e) {
		e.preventDefault();
		$(this).parent().find('#id_parkinglot').val($('#parkinglot-list').val());
		  $.ajax({
			  type: $(this).parent().attr('method'),
			  url: $(this).parent().attr('action'),
			  data: $(this).parent().serialize(),
			  success: function(d) {
				  alert("Success!");
			  },
			  beforeSend: function() {
				  $('#loader').show();
			  }
		  });
		  console.log($(this).parent().html());
	  });

	  function load_users() {
		  $.ajax({
			  type: 'GET',
			  url: './user_list',
			  success: function(d) {
				  _.each(d, function(user) {
					  $('#users-table').append(Mustache.to_html($('#user').html(), user));
				});
			},
			beforeSend: function(e) {
				$('#loader').show();
				$('#users-table').find('tr:gt(0)').remove();
			}
		});
	}

	$('.edit-user .reset-password').live('click', function(e) {
		e.preventDefault();
		var user_id = $(this).parent().find('input[type=hidden]').val();
		// do an ajax call to ./reset_password passing along the id
		$.ajax({
			type: 'GET',
			url: './reset_password',
			data: $(this).parent().serialize(),
			success: function(d) {
				load_users();
			},
			beforeSend: function(e) {
				$('#loader').show();
			}
		});
	});

	$('.edit-user .delete').live('click', function(e) {
		e.preventDefault();
		var user_id = $(this).parent().find('input[type=hidden]').val();
		// do an ajax call to ./reset_password passing along the id
		if(confirm("Are you sure?")) {
		  $.ajax({
			  type: 'GET',
			  url: './destroy_user',
			  data: $(this).parent().serialize(),
			  success: function(d) {
				  load_users();
			  },
			  beforeSend: function(e) {
				  $('#loader').show();
			  }
		  });
		} else {
		  return false;
		}
	});

	$('.edit-user .make-admin').live('click', function(e) {
		e.preventDefault();
		var user_id = $(this).parent().find('input[type=hidden]').val();
		// do an ajax call to ./reset_password passing along the id
		$.ajax({
			type: 'GET',
			url: './make_admin',
			data: $(this).parent().serialize(),
			success: function(d) {
				load_users();
			},
			beforeSend: function(e) {
				$('#loader').show();
			}
		});
	});

	$('.edit-user .remove-admin').live('click', function(e) {
		e.preventDefault();
		var user_id = $(this).parent().find('input[type=hidden]').val();
		// do an ajax call to ./reset_password passing along the id
		$.ajax({
			type: 'GET',
			url: './remove_admin',
			data: $(this).parent().serialize(),
			success: function(d) {
				load_users();
			},
			beforeSend: function(e) {
				$('#loader').show();
			}
		});
	});


	load_users();

	$('#edit-parkinglot').hide();
	update_parkinglot_list();	

});
