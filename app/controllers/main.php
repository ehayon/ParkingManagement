<?php

class Main extends Controller {
	public static function _index() {
		static::use_template('index', true);

		$username = "";
		$fname = "";
		$lname = "";
		$email = "";

		if(isset($_SESSION['form_data'])) {
			if(isset($_SESSION['form_data']['username'])) 
				$username = $_SESSION['form_data']['username'];	
			if(isset($_SESSION['form_data']['fname'])) 
				$fname = $_SESSION['form_data']['fname'];	
			if(isset($_SESSION['form_data']['lname'])) 
				$lname = $_SESSION['form_data']['lname'];	
			if(isset($_SESSION['form_data']['email'])) 
				$email = $_SESSION['form_data']['email'];	
		}
		
		// clear the form data
		unset($_SESSION['form_data']);

		$user = NULL;
		if(isset($_SESSION['id_user'])) {
		  $user = User::findOne(array(
			'id_user' => $_SESSION['id_user']
		  ), NULL);
		}

		if(isset($user)) {
		  $role = $user->role;
		  $admin_link = "";
		  if($role->action > 1)
			  $admin_link = "<div class=\"admin-link\"><a href=\"./admin\">Admin Panel</a></div>";

		  $dashboard_link = "<div class=\"dashboard-link\"><a href=\"./dashboard\">Dashboard</a></div>";

$top_right =<<<EOS
	<span class="span5">
	  <div class="pull-right">
		<div>Welcome, <strong>{$user->fname} {$user->lname}</strong></div>
		{$admin_link}
		{$dashboard_link}
		<div class="logout-link"><a href="./logout">Logout</a></div>
	  </div>
	</span>
EOS;

		} else {

$top_right =<<<EOS
<div class="span5">
  <div class="row">
	  <form method="POST" action="./login">
			<div class="span2">
				<label class="bold">username</label>
				<input type="text" name="username">
			</div>

			<div class="span2">
				<label class="bold">password</label>
				<input type="password" name="password">
			</div>

			<div class="span1">
				<label>&nbsp;</label>
				<input type="submit" value="Log In" class="btn" style="margin-top: 0;">
			</div>
		</form>
	</div>
</div>
EOS;

		}

		$data = array(
			'username' => $username,
			'fname' => $fname,
			'lname' => $lname,
			'email' => $email,
			'top-right' => $top_right
		);
	
		static::render_template($data);
	}
}
