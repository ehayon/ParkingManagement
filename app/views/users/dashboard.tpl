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


{body}
	<div id="option">
	  <select id="parkinglot-list"  name="parkinglot-list"></select>
	</div>

	<div id="parkinglot-image">
	</div>
	<div class="parkinglot-canvas">
		<canvas id="parkinglot">
			
		</canvas>
	</div>
{/body}

{javascript-includes}
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script language="javascript" src="../public/js/dashboard.js"></script>
{/javascript-includes}
