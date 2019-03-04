<?php
include("../../includes/db_connect.php");

$VendorName = $_POST["companyName"];
$FirstName = $_POST["firstName"];
$LastName = $_POST["lastName"];
$WebAddress = $_POST["websiteAddress"];
$AddressType = $_POST["addressType"];
$AddressAddress = $_POST["physicalAddress"];
$AddressCity = $_POST["physicalAddressCity"];
$AddressState = $_POST["physicalAddressState"];
$AddressZip = $_POST["physicalAddressZip"];
$LogoImage = $_POST["logoImage"];
$EmailCommunication = $_POST["emailCommunication"];
$EmailOrders = $_POST["emailOrders"];
$Phone = $_POST["phone"];
$ItemMadeInIndianaYN = $_POST["itemMadeInIndianaYN"];
$OtherPlacesSellingInput = $_POST["otherPlacesSellingInput"];
$PaymentProcessingYN= $_POST["paymentProcessingYN"];
$WholesaleDiscountTierYN = $_POST["wholesaleDiscountTierYN"];
$WholesaleDiscountInput = $_POST["wholesaleDiscountInput"];
$AdditionalShippersInput = $_POST["additionalShippersInput"];
$RateType = $_POST["rateType"];
$SignatureRequiredYN = $_POST["signatureRequiredYN"];
$AverageShippingCostInput = $_POST["averageShippingCostInput"];
$DiscountedRateShippers = $_POST["discountedRateShippers"];

echo $VendorName . '<br/>' .
$FirstName . '<br/>' .
$LastName . '<br/>' .
$WebAddress . '<br/>' .
$AddressType . '<br/>' .
$AddressAddress . '<br/>' .
$AddressCity . '<br/>' .
$AddressState . '<br/>' .
$AddressZip . '<br/>' .
$LogoImage . '<br/>' .
$EmailCommunication . '<br/>' .
$EmailOrders . '<br/>' .
$Phone . '<br/>' .
$ItemMadeInIndianaYN . '<br/>' .
$OtherPlacesSellingInput . '<br/>' .
$PaymentProcessingYN . '<br/>' .
$WholesaleDiscountTierYN . '<br/>' .
$WholesaleDiscountInput . '<br/>' .
$AdditionalShippersInput . '<br/>' .
$RateType . '<br/>' .
$SignatureRequiredYN . '<br/>' .
$AverageShippingCostInput . '<br/>' .
$DiscountedRateShippers . '<br/>';

$addCraftsmanSQL = "INSERT INTO craftsmen (Name, CauseTypeID, OtherType, ImageURL, OrganizationPurpose, Is501c3) VALUES ('" . $VendorName . "', '" . $CauseType . "', '" . $CauseTypeOther . "', '" . $ImageURL . "', '" . $Purpose . "', '" . $Is501c3 . "');";
mysqli_query($link, $addCraftsmanSQL);
$craftsmanID = mysqli_insert_id($link);

$addCraftsmanAddressSQL = "INSERT INTO addresses (AddressTypeID, CraftsmenID, FirstName, LastName, Email, PhoneNumber, Address1, City, StateID, Postal, ShipToSameAsBillTo) VALUES (".$AddressType.", ".$craftsmanID.", '".$FirstName."', '".$LastName."', '".$EmailCommunication."', '".$Phone."', '".$AddressAddress."', '".$AddressCity."', '".$AddressState."', '".$AddressZip."', '1');";
mysqli_query($link, $addCraftsmanAddressSQL);
$craftsmanAddressID = mysqli_insert_id($link);

echo $addCraftsmanSQL.'<br/>';
echo $addCraftsmanAddressSQL.'<br/>';

$deleteCraftsmanAddressSQL = "DELETE FROM addresses WHERE addresses.ID = ".$craftsmanAddressID.";";
$deleteCraftsmanSQL = "DELETE FROM craftsmen WHERE craftsmen.ID = ".$craftsmanID.";";

echo $deleteCraftsmanAddressSQL.'<br/>';
echo $deleteCraftsmanSQL.'<br/>';
?>