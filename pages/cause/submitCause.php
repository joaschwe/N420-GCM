<a href="/">HOME</a>

<?php
include("../../includes/db_connect.php");

$CauseName = $_POST["companyName"];
$FirstName = $_POST["firstname"];
$LastName = $_POST["lastname"];
$WebAddress = $_POST["websiteAddress"];
$AddressType = $_POST["addressType"];
$AddressAddress = $_POST["physicalAddress"];
$AddressCity = $_POST["physicalAddressCity"];
$AddressState = $_POST["physicalAddressState"];
$AddressZip = $_POST["physicalAddressZip"];
$EmailCommunication = $_POST["emailCommunication"];
$Phone = $_POST["phone"];
$CauseType = $_POST["typeOfOrganization"];
$CauseTypeOther = $_POST["typeOfOrganizationOther"];
$ImageURL = "";
$Purpose = $_POST["purposeInput"];
$FundsUsed = $_POST["fundsUsed"];
$StartDate = date("Y-m-d H:i:s");
$EndDate = $_POST["campaignEndDateDate"];
$PeopleBenefit = $_POST["peopleBenefit"];
$Is501c3 = $_POST["cause501cYN"];

echo $CauseName . '<br/>' .
    $FirstName.' '.
    $LastName.'<br/>'.
    $WebAddress . '<br/>' .
    $AddressType . '<br/>' .
    $AddressAddress . '<br/>' .
    $AddressCity . '<br/>' .
    $AddressState . '<br/>' .
    $AddressZip . '<br/>' .
    $EmailCommunication . '<br/>' .
    $Phone . '<br/>' .
    $CauseType . '<br/>' .
    $CauseTypeOther . '<br/>' .
    $ImageURL . '<br/>' .
    $Purpose . '<br/>' .
    $FundsUsed . '<br/>' .
    $StartDate . '<br/>' .
    $EndDate . '<br/>' .
    $PeopleBenefit . '<br/>' .
    $Is501c3.'<br/>';

$addCauseSQL = "INSERT INTO causes (CauseName, CauseTypeID, OtherType, ImageURL, OrganizationPurpose, Is501c3) VALUES ('" . $CauseName . "', '" . $CauseType . "', '" . $CauseTypeOther . "', '" . $ImageURL . "', '" . $Purpose . "', '" . $Is501c3 . "');";
mysqli_query($link, $addCauseSQL);
$CauseID = mysqli_insert_id($link);

echo $addCauseSQL.'<br/>';

$addCauseAddressSQL = "INSERT INTO addresses (AddressTypeID, CauseID, FirstName, LastName, Email, PhoneNumber, Address1, City, StateID, Postal, ShipToSameAsBillTo) VALUES (".$AddressType.", ".$CauseID.", '".$FirstName."', '".$LastName."', '".$EmailCommunication."', '".$Phone."', '".$AddressAddress."', '".$AddressCity."', '".$AddressState."', '".$AddressZip."', '1');";
mysqli_query($link, $addCauseAddressSQL);
$AddressID = mysqli_insert_id($link);

echo $addCauseAddressSQL.'<br/>';

$addCauseScheduleSQL = "INSERT INTO causeschedules (CauseID, StartDate, EndDate) VALUES ('".$CauseID."','". $StartDate ."', '".$EndDate."');";
mysqli_query($link, $addCauseScheduleSQL);
$CauseScheduleID = mysqli_insert_id($link);

echo $addCauseScheduleSQL.'<br/>';

$deleteCauseScheduleSQL = "DELETE FROM causeschedules WHERE causeschedules.ID = ".$CauseScheduleID.";";
$deleteCauseAddressSQL = "DELETE FROM addresses WHERE addresses.ID = ".$AddressID.";";
$deleteCauseSQL = "DELETE FROM causes WHERE causes.ID = ".$CauseID.";";

echo $deleteCauseScheduleSQL.'<br/>';
echo $deleteCauseAddressSQL.'<br/>';
echo $deleteCauseSQL.'<br/>';
?>