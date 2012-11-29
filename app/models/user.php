<?php

class User extends Model {
    protected static $table_name = "users"; // we can override the table name for

    protected static $validates_required = array('username', 'fname', 'lname', 'email', 'hashed_password', 'password_salt');


}
