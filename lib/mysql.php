<?php

/*********************************
 *
 * /lib/mysql.php
 *
 * A wrapper class for php mysql
 *
 *********************************
 */

class Database implements DatabaseInterface {

	protected $link;
	protected $connected;

	function setup($host, $user, $pass, $db) {
		if($link = mysql_connect($host, $user, $pass)) {
			// successfully connected to mysql server
			mysql_select_db($db, $link);
			$connected = true;
		}
	}
    function connect($host, $user, $pass){

    }
    function disconnect() {

    }
    function select_db($db) {

    }
    function select($tbl, $conditions) {

    }
    function insert($tbl, $data) {

    }
    function delete($tbl, $conditions) {

    }

    function __construct() {
        $connected = false;

    }

    function __destruct() {

    }



}
