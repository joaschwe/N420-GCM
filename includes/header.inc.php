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
    <link rel="stylesheet" type="text/css" href="../css/styles.css" />
    <link rel="stylesheet" type="text/css" href="../css/nav.css" />
    <link rel="stylesheet" type="text/css" href="../css/header.css" />
    <link rel="stylesheet" type="text/css" href="../css/cards.css" />
    <link rel="stylesheet" type="text/css" href="../css/fonts/clicker-font.css" />
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css" />
<!--    <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" />-->
<!--    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">-->
<!--    <link rel="stylesheet" type="text/css" href="../css/hamburger.css" />-->

    <script src="../lib/jquery-3.1.1.min.js"></script>
<!--    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>-->

</head>


<body>

<!-- The Modal -->
<div id="login-modal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">&times;</span>
            <h2>Log In</h2>
            <hr/>
        </div>
        <div class="modal-body">
            <form>
                <fieldset id="login">
                    <h1 id="welcome">Welcome Back!</h1>
                    <input class="modal-input" type="text" placeholder="Username">
                    <input class="modal-input" type="text" placeholder="Password">
                    <p>Forgot your password? Click here.</p>
                    <div class="modal-btns">
                    <button type="submit" class="modal-btn" id="user-signup">Sign Up</button>
                    <button type="submit" class="modal-btn" id="user-login">Log In</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<script>
    $("#login .modal-btn").click(function (e) {
        e.preventDefault();

    })
</script>