<?php
/**
 * Created by PhpStorm.
 * User: Joanna_schweiger
 * Date: 10/26/18
 * Time: 6:51 PM
 */
//require_once "config.php";
$currentPage = basename($_SERVER['SCRIPT_FILENAME']);
?>



<div class="navContainer">


    <!--HEADER-->
    <div class="container">


        <header>
            <a href="../index.php" <?php if ($currentPage == 'index.php') {echo ' id="here" ';} ?> ><img class="logo" src="../images/logos/GCM-logo-short.png"></a>
            <a href="../your_cart.php" <?php if ($currentPage == 'your_cart.php') {echo ' id="here" ';} ?> ><img class="bag" src="../images/icons/shopping-bag-solid-green.png">&nbsp;&nbsp;3</a>
        </header>


    <!--TOP NAV-->
    <nav class="top">
        <div><a href="pages/cause/registerCause.php"><span>Become a Cause</span></a></div>
        <div><a href="pages/vendor/registerVendor.php">Become a Vendor</a></div>
<!--        <div><a href="#">Sign Up</a></div>-->
        <div id="loginBtn"><a href="#">Log In</a></div>
        <div><a href="../sitemap.php">Site Map</a></div>
    </nav>

    </div>
    <nav class="bottom">
        <div <?php if ($currentPage == 'good_products.php') {echo ' id="here" class="selected prod" ';} ?> ><a href="../good_products.php">Products</a></div>
        <div <?php if ($currentPage == 'good_craftsmen.php') {echo ' id="here" class="selected craft" ';} ?> ><a href="../good_craftsmen.php">Craftsmen</a></div>
        <div <?php if ($currentPage == 'good_causes.php') {echo ' id="here" class="selected cause" ';} ?> ><a href="../good_causes.php">Causes</a></div>
        <div <?php if ($currentPage == 'about_us.php') {echo ' id="here" class="selected about" ';} ?> ><a href="../about_us.php">About</a></div>
        <div <?php if ($currentPage == 'faqs.php') {echo ' id="here" class="selected faq" ';} ?> ><a href="../faqs.php">FAQs</a></div>
    </nav>

</div>
