<?php
//require './includes/config.php';
require './includes/header.inc.php';
require './includes/nav.inc.php';

//echo $_SERVER['SCRIPT_FILENAME'];
?>

<div class="container">


    <h1 class="clicker" style="margin-bottom:50px;">Choose a <span>Good</span> Cause</h1>

        <form id="example" action="" style="margin:auto; width:70%; border: 1px solid grey; display:flex;box-sizing: border-box; background-color: white; border-radius: 3px;">
            <input id="searchInput" type="text" placeholder="Boys & Girls Club" name="search2" style="width:80%; margin:0 auto 0 auto; padding: 15px; font-size: 20px; outline:none; border:none;">
            <p id="searchBtn" style="margin:5px 0 5px 0; width:40%; font-size:20px; color:#6b6b6b; float:right; text-align: right;">
                Expires 12/05/2018
            </p>
                <i class="fa-angle-down fa-3x" id="searchCaret" style="font-family: 'FontAwesome', sans-serif; font-style: normal; margin:3px 15px 0 0; color:#8DC63F; float:right;">
                </i>
        </form>

        <div class="two-across">
            <a href="your_cart.php"><button class="backBtn">Back</button></a>
            <a href="shipping_information.php"><button class="continueBtn" type="submit">Continue to Payment</button></a>
        </div>


</div><!--end container-->

<!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>




