<?php

class Users extends Controller {
	public static function _signup() {
		static::use_template('signup', true);
		$data = array(
		);
		static::render_template($data);
	}
	public static function _create() {
		// create a new user
		print_r($_POST);

		$user = new User($_POST);
		
		//$user->save();
	}
}
