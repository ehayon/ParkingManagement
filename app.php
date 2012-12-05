<?php
if(!session_id()) session_start();

define('APP_PATH', realpath(dirname(__FILE__)));

// load in the model class
require_once(APP_PATH.'/lib/php_orm/lib/model.php');

// load in the templating engine
require_once(APP_PATH.'/lib/php_template/lib/template.php');

// load in the controller class
require_once(APP_PATH.'/lib/controller.php');

// load in any helpers
require_once(APP_PATH.'/lib/helpers/crypt.php');
require_once(APP_PATH.'/lib/helpers/flash.php');
require_once(APP_PATH.'/lib/helpers/sessions.php');

// load in all of the models
require_once(APP_PATH.'/app/models/parkinglot.php');
require_once(APP_PATH.'/app/models/comment.php');
require_once(APP_PATH.'/app/models/user.php');
require_once(APP_PATH.'/app/models/role.php');
require_once(APP_PATH.'/app/models/parkingspace.php');
require_once(APP_PATH.'/app/models/announcement.php');

require_once(APP_PATH.'/app/models/associations.php');

require_once(APP_PATH.'/app/controllers/parkinglots.php');
require_once(APP_PATH.'/app/controllers/users.php');
require_once(APP_PATH.'/app/controllers/main.php');
require_once(APP_PATH.'/app/controllers/sessions.php');

$db = new Database();

// credentials for mysql - this is the only place you need to change them
$db->setup("localhost", "root", "", "ParkingManagementSystem");

Model::setDB($db);

// what resource are they trying to reach?
$routes = array(
  'GET:/index' => 'Main::index',
  'GET:/signup' => 'Users::signup',
  'POST:/signup' => 'Users::create',
  'POST:/login' => 'Sessions::login',
  'GET:/logout' => 'Sessions::logout',
  'GET:/dashboard' => 'Users::dashboard',
  'GET:/parkinglots' => 'ParkingLots::index',
  'GET:/get_lots' => 'ParkingLots::get_lots',
  'GET:/get_lot' => 'ParkingLots::get_lot'
);

// routing stuff
if(isset($_SERVER['PATH_INFO']) && isset($_SERVER['REQUEST_METHOD'])) {
    $route = $_SERVER['REQUEST_METHOD'].":".$_SERVER['PATH_INFO'];
	error_log("Route: ".$route);
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
