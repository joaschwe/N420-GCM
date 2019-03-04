<?php
$addresstypeQuery = "SELECT ID, Name from addresstypes";
$addresstypeResult = mysqli_query($link, $addresstypeQuery);

$causetypeQuery = "SELECT ID, Name FROM causetypes";
$causetypeResult = mysqli_query($link, $causetypeQuery);

$causeQuery = "SELECT ID, CauseName FROM causes";
$causeResult = mysqli_query($link, $causeQuery);

$causesExpirationQuery = "SELECT causeschedules.ID, causeschedules.CauseID, causeschedules.StartDate, causeschedules.EndDate, causes.CauseName FROM causeschedules,causes WHERE causeschedules.CauseID IN ( SELECT distinct causes.ID FROM causes) AND causeschedules.CauseID = causes.ID;";
$causeExpirationResult = mysqli_query($link, $causesExpirationQuery);

$statesQuery = "SELECT ID, Name, Abbreviation FROM states";
$statesResult = mysqli_query($link, $statesQuery);

?>