<?php

/*********************************
 *
 * /lib/mysql.php
 *
 * A wrapper class for php mysql
 *
 *********************************
 */

include("database_interface.php");

class Database implements DatabaseInterface {

	protected $link;
	protected $connected;

	function setup($host, $user, $pass, $db) {
		if($this->link = mysql_connect($host, $user, $pass)) {
			// successfully connected to mysql server
			mysql_select_db($db, $this->link);
			$this->connected = true;
		}
	}
    function disconnect() {
        mysql_close($this->link);
    }
    function select_db($db) {

    }
    function find($tbl, $conditions, $order, $limit) {
        if($this->connected) {
            $res = mysql_query("SELECT * FROM $tbl WHERE $conditions");
            $data = array();
            while($row = mysql_fetch_assoc($res)) {
                array_push($data, $row);
            }
            return $data;
        }
    }
    function insert($tbl, $data) {

    }
    function delete($tbl, $conditions) {

    }

    function __construct() {
        $this->connected = false;
        $this->link = null;
    }

    function __destruct() {

    }



}
