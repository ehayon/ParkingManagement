<?php
define('APP_PATH', realpath(dirname(__FILE__)));

// load in the model class
require_once(APP_PATH.'/lib/php_orm/lib/model.php');

// load in the templating engine
require_once(APP_PATH.'/lib/php_template/lib/template.php');

// load in the controller class
require_once(APP_PATH.'/lib/controller.php');

// load in all of the models
require_once(APP_PATH.'/app/models/parkinglot.php');
require_once(APP_PATH.'/app/models/comment.php');
require_once(APP_PATH.'/app/models/associations.php');

require_once(APP_PATH.'/app/controllers/parkinglots.php');

// what resource are they trying to reach?
$routes = array(
    'GET:/parkinglots' => 'ParkingLots::index'
);

// routing stuff
if(isset($_SERVER['PATH_INFO']) && isset($_SERVER['REQUEST_METHOD'])) {
    $route = $_SERVER['REQUEST_METHOD'].":".$_SERVER['PATH_INFO'];
    if(isset($routes[$route])) {
        if(is_callable($routes[$route])) {
            call_user_func($routes[$route]);
        } else {
            print "An unknown error occured - Code 101";
        }
    } else {
        print "Route not found for $route";
    }
}
