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
        $data = array(
            'username' => 'ethanhayon'
        );
        static::render_template($data);
    }


}
