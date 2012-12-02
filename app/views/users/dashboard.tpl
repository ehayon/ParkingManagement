%%layout:app/views/layout.tpl%%

{title}ParkSmart Dashboard{/title}

{css}
	<link rel="stylesheet" href="../public/css/dashboard.css" />
{/css}

{top_right}
	<span class="span5">
	  <div class="pull-right">
		<div>Welcome, <strong>[fname] [lname]</strong></div>
		[admin-link]
		<div class="logout-link"><a href="./logout">Logout</a></div>
	  </div>
	</span>
{/top_right}


