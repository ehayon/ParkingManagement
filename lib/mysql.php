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

    /**
     * @param $conditions Conditions
     * @return array
     */
    public function build_sql($conditions) {
        $res = array();
        foreach($conditions as $ck => $cv) {
            $res[] = "`$ck` = '$cv'";
        }
        return $res;
    }

    /**
     * @param $tbl Table
     * @param array $conditions Conditions
     * @param null $order Order
     * @param null $limit Limit
     * @return array Response as associative array
     */
    public function find($tbl, array $conditions, $order=null, $limit=null) {
        if($this->connected) {
            $sql = "SELECT * FROM $tbl";
            if(count($conditions) > 0) {
                $sql .= " WHERE ";
                $sql .= join(" AND ", $this->build_sql($conditions));
            }
            if(isset($order)) {
                $sql .= " ORDER BY $order";
            }
            if(isset($limit)) {
                $sql .= " LIMIT $limit";
            }

            $res = mysql_query($sql, $this->link) or die (mysql_error());
            $data = array();
            while($row = mysql_fetch_assoc($res)) {
                $row['id'] = $row[$this->get_primary_key($tbl)];
                array_push($data, $row);
            }
            return $data;
        }
    }

    public function findOne($tbl, $conditions, $order) {
        $res = $this->find($tbl, $conditions, $order, 1);
        return (count($res) >= 1) ? $res[0] : null;
    }

    /**
     * @param $tbl Table
     * @param $data Data
     */
    public function insert($tbl, &$data) {
        // build an insert query
        $pk = $this->get_primary_key($tbl);
        $fields = array();
        $elements = array();
        foreach($data as $k => $v) {
            $fields[] = $k;
            $elements[] = $v;
        }
        $sql = "INSERT INTO $tbl ";
        $sql .= "(".join(",", $fields).") ";
        $sql .= "VALUES('".join("','", $elements)."')";
        $res = mysql_query($sql, $this->link);
        // update the data with the id of the newly inserted item
        $pkd = mysql_insert_id($this->link);
        $data = $this->findOne($tbl, array($pk => $pkd), null);
    }

    public function delete($tbl, $conditions) {

    }

    /**
     * @param $tbl Table
     * @return null | string Primary key for table $tbl
     */
    public function get_primary_key($tbl) {
        if($this->connected) {
            $res = mysql_query("DESCRIBE $tbl");
            while($row = mysql_fetch_assoc($res)) {
                if(isset($row["Key"]) && $row["Key"] == "PRI")
                    return $row["Field"];
            }
            return null;
        }
    }

    public function update($tbl, &$data, $conditions=array()) {
        // use the primary key for the conditions
        unset($data['id']);
        $pk = $this->get_primary_key($tbl);
        $conditions = array_merge(array($pk => $data[$pk]), $conditions);

        $u_data = $this->build_sql($data);

        $sql = "UPDATE $tbl SET ";
        $sql .= join(",", $u_data);
        if(count($conditions) > 0) {
            $sql .= " WHERE ";
            $sql .= join(" AND ", $this->build_sql($conditions));
        }
        $res = mysql_query($sql, $this->link);
    }

    public function __construct() {
        $this->connected = false;
        $this->link = null;
    }

    public function __destruct() {
        mysql_close($this->link);
        $this->link = null;
        $this->connected = false;
    }



}
