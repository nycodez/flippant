<?php
function connect($dbhost, $dbuser, $dbpass, $dbname)
{
        $conn = mysql_connect($dbhost, $dbuser, $dbpass);
        mysql_select_db($dbname, $conn);
        return $conn;
}
$conn = connect($dbhost, $dbuser, $dbpass, $dbname);
if(!$conn)
{
        echo 'No database connection.';
die();
}
function my_autoloader($class) {
	include 'classes/' . $class . '.class.php';
}
spl_autoload_register('my_autoloader');
function pr($arr)
{
	echo '<pre>';
	print_r($arr);
	echo '</pre>';
}
function bytesToSize($bytes, $precision = 0)
{
	$kilobyte = 1024;
	$megabyte = $kilobyte * 1024;
	$gigabyte = $megabyte * 1024;
	$terabyte = $gigabyte * 1024;

	if (($bytes >= 0) && ($bytes < $kilobyte)) {
		return $bytes . ' B';

	} elseif (($bytes >= $kilobyte) && ($bytes < $megabyte)) {
		return round($bytes / $kilobyte, $precision) . ' KB';

	} elseif (($bytes >= $megabyte) && ($bytes < $gigabyte)) {
		return round($bytes / $megabyte, $precision) . ' MB';

	} elseif (($bytes >= $gigabyte) && ($bytes < $terabyte)) {
		return round($bytes / $gigabyte, $precision) . ' GB';

	} elseif ($bytes >= $terabyte) {
		return round($bytes / $terabyte, $precision) . ' TB';
	} else {
		return $bytes . ' B';
	}
}
