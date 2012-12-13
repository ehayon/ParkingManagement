<?php

function redirect_to($location) {
	header("Location: ./$location");
}

function validate_email($email) {
	//$re = "/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/";
	$re = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';
	return preg_match($re, $email);
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
	
	if(!isset($user)) {
		// user not found
		add_flash('error', 'You are not authorized to access this resource');
	  	redirect_to("index");
		exit();
	}

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
