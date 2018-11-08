<?php
//require_once 'config.php';
//include 'title.php';

$title = basename($_SERVER['SCRIPT_FILENAME'], '.php');
$title = str_replace('_', ' ', $title);
$title = ucwords($title);

if ($title == 'Index') {
    $title = 'Welcome';
}
if ($title == 'Faqs') {
    $title = 'FAQs';
}
?>


<!--<!DOCTYPE html>-->
<!--<html lang="en">-->
<!--<head>-->
<!--    <meta charset="UTF-8">-->
<!--    <meta name="description" content="">-->
<!--    <meta name="author" content="Todd Shelton">-->
<!--    <meta name="viewport"-->
<!--          content="width=device-width, initial-scale=1.0, user-scalable=1, minimum-scale=1.0, maximum-scale=1.0">-->
<!--    <title>GCM</title>-->
<!--    <link rel="stylesheet" href="--><?php //echo ABSOLUTE_PATH; ?><!--css/styles.css">-->
<!--</head>-->


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="author" content="Joanna Schweiger">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=1, minimum-scale=1.0, maximum-scale=1.0">
    <title>GCM<?php echo '&#8212;' . $title; ?></title>
    <link rel="stylesheet" type="text/css" href="../css/styles3.css" />
    <link rel="stylesheet" type="text/css" href="../css/fonts/clicker-font.css" />
<!--    <link rel="stylesheet" type="text/css" href="../css/hamburger.css" />-->
</head>


<body>
