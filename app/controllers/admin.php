<?php

class Admin extends Controller {
	function _index() {
		// any role >= 2 is an admin role
		$user = login_required(2);

		static::use_template('index', TRUE);
		
		$dashboard_link = "<div class=\"dashboard-link\"><a href=\"./dashboard\">Dashboard</a></div>";

		$data = array(
			'fname' => $user->fname,
			'lname' => $user->lname,
			'dashboard-link' => $dashboard_link
		);

		static::render_template($data);
	}

	function _user_list() {
		$user = login_required(2);
		$users = User::find(array(), NULL, NULL);
		$user_list = array();
		foreach($users as $u) {
		  	$r = $u->role;
			$admin = (($r->action) >= 2) ? true : false;
			$user_list[] = array(
				'username' => $u->username,
				'fname' => $u->fname,
				'lname' => $u->lname,
				'email' => $u->email,
				'id_user' => $u->id,
				'admin' => $admin
			);

		}

		header('Content-type: application/json');
		print json_encode($user_list);
	}

	function _reset_password() {
		$me = login_required(2);
		header('Content-Type: application/json');	
		// reset the password for the account
		// make the password secret
		$user = NULL;
		if(isset($_GET['id_user']))
			$user = User::findOne(array(
				'id_user' => intval($_GET['id_user'])
			), NULL);

		$new_pass = blowfish('secret');

		if(!isset($user)) {
			print json_encode(array('status' => 'user not found!'));
			exit(1);
		}
		$user->hashed_password = $new_pass['hashed_password'];
		$user->password_salt = $new_pass['password_salt'];

		$user->save();
		print json_encode($user->data);
		//print json_encode(array('status' => 'ok'));
	}

	function _destroy_user() {
		$user = login_required(2);
		
		$user = NULL;
		if(isset($_GET['id_user']))
			$user = User::findOne(array(
				'id_user' => intval($_GET['id_user'])
		  	), NULL);

		$user->delete();

	}

	function _make_admin() {
		$user = login_required(2);
		
		$user = NULL;
		if(isset($_GET['id_user']))
			$user = User::findOne(array(
				'id_user' => intval($_GET['id_user'])
		  	), NULL);
		
		$role = Role::findOne(array(
			'action' => 2
		), NULL);

		$user->role = $role;

		$user->save();
	
		header('Content-Type: application/json');
		print json_encode(array('status' => 'ok'));
	}

	function _remove_admin() {
		$user = login_required(2);
		
		$user = NULL;
		if(isset($_GET['id_user']))
			$user = User::findOne(array(
				'id_user' => intval($_GET['id_user'])
		  	), NULL);
		
		$role = Role::findOne(array(
			'action' => 1
		), NULL);

		$user->role = $role;

		$user->save();
	
		header('Content-Type: application/json');
		print json_encode(array('status' => 'ok'));
	}
}
