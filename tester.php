<?php
/**
 * User: ethanhayon
 * Date: 10/27/12
 * Time: 12:11 AM
 */

include("lib/mysql.php");
include("lib/object_mapper.php");

$db = new Database();
$db->setup("localhost", "root", "", "ParkingManagementSystem");

$data = $db->find("parkinglots", "status='1'", "", "");
print_r($data);

print "<br />======SOME MORE TESTS=======<br />";

ObjectMapper::setDB($db);


class ParkingLots extends ObjectMapper {}

//$lot = ParkingLots::findOne("status='1'", "", "");
$lot = new ParkingLots();
print "Lot location is ". $lot->location ."<br />";
print "Is this lot new? ";
print ($lot->is_new) ? "New" : "Old";