<?php
/**
 * User: ethanhayon
 * Date: 10/27/12
 * Time: 12:11 AM
 */

include("lib/mysql.php");
include("lib/model.php");

$db = new Database();
$db->setup("localhost", "root", "", "ParkingManagementSystem");

Model::setDB($db);


class ParkingLot extends Model {
    protected static $table_name = "parkinglots"; // we can override the table name for
}
class Comment extends Model {
    protected static $table_name = "comments"; // we can override the table name for
}


//$lot = ParkingLot::findOne("status='1'", "", "");
ParkingLot::has_one(new Comment);
$comment1 = Comment::findOne(array("id_comment"=>19), null);
$comment2 = Comment::findOne(array("id_comment"=>20), null);


$lot = ParkingLot::findOne(array("id_parkinglot"=>2), null);

$lot->location = "test lot location";
$lot->comment = $comment1;
$lot->save();
print '<br />$lot->comment = '.$lot->id_comment.'<br />';