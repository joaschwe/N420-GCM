<?php
$addresstypeQuery = "SELECT ID, Name from addresstypes";
$addresstypeResult = mysqli_query($link, $addresstypeQuery);

$causetypesQuery = "SELECT ID, Name FROM causetypes";
$causetypeResult = mysqli_query($link, $causetypesQuery);

$statesQuery = "SELECT ID, Name, Abbreviation FROM states";
$statesResult = mysqli_query($link, $statesQuery);

?>