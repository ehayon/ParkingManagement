<?php

interface DatabaseInterface {

    function setup($host, $user, $pass, $db);
    function select_db($db);
    function disconnect();
    function find($tbl, $conditions, $order, $limit);
    function insert($tbl, $data);
    function delete($tbl, $conditions);
}