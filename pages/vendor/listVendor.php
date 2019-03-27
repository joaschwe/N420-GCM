<?php
include("includes/db_connect.php");

$vendorsQuery = "SELECT ID, Name, FedexAcctNumber, UPSAccountNumber, USPSAccountNumber, DescriptionAbout, WebsiteURL, Active FROM craftsmen";
$vendorsResult = mysqli_query($link, $vendorsQuery);

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Vendors</title>
</head>
<body>
<?php
while ($row = mysqli_fetch_array($vendorsResult, MYSQLI_BOTH)) {
    echo '<div id="' . $row["ID"] . '" value="' . $row["ID"] . '">' . $row["CauseName"] . '</div>';
}
?>
</body>
</html>
