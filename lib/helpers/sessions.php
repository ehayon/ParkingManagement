<?php

function redirect_to($location) {
	header("Location: ./$location");
}

function login_required($role_level) {	
	if(!isset($_SESSION['id_user'])) {
  		// no user is logged in
		add_flash('error', 'You are not authorized to access this resource');
		redirect_to("index");
		exit();
	}

	$user = User::findOne(array(
		'id_user' => $_SESSION['id_user']
	), NULL);

	// check the role level
	$role = NULL;
	if(isset($user)) {
		$role = $user->role;
	}

	if(isset($role) && !($role->action >= $role_level)) {
		// not allowed to access this...
	  	redirect_to("dashboard");
		add_flash('error', 'You are not authorized to access this resource');
		exit();
	}
	return $user;
}
