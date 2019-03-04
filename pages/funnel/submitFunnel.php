<?php
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
$EndDate = $_POST["campaignEndDate"];
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
    $EndDate . '<br/>' .
    $PeopleBenefit . '<br/>' .
    $Is501c3.'<br/>';

$addCauseSQL = "INSERT INTO causes (CauseName, CauseTypeID, OtherType, ImageURL, OrganizationPurpose, Is501c3) VALUES ('" . $CauseName . "', '" . $CauseType . "', '" . $CauseTypeOther . "', '" . $ImageURL . "', '" . $Purpose . "', '" . $Is501c3 . "');";
echo $addCauseSQL.'<br/>';

$CauseID = "1";
$addCauseAddressSQL = "INSERT INTO addresses (AddressTypeID, CauseID, FirstName, LastName, Email, PhoneNumber, BillToAddress1, BillToCity, BillToStateID, BillToPostal, ShipToSameAsBillTo, DefaultBilling, DefaultShipping) VALUES (".$AddressType.", ".$CauseID.", '".$FirstName."', '".$LastName."', '".$EmailCommunication."', '".$Phone."', '".$AddressAddress."', '".$AddressCity."', '".$AddressState."', '".$AddressZip."', '1', '1', '1');";
echo $addCauseAddressSQL.'<br/>';

$addCauseScheduleSQL = "INSERT INTO causeschedules (CauseID, StartDate, EndDate) VALUES ('".$CauseID."', 'now', '".$EndDate."');";
echo $addCauseScheduleSQL.'<br/>';

$deleteCauseScheduleSQL = "DELETE FROM causeschedules WHERE causeschedules.ID = 1;";
$deleteCauseAddressSQL = "DELETE FROM addresses WHERE addresses.ID = 1";
$deleteCauseSQL = "DELETE FROM causes WHERE causes.ID = 1";

echo $deleteCauseScheduleSQL.'<br/>';
echo $deleteCauseAddressSQL.'<br/>';
echo $deleteCauseSQL.'<br/>';
?>