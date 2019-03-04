<?php
$addresstypeQuery = "SELECT ID, Name from addresstypes";
$addresstypeResult = mysqli_query($link, $addresstypeQuery);

$causetypeQuery = "SELECT ID, Name FROM causetypes";
$causetypeResult = mysqli_query($link, $causetypeQuery);

$causeQuery = "SELECT ID, CauseName FROM causes";
$causeResult = mysqli_query($link, $causeQuery);

$statesQuery = "SELECT ID, Name, Abbreviation FROM states";
$statesResult = mysqli_query($link, $statesQuery);

?>