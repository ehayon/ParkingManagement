<?php

function login_required($role_level) {	
	if(!isset($_SESSION['id_user'])) {
  		// no user is logged in
		Main::_index();
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
	  	User::_dashboard();
		exit();
	}
	return $user;
}
