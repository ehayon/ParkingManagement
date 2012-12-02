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

		$data = array(
			'username' => $username,
			'fname' => $fname,
			'lname' => $lname,
			'email' => $email
		);
	
		static::render_template($data);
	}
}
