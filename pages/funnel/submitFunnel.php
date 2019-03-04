<?php
include("../../includes/db_connect.php");

$CauseID = $_POST["selectCause"];
$FirstName = $_POST["firstName"];
$LastName = $_POST["lastName"];
$AddressType = $_POST["addressType"];
$AddressAddress = $_POST["physicalAddress"];
$AddressCity = $_POST["physicalAddressCity"];
$AddressState = $_POST["physicalAddressState"];
$AddressZip = $_POST["physicalAddressZip"];
$EmailCommunication = $_POST["emailCommunication"];
$Phone = $_POST["phone"];
$pickupDayArray = $_POST["pickupDayArray"];
$newslettersAndUpdates = $_POST["newslettersAndUpdates"];

echo $CauseID . '<br/>' .
    $FirstName.' '.
    $LastName.'<br/>'.
    $AddressType . '<br/>' .
    $AddressAddress . '<br/>' .
    $AddressCity . '<br/>' .
    $AddressState . '<br/>' .
    $AddressZip . '<br/>' .
    $EmailCommunication . '<br/>' .
    $Phone . '<br/>' .
    $newslettersAndUpdates . '<br/>';

$pickupDayJSON = '{"PickupDays": [';
foreach ($pickupDayArray as $selected){
    if (next($pickupDayArray)){
        $pickupDayJSON .= '"'.$selected.'",';
    } else {
        $pickupDayJSON .= '"'.$selected.'"';
    }
}
$pickupDayJSON .= ']}';
echo $pickupDayJSON;

$addFunnelLeaderSQL = "INSERT INTO funnel (CauseID, PickupDays, ReceiveUpdates) VALUES ('" . $CauseID . "', '" . $pickupDayJSON . "', '" . $newslettersAndUpdates . "');";
mysqli_query($link, $addFunnelLeaderSQL);
$FunnelID = mysqli_insert_id($link);

echo $addFunnelLeaderSQL .'<br/>';

$addFunnelLeaderAddressSQL = "INSERT INTO addresses (AddressTypeID, CauseID, FirstName, LastName, Email, PhoneNumber, Address1, City, StateID, Postal, ShipToSameAsBillTo) VALUES (".$AddressType.", ".$CauseID.", '".$FirstName."', '".$LastName."', '".$EmailCommunication."', '".$Phone."', '".$AddressAddress."', '".$AddressCity."', '".$AddressState."', '".$AddressZip."', '1');";
mysqli_query($link, $addFunnelLeaderAddressSQL);
$AddressID = mysqli_insert_id($link);

echo $addFunnelLeaderAddressSQL .'<br/>';


$deleteFunnelLeaderAddressSQL = "DELETE FROM addresses WHERE addresses.ID = ".$AddressID.";";
$deleteFunnelLeaderSQL = "DELETE FROM funnel WHERE funnel.ID = ".$FunnelID.";";

echo $deleteFunnelLeaderAddressSQL.'<br/>';
echo $deleteFunnelLeaderSQL.'<br/>';
?>