<?php
/**
 * User: ethanhayon
 * Date: 10/27/12
 * Time: 12:28 AM
 */

require_once 'database_interface.php';

abstract class ObjectMapper {

    protected static $_db = null;
    protected static $table_name;
    private $data;
    public $is_new;

    public function __construct($d=array()) {
        $this->data = $d;
        $this->is_new = true;
    }

    public static function set_table_name($tbl) {
        static::$table_name = $tbl;
    }

    public function __get($attr) {
        return static::__isset($attr) ? $this->data[$attr] : null;
    }

    public function __isset($attr) {
        return isset($this->data[$attr]);
    }

    public function __set($attr, $val) {
        $this->data[$attr] = $val;
    }

    public function __unset($attr) {
        unset($this->data[$attr]);
    }

    /**
     * @param DatabaseInterface $db DataSource for this ObjectMapper
     * Set up the mapper with the DataSource $db
     */
    public static function setDB(DatabaseInterface $db) {
        static::$_db = $db;
    }

    /**
     * @return DataSource
     */
    public static function getDB() {
        return static::$_db;
    }

    /**
     * @return string Name of the object's db table
     * For example, if the name of the class is ParkingLots, name will resolve to parkinglots
     * By default, this is also assumed to be the name of the db table
     */
    public static function getName() {
        if(isset(static::$table_name)) {
            return static::$table_name;
        } else {
            return strtolower(get_called_class());
        }
    }

    /**
     * @param $conditions
     * @param $order
     * @param $limit
     * @return ObjectMapper
     */
    public static function find($conditions, $order, $limit) {
        $res = static::getDB()->find(static::getName(), $conditions, $order, $limit);
        $results = array();
        foreach($res as $result) {
            $obj = new static($result);
            $obj->is_new = false;
            $results[] = $obj;
        }
        return $results;
    }

    public static function findOne($conditions, $order) {
        $res = static::find($conditions, $order, 1);
        return (count($res) >= 1) ? $res[0] : null;
    }

    public function save() {
        if($this->is_new) {
            static::getDB()->insert(static::getName(), $this->data);
        } else {
            static::getDB()->update(static::getName(), $this->data);
        }
    }



}