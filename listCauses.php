<?php
include("includes/db_connect.php");

$causesQuery = "SELECT ID, CauseName, CauseTypeID, OtherType, ImageURL, OrganizationPurpose, Is501c3, Active from causes";
$causesResult = mysqli_query($link, $causesQuery);

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<?php
while ($row = mysqli_fetch_array($causesResult, MYSQLI_BOTH)) {
    echo '<div id="addressType' . $row["ID"] . '" value="' . $row["ID"] . '">' . $row["CauseName"] . '</div>';
}
?>
</body>
</html>
