<?php
/**
 * Created by PhpStorm.
 * User: Joanna_schweiger
 * Date: 10/31/18
 * Time: 3:41 PM
 */

/* php super global $_SERVER['SCRIPT_FILENAME'] returns absolute path of file
basename global function returns filename only in the absolute path
*/

echo basename( $_SERVER['SCRIPT_FILENAME'] );

//function absolutePath() {
//    echo ( $_SERVER['SCRIPT_FILENAME'] );
//}
