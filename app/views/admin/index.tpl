%%layout:app/views/layout.tpl%%

{title}ParkSmart - Admin Interface{/title}

{top_right}
	<span class="span5">
	  <div class="pull-right">
		<div>Welcome, <strong>[fname] [lname]</strong></div>
		<div class="logout-link"><a href="./logout">Logout</a></div>
		[dashboard-link]
	  </div>
	</span>
{/top_right}

{body}
	[flash]
	<div class="container">
	  <h4>Admin Panel</h4>
	  <div id="container" class="span12">
		  <div class="row">
			  <div id="edit-parkinglot-container" class="span3">
				  <div id="option">
					  <select id="parkinglot-list" name="parkinglot-list"></select>	
				  </div>
				  <p>Select a parking lot to create an announcement</p>
				  <div id="edit-parkinglot">
					  <form id="new_announcement" action="./create_announcement" method="POST">
						  <label for="announcement">Announcement</label>
						  <textarea name="announcement"></textarea><br />
						  <input type="hidden" id="id_parkinglot" name="id_parkinglot" />
						  <input type="submit" id="submit" name="submit" value="Post Announcement" />
					  </form>
				  </div>
			  </div>
			  <div id="edit-users" class="span8">
				  <table id="users-table">
					  <tr>
						  <th>Username</th>
						  <th>First Name</th>
						  <th>Last Name</th>
						  <th>Email Address</th>
						  <th></th>
					  </tr>
				  </table>	
			  </div>
		  </div>
	  </div>
	</div>
	<script type="text/template" id="user">
		<tr>
		<td>{{username}}</td>
		<td>{{fname}}</td>
		<td>{{lname}}</td>
		<td>{{email}}</td>
		<td>
			<form class="edit-user">
				<input type="button" class="reset-password" value="Reset Password" />
				<input type="button" class="delete" value="Destroy" />
				{{^admin}}
				  <input type="button" class="make-admin" value="Make Admin" />
				{{/admin}}
				{{#admin}}
				  <input type="button" class="remove-admin" value="Remove Admin" />
				{{/admin}}
				<input type="hidden" name="id_user" value="{{id_user}}" />
			</form>
		</td>
		</tr>
	</script>
{/body}


{css}
	<link rel="stylesheet" href="../public/css/admin.css" />
{/css}
{javascript-includes}
	<script language="javascript" src="../public/js/admin.js"></script>
{/javascript-includes}
