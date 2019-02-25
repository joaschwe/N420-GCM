<?php
include("includes/db_connect.php");

$causetypesQuery = "SELECT ID, Name FROM causetypes";
$causetypeResult = mysqli_query($link, $causetypesQuery);

while ($row = mysqli_fetch_array($causetypeResult, MYSQLI_BOTH)){
    echo $row["Name"].'<br/>';
}

?>