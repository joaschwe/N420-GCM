<?php
ini_set('display_errors', E_ALL);


//php super global $_SERVER['SCRIPT_FILENAME'] returns absolute path of file
//basename global function returns filename only in the absolute path


define("ABSOLUTE_PATH", "/home/students/joaschwe/public_html/N420-Multimedia-Proj-Dev/N420-GCM/");
define("URL_ROOT", "https://in-info-web4.informatics.iupui.edu/~joaschwe/N420-Multimedia-Proj-Dev/N420-GCM/");

//added paths for files to reference to
//url_root is absolute path on the server; this file is currently running off of a local server
define('FILENAME', 'basename($_SERVER["SCRIPT_FILENAME"]');
//define('ABSOLUTE_PATH', '/Users/Joanna_schweiger/Google Drive/IUPUI/2018 S3 - FALL/GD_N420 Multimedia Proj Dev/N420-GCM');

echo basename($_SERVER["SCRIPT_FILENAME"]) . '<br/><br/>';
echo $_SERVER["SCRIPT_FILENAME"] . '<br/><br/>';



//variables for absolute path and root
$currentPage = basename( $_SERVER['SCRIPT_FILENAME'], '.php');
$absolutePath = $_SERVER['SCRIPT_FILENAME'];



//database info
define('DB_HOST', 'localhost');
define('DB_USER', 'joaschwe');
define('DB_PASS', 'joaschwe');
define('DB_NAME', 'joaschwe_db');
?>
