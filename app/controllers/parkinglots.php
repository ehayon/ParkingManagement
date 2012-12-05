<?php
/**
 * User: ethanhayon
 * Date: 11/13/12
 * Time: 3:23 PM
 */
class ParkingLots extends Controller
{

    public static function _index() {
        static::use_template('index', true);
		$lot = ParkingLot::findOne(array(
			'id_parkinglot' => 1
		), NULL);
			
		$data = array(
            'username' => 'ethanhayon',
			'imgdata' => $lot->image
        );
        static::render_template($data);
    }

	public static function _get_lots() {
		$lots = ParkingLot::find(array(), NULL, NULL);
		$l = array();
		foreach($lots as $lot) {
		  array_push($l, array(
			'id' => $lot->id,
			'location' => $lot->location
		  ));
		}
		header('Content-type: application/json');
		print(json_encode($l));
	}

	public static function _get_lot() {
		$id = NULL;
		if(isset($_GET['id'])) {
			$id = $_GET['id'];
		} else {
			exit();
		}
		$lot = ParkingLot::findOne(array(
			'id_parkinglot' => $id
		), NULL);
    if(!isset($lot)) {
      exit(1);
    }
		// include the parkingspaces in the response
		$spaces = $lot->parkingspaces;
    $res = array();
    $announcements = array();

    foreach($lot->announcements as $announcement)
      array_push($announcements, $announcement->data);

		$res['lot_info'] = $lot->data;
		$res['spaces'] = array();
    $res['lot_image'] = base64_encode($lot->image);
    $res['announcements'] = $announcements;
		foreach($spaces as $space) {
			array_push($res['spaces'], $space->data);
		}
		header('Content-type: application/json');
		print(json_encode($res));
	}

}
