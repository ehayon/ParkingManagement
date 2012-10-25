<?php

/*********************************
 *
 * /lib/mysql.php
 *
 * A wrapper class for php mysql
 *
 *********************************
 */

class Database {

	protected $link;
	protected $connected = false;

	function setup($host="", $user="", $pass="", $db="") {
		if($link = mysql_connect($host, $user, $pass)) {
			// successfully connected to mysql server
			mysql_select_db($db, $link);
			$connected = true;
		}
	}



}
