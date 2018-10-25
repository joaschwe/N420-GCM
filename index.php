<?php
include_once('config.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="author" content="Joanna Schweiger">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=1, minimum-scale=1.0, maximum-scale=1.0">
    <title>GCM</title>
    <link type="text/css" rel="stylesheet" href="<?php echo URL_ROOT . '/styles.css' ?>" >
    <link type="text/css" rel="stylesheet" href="<?php echo URL_ROOT . '/hamburger.css' ?>" >
    <link rel="stylesheet" href="css/hamburger.css">
</head>


<body>


<!------- HAMBURGER NAV --------->
<!--    Made by Erik Terwan    -->
<!--   24th of November 2015   -->
<!--        MIT License        -->
<div class="hamburger">
    <div id="menuToggle">
        <!--
        A fake / hidden checkbox is used as click reciever,
        so you can use the :checked selector on it.
        -->
        <input type="checkbox"/>

        <!--
        Some spans to act as a hamburger.

        They are acting like a real hamburger,
        not that McDonalds stuff.
        -->
        <span></span>
        <span></span>
        <span></span>

        <!--
        Too bad the menu has to be inside of the button
        but hey, it's pure CSS magic.
        -->
        <ul id="menu">
            <li><a href="#">Become a Cause</a></li>
            <li><a href="#">Become a Vendor</a></li>
            <li><a href="#">Sign Up</a></li>
            <li><a href="#">Log In</a></li>
            <li>&mdash;</li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Craftsman</a></li>
            <li><a href="#">Causes</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">FAQs</a></li>
        </ul>
    </div>


</div>
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
<!--            <img class="logo" src="--><?php //echo ABSOLUTE_PATH . '/images/logos/GCM-logo-short.png' ?><!--">-->
<!--            images/logos/GCM-logo-short.png-->
            <img class="bag" src="images/icons/shopping-bag-solid-green.png">
            <a href="#">3</a>
        </header>
    </div>

    <nav class="bottom">
        <!--<div class="iconHover"><img src="images/icons/nav%20hover.png"></div>-->
        <div><a href="#">Products</a></div>
        <div><a href="#">Craftsman</a></div>
        <div><a href="#">Causes</a></div>
        <div><a href="#">About</a></div>
        <div><a href="#">FAQs</a></div>
    </nav>

</div>


<div class="container">


    <!--BANNER-->
    <div class="banner">
        <img src="images/logos/GCM-logo-w-tag.png">
        <button>Support a <span>Good</span> Cause</button>
    </div>

    <!--KNOT-->
    <div class="knotDivider">
        <div></div>
        <img class="knot" src="images/logos/GCM-knot-lines.png">
        <div></div>
    </div>

    <!--GCM DESCRIP PICS-->
    <div class="subBanner">
        <div class="section">
            <img src="images/logos/good.png">
            <h2>Good</h2>
            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                laborum.</p>
        </div>
        <div class="section">
            <img src="images/logos/cause.jpg">
            <h2>Cause</h2>
            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                laborum.</p>
        </div>
        <div class="section">
            <img src="images/logos/market.jpg">
            <h2>Market</h2>
            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                laborum.</p>
        </div>
    </div>


    <!-- GALLERY GRID -->
    <div class="Products">
        <h1>Products</h1>

        <!--GALLERY-->
        <div class="gallery">
            <div class="product">
                <img src="images/products/Botanical-Bliss-Lavendar-Castile.jpg">
                <h4>Excepteur Sint Proident</h4>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                    est laborum.</p>
                <h4 class="floatLeft">$0.00</h4>
                <p class="floatRight">SHARE</p>
                <!--<div class="middle">-->
                    <!--<h2 class="quickAdd">Quick Add</h2>-->
                <!--</div>-->

            </div>
            <div class="product">
                <img src="images/products/Botanical-Bliss-Carmanah-Castile.jpg">
                <h4>Excepteur Sint Proident</h4>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                    est laborum.</p>
                <h4 class="floatLeft">$0.00</h4>
                <p class="floatRight">SHARE</p>
            </div>
            <div class="product">
                <img src="images/products/Botanical-Bliss-Clean-Castile.jpg">
                <h4>Excepteur Sint Proident</h4>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                    est laborum.</p>
                <h4 class="floatLeft">$0.00</h4>
                <p class="floatRight">SHARE</p>
            </div>
            <div class="product">
                <img src="images/products/Botanical-Bliss-Hope-Castile.jpg">
                <h4>Excepteur Sint Proident</h4>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                    est laborum.</p>
                <h4 class="floatLeft">$0.00</h4>
                <p class="floatRight">SHARE</p>
            </div>
            <p class="more">More &#8594;</p>
        </div>

    </div>

    <!--CRAFTSMAN-->
    <div class="Craftsman">
        <h1>Craftsman</h1>

        <div class="subBannerCraft">
            <div class="section">
                <img src="images/craftsman/craftsman1.png">
                <h3>Excepteur Sint</h3>
                <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.</p>
                <p>SHARE</p>
            </div>
            <div class="section">
                <img src="images/craftsman/craftsman2.png">
                <h3>Excepteur Sint</h3>
                <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.</p>
                <p>SHARE</p>
            </div>
            <div class="section">
                <img src="images/craftsman/craftsman3.png">
                <h3>Excepteur Sint</h3>
                <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.</p>
                <p>SHARE</p>
            </div>
            <p class="more">More &#8594;</p>
        </div>


    </div>


    <!--CAUSES-->
    <div class="causeSection">
        <h1><span>Good</span> Causes</h1>
        <div class="causes">
            <div class="cause">
                <img src="images/causes/fyb.png">
                <h3>Excepteur Sint</h3>
            </div>
            <div class="cause">
                <img src="images/causes/hsefootball2.png">
                <h3>Excepteur Sint</h3>
            </div>
            <div class="cause">
                <img src="images/causes/royalsVB.png">
                <h3>Excepteur Sint</h3>
            </div>
            <div class="cause">
                <img src="images/causes/sportscomplex.png">
                <h3>Excepteur Sint</h3>
            </div>
            <p class="more">More &#8594;</p>
        </div>

    </div>

</div><!--end container-->


<!--FOOTER-->
<footer>
    <div class="contents">
        <div class="column">
            <h4>START A PROJECT</h4>
            <p>We are ready for the challenge.</p>
            <p>adobexd@mail.com</p>
        </div>
        <div class="column">
            <h4>SAY HELLO</h4>
            <p>479 Evergreen Road, <br/>
                Roseville, CA 46040</p>
            <p>345.678.9300</p>
        </div>
        <div class="column">
            <h4>JOBS</h4>
            <p>We are always looking for talent.</p>
            <p>adobexd@mail.com</p>
        </div>
        <div class="social">
            <img src="images/icons/facebookIcon.gif">
            <img src="images/icons/instaIcon.gif">
            <img src="images/icons/twitterIcon.gif">
        </div>
    </div>
</footer>


<script src="lib/jquery-3.1.1.min.js"></script>
<!--<script src="app/app.js"></script>-->


</body>
</html>
