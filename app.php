<?php

// load in the model class
require_once(realpath(dirname(__FILE__)).'/lib/php_orm/lib/model.php');

// load in the controller class
require_once(realpath(dirname(__FILE__)).'/lib/controller.php');

// load in all of the models
require_once(realpath(dirname(__FILE__)).'/app/models/parkinglot.php');
require_once(realpath(dirname(__FILE__)).'/app/models/comment.php');
require_once(realpath(dirname(__FILE__)).'/app/models/associations.php');

require_once(realpath(dirname(__FILE__)).'/app/controllers/parkinglots.php');

// what resource are they trying to reach?
$routes = array();

$routes['parkinglots'] = array(
    'method' => 'GET',
    'path'   => '/parkinglots',
    'resource' => 'ParkingLots::index'
);

// routing stuff
if(isset($_SERVER['PATH_INFO'])) {
    if(($req = $_SERVER['PATH_INFO']) && isset($routes[$req])) {
        if(is_callable($routes[$req])) {
            call_user_func($routes[$req]);
        } else {
            print "An unknown error occured - Code 101";
        }
    } else {
        print "Route not found for $req";
    }
}
