<?php

interface DatabaseInterface {

    function setup($host, $user, $pass, $db);
    function connect($host, $user, $pass);
    function select_db($db);
    function disconnect();
    function select($tbl, $conditions);
    function insert($tbl, $data);
    function delete($tbl, $conditions);
}