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
    <!--TOP NAV-->
    <nav class="top">
        <div><a href="#"><span>Become a Cause</span></a></div>
        <div><a href="#">Become a Vendor</a></div>
        <div><a href="#">Sign Up</a></div>
        <div><a href="#">Log In</a></div>
    </nav>

    <!--HEADER-->
    <div class="container">
        <header>
            <a href="../index.php" <?php if ($currentPage == 'index.php') {echo ' id="here" ';} ?> ><img class="logo" src="../images/logos/GCM-logo-short.png"></a>
            <a href="../your_cart.php" <?php if ($currentPage == 'your_cart.php') {echo ' id="here" ';} ?> ><img class="bag" src="../images/icons/shopping-bag-solid-green.png">&nbsp;&nbsp;3</a>
        </header>
    </div>



    <nav class="bottom">
        <div><a href="../good_products.php" <?php if ($currentPage == 'good_products.php') {echo ' id="here" ';} ?> >Products</a>
        </div>
        <div><a href="../good_craftsmen.php" <?php if ($currentPage == 'good_craftsmen.php') {echo ' id="here" ';} ?> >Craftsman</a></div>
        <div><a href="../good_causes.php" <?php if ($currentPage == 'good_causes.php') {echo ' id="here" ';} ?> >Causes</a></div>
        <div><a href="../about_us.php" <?php if ($currentPage == 'about_us.php') {echo ' id="here" ';} ?> >About</a></div>
        <div><a href="../faqs.php" <?php if ($currentPage == 'faqs.php') {echo ' id="here" ';} ?> >FAQs</a></div>
    </nav>
</div>
