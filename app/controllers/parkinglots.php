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

		// include the parkingspaces in the response
		$spaces = $lot->parkingspaces;
		$res = array();

		$res['lot_info'] = $lot->data;
		$res['spaces'] = array();
		foreach($spaces as $space) {
			array_push($res['spaces'], $space->data);
		}
		print(json_encode($res));
	}

}
