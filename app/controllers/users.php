<?php

class Users extends Controller {
    public static function _signup() {
        static::use_template('signup', true);
        $data = array(
        );
        add_flash('error', 'this is an error');
        //add_flash('notice', 'this is a notice');
        static::render_template($data);
    }
    public static function _create() {
        // create a new user
        // handle hashing the password
        // should really be done in the model, whatever
        $user = new User();
        // make sure this username is not already used
        if(User::findOne(array('username' => $_POST['username']), NULL)) {
            print "Username already exists";
            return;
        }

        // make sure password and confirmation match
        if(isset($_POST['password']) && isset($_POST['password_confirmation']) && $_POST['password'] == $_POST['password_confirmation']) {
            $pass = blowfish($_POST['password']);
        }

        if(isset($_POST['username'])) $user->username = $_POST['username'];	
        if(isset($_POST['fname'])) $user->fname = $_POST['fname'];	
        if(isset($_POST['lname'])) $user->lname = $_POST['lname'];
        if(isset($_POST['email'])) $user->email = $_POST['email'];
        if(isset($pass)) $user->hashed_password = $pass['hashed_password'];
        if(isset($pass)) $user->password_salt = $pass['password_salt'];

        $user->save();
    }
}
