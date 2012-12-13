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
	[flash]
  <div class="container">
    <div class="row">
      <div class="span6">
	      <div id="option">
	        <select id="parkinglot-list" name="parkinglot-list"></select>
  	  </div>
		  <div id="parkinglot-loader" class="loader"></div>
		<br />
		<hr />
		<div id="parkinglot-name"></div>
        <div id="parkinglot-image"></div>
		<div id="lot-description"></div>

		<div id="comments">
			<h3>Comments</h3>
			<input type="button" id="add-comment" value="Add Comment" />
			<div id="comment-box" style="display: none;">
				<form>
				<textarea style="margin-top: 10px; width: 555px; height: 40px;" name="comment"  id="comment-content"></textarea>
				<input type="hidden" name="id_parkinglot" id="id_parkinglot" value="" />
				<input type="button" name="add_comment_button" id="add-comment-button" value="Post" />
				</form>
			</div>
			<div id="comments-body">
				<p><strong>Select a parking lot to see comments.</strong></p>
			</div>
		</div>
      </div>
      <div id="right-pane" class="span6">
		<div id="space-count" class="span6">
		  <div id="capacity">
			  <div id="capacity-data"></div>
			  <div id="capacity-label"></div>
		  </div>
		  <div id="available">
			  <div id="available-data"></div>
			  <div id="available-label"></div>
		  </div>
		</div>

		<div id="announcements">
		  <h3>Announcements</h3>
		  <div id="announcements-body">
			<p><strong>Select a parking lot to see announcements.</strong></p>
		  </div>
		</div>


      </div>
    </div>
  </div>
{/body}

{javascript-includes}
	<script language="javascript" src="../public/js/dashboard.js"></script>
{/javascript-includes}
