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

		$comments = $lot->comments;
		$res['comments'] = array();
		foreach($comments as $comment) {
		  	$item = $comment->data;
			$commenter = $comment->user;
			$item['commenter'] = $commenter->fname." ".$commenter->lname;
			$res['comments'][] = $item;

		}


		$res['lot_info'] = $lot->data;
		$res['spaces'] = array();
		$res['capacity'] = 0;
		$res['available'] = 0;
		$res['lot_image'] = base64_encode($lot->image);
		$res['announcements'] = $announcements;

		foreach($spaces as $space) {
			$res['capacity']++;
			if(!$space->state)
				$res['available']++;
			array_push($res['spaces'], $space->data);
		}
		header('Content-type: application/json');
		print(json_encode($res));
	}

	function _create_announcement() {
		$lot = NULL;

		
		if(isset($_POST['id_parkinglot'])) {
			$lot = ParkingLot::findOne(array(
				'id_parkinglot' => $_POST['id_parkinglot']
			), NULL);
		}

		if(!isset($lot)) {
			header('Content-type: application/json', NULL, 400);
			print json_encode(array('status' => 'failed'));
			exit();
		}

		// create a new announcement
		$announcement = new Announcement();
		
		if(isset($_POST['announcement']))
			$announcement->announcement = $_POST['announcement'];
		
		$announcement->save();
		
		$ancmts = $lot->announcements;
		$ancmts[] = $announcement;
		$lot->announcements = $ancmts;
		header('Content-type: application/json');
		print json_encode(array('status' => 'success'));
	}

	function _update_spot_state() {
		$spot_id = $_GET['id_parkingspace'];
		$state = $_GET['state'];
		$space = ParkingSpace::findOne(array(
			'id_parkingspace' => $spot_id
		), NULL);
		
		$space->state = $state;
		$space->save();
	}

	function _add_comment() {
		$user = login_required(1);

		$lot = ParkingLot::findOne(array(
			'id_parkinglot' => $_POST['id_parkinglot']
		), NULL);

		$cmt = strip_tags($_POST['comment']);

		$comment = new Comment();
		$comment->user = $user;
		$comment->comment = $cmt;
		
		$comment->save();

		$comments = $lot->comments;
		$comments[] = $comment;

		$lot->comments = $comments;
		$lot->save();

	}
}
