<?php
/**
 * User: ethanhayon
 * Date: 11/13/12
 * Time: 3:22 PM
 */
abstract class Controller
{
	protected static $template;
	protected static $layout;

	public static function __callStatic($method, $arguments) {
		// do something before calling the intended method
		// useful for permission and user access
		if(is_callable("static::_".$method))
			call_user_func_array("static::_".$method, $arguments);
	}

	public static function use_template($name, $layout=true) {
		$tpl = new Template(realpath(dirname(__FILE__)).'/../app/views/'.strtolower(get_called_class()).'/'.$name.'.tpl');
		static::$template = $tpl;
		static::$layout = $layout;
	}
	public static function render_template($data) {
		// find %%layout:<path>%% 
		// render it with the template
		$tpl = new Template(realpath(dirname(__FILE__)).'/../app/views/layout.tpl');
		static::$template->values($data);
		print static::$template->render();
	}
}
