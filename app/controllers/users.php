<?php

class Users extends Controller {

	public static function _create() {
		// create a new user
		// handle hashing the password
		// should really be done in the model, whatever
		$user = new User();

		$failed = false;

		$pass = "";
		$pass_confirmation = "";

		if(isset($_POST['password'])) {
			$pass = $_POST['password'];
			unset($_POST['password']);
		}
		if(isset($_POST['password_confirmation'])) {
			$pass_confirmation = $_POST['password_confirmation'];
			unset($_POST['password_confirmation']);
		} 

		if(empty($pass)) {
			add_flash('error', 'Please enter a password');
			$failed = true;
		}

		if(empty($pass_confirmation)) {
			add_flash('error', 'Please enter a password confirmation');
			$failed = true;
		}

		if($pass != $pass_confirmation) {
			add_flash('error', 'Password and confirmation do not match');
			$failed = true;
		}

		// make sure this username is not already used
		if(User::findOne(array('username' => $_POST['username']), NULL)) {
			add_flash('error', 'Username already taken :(');
			$failed = true;
		}
		
		// bail the fuck out.. something bad happened
		if($failed) {
			// and back to the signup page we go...
			$_SESSION['form_data'] = $_POST;	
			Main::_signup();
			return false;
		}

		// by this point the passwords should exist and match
		$pass = blowfish($pass);

		if(isset($_POST['username'])) $user->username = $_POST['username'];	
		if(isset($_POST['fname'])) $user->fname = $_POST['fname'];	
		if(isset($_POST['lname'])) $user->lname = $_POST['lname'];
		if(isset($_POST['email'])) $user->email = $_POST['email'];
		if(isset($pass)) $user->hashed_password = $pass['hashed_password'];
		if(isset($pass)) $user->password_salt = $pass['password_salt'];

		if(!($user->save())) {
			// an error occured...
			foreach($user->validation_errors as $err)
				add_flash('error', $err['attr']." ".$err['error']);
			$_SESSION['form_data'] = $_POST;	
			Main::_signup();
		}
		add_flash('notice', 'User successfully created!');

	}
}
