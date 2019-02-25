<?php

//define('DB_HOST', 'localhost:3306');
//define('DB_USER', 'stroth7_gcm_dbAdmin');
//define('DB_PASS', 'vbRxr9BUQEN7VGw6zS7eDf5J');
//define('DB_NAME', 'stroth7_GCM');


$dbhost = 'localhost:3306';
$dbuser = 'stroth7_gcm_dbAdmin';
$dbpwd  = 'vbRxr9BUQEN7VGw6zS7eDf5J';
$dbname = 'stroth7_GCM';

$link = mysqli_connect($dbhost, $dbuser, $dbpwd, $dbname);

if (!$link) {
    die('Connect Error (' . mysqli_connect_errno() . ') '
        . mysqli_connect_error());
}

?>