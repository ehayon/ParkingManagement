<?php

interface DatabaseInterface {

    function setup($host, $user, $pass, $db);
    function select_db($db);
    function disconnect();
    function find($tbl, array $conditions, $order=null, $limit=null);
    function insert($tbl, &$data);
    function delete($tbl, $conditions);
}