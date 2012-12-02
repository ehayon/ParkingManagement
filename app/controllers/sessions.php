<?php

class Sessions extends Controller {
	
	public static function _login() {
		$username = "";
		$password = "";

		if(isset($_POST['username'])) $username = $_POST['username'];
		if(isset($_POST['password'])) $password = $_POST['password'];

		$failed = false;
			
		if(empty($username) || empty($password)) {
			$failed = true;
			add_flash('error', 'Please enter a username and password');
			Main::_index();
			return false;
		}

		$user = User::findOne(array(
			'username' => $username
		  ), NULL);
		
		if(!isset($user)) {
		  	$failed = true;
			add_flash("error", "Incorrect username/password combination");
			Main::_index();
			return false;
		}
		
		$salt = $user->password_salt;
		
		$hashed_password = crypt($password, $salt);

		$user = User::findOne(array(
			'username' => $username,
			'hashed_password' => $hashed_password,
			'password_salt' => $salt
		), NULL);

		if(!isset($user)) {
			$failed = true;
			add_flash("error", "Incorrect username/password combination");
			Main::_index();
			return false;
		}	

		$_SESSION['id_user'] = $user->id;

		Users::_dashboard();
		return true;
	}

	public static function _logout() {
		if(isset($_SESSION['id_user'])) {
			unset($_SESSION['id_user']);
			Main::_index();	
		}
		return true;
	}

}
