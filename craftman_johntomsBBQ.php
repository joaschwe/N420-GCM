<?php
require './includes/header.inc.php';
require './includes/nav.inc.php';
?>


<div class="container">

    <!--about content-->
    <div class="craftmanContent">

        <!--about image-->
        <div class="flex-craft">
            <div class="craft-img">
                <img src="images/craftsman/craftHome/johnTom1.PNG">
                <div class="social-media">
                    <i class="fa-globe"></i>
                    <i class="fa-twitter"></i>
                    <i class="fa-facebook"></i>
                    <i class="fa-instagram"></i>
                </div>
            </div>


            <div class="maintitle-craft">
                <h3 class="clicker-sansSerif">John Tom's Barbecue</h3>
<!--                <h3 class="craft-subhead">sub-header</h3>-->
                <h4 class="location">Muncie, IN | a <span>Good</span> Craftsman since 2018</h4>
            </div>
        </div>
        <div class="quote-section">

            <p>
                <img src="images/icons/quote-left.png" style="margin-left:-35px; padding-right:5px;">
                John Tom Branson (pictured) had a very non-traditional background. Southerner, turned midwesterner.
                Assembly-line factory worker, turned charcoal miner. His leisure time was spent barbecuing and wood
                smoking meat, but his sauce was the real MVP. Perfecting the small-batch craft before it was a movement,
                John Tom brought his southern values to midwest flavor.
                <img src="images/icons/quote-right.png" style="margin-bottom: -18px; margin-left: 5px;">
            </p>

        </div>
    </div>


    <div class="sort">
        <p>Products by this Craftsman (4)</p>
        <div class="sort-box">
            <label for="sort-craftsman" id="inline">Sort by: </label>
            <input type="text" name="sort-craftsman" id="inline">
        </div>
    </div>

    <div class="xs">
        <div class="card-container">
            <div class="card">
                <img src="images/products/prodLand/product1.png">
                <div class="card-content">
                    <a href="clothing_accessories_&_jewelry.php"><h3>Excepteur Sint</h3></a>
                    <p>
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                        mollit
                        anim id est laborum.
                    </p>
                    <a href="#"><img class="share" src="images/icons/share1.jpg"/></a>
                </div>
            </div>
            <div class="card">
                <img src="images/products/prodLand/product2.png">
                <div class="card-content">
                    <a href="clothing_accessories_&_jewelry.php"><h3>Excepteur Sint</h3></a>
                    <p>
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                        mollit
                        anim id est laborum.
                    </p>
                    <a href="#"><img class="share" src="images/icons/share1.jpg"/></a>
                </div>
            </div>
            <div class="card">
                <img src="images/products/prodLand/product3.png">
                <div class="card-content">
                    <a href="clothing_accessories_&_jewelry.php"><h3>Excepteur Sint</h3></a>
                    <p>
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                        mollit
                        anim id est laborum.
                    </p>
                    <a href="#"><img class="share" src="images/icons/share1.jpg"/></a>
                </div>
            </div>
            <div class="card">
                <img src="images/products/prodLand/product4.png">
                <div class="card-content">
                    <a href="clothing_accessories_&_jewelry.php"><h3>Excepteur Sint</h3></a>
                    <p>
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                        mollit
                        anim id est laborum.
                    </p>
                    <a href="#"><img class="share" src="images/icons/share1.jpg"/></a>
                </div>
            </div>
        </div>
    </div>
    <p class="more"><a href="good_craftsmen.php">See All <span>Craftsmen</span></a></p>

</div><!--end container-->

<!--FOOTER-->
<?php
include './includes/footer.inc.php'
?>


<!--
h3.title {
font-family: serif;
font-size: 42px;
font-weight: normal;
text-align: left;
width:100%;
margin-bottom:10px;
color:#6b6b6b;
}
h3.title span {
color: #8DC63F;
font-style: italic;
text-decoration: none;
font-family: "ClickerScript-Regular", serif;
font-size: 54px;
text-align: left;
/*padding-left:10px;*/
}
-->