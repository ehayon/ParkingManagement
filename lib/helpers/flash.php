<?php

/**
 * @param $type type of message (error, notice, etc..)
 * @param $message text for the flash message
 * @return NULL
 * Add a flash message to the session
 */
function add_flash($type, $message) {
    if(!isset($_SESSION['flash'])) $_SESSION['flash'] = array();
    array_push(&$_SESSION['flash'], array('type'=>$type, 'message'=>$message));
}
