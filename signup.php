<?php

include './includes/db_connect.php';

require './includes/header.inc.php';
require './includes/nav.inc.php';

//<form id="shipForm" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);
?>

    <div class="container">
<!--        <div class="container80">-->

            <!---shipping form--->
<!--        <i class="fa-user"></i>-->

            <form id="userForm" method="post" action="" >

                <fieldset class="shippingInfo">
                    <legend style="text-align: center; margin-bottom:20px;"><i class="fa-user fa-5x"></i></legend>

                    <label for="email" class="together">Email</label>
                    <label for="email" generated="true" class="error together"></label>
                    <input class="shipping" type="email" id="email" name="email">

                    <label for="fname">Username</label>
                    <label for="fname" generated="true" class="error together"></label>
                    <input class="shipping" type="text" id="fname" name="fname"/>

                    <label for="address">Street Address</label>
                    <label for="address" generated="true" class="error together"></label>
                    <input class="shipping" type="text" id="address" name="address"/>

                    <label for="apt">Phone Number</label>
                    <input class="shipping" type="tel" id="apt" name="apt"/>

                </fieldset>

                <fieldset class="billingInfo" style="margin-top:40px;">
                    <legend><p style="color: #8DC63F;">Create password</p></legend>

                    <label for="bill_email">Old Password</label>
                    <label for="bill_email" generated="true" class="error together"></label>
                    <input class="shipping" type="email" id="bill_email" name="bill_email">

                    <label for="bill_fname">New Password</label>
                    <label for="bill_fname" generated="true" class="error together"></label>
                    <input class="shipping" type="text" id="bill_fname" name="bill_fname"/>

                    <label for="bill_lname">Verify New Password</label>
                    <label for="bill_lname" generated="true" class="error together"></label>
                    <input class="shipping" type="text" id="bill_lname" name="bill_lname"/>


                </fieldset>
                <div class="buttons" style="margin-top:10px;">
                    <a href="index.php" style="text-decoration: none;"><button type="submit" formaction="/index.php" class="cartPg" style="font-size: 14px; width: 200px; padding:5px;">Back to Shopping</button></a>
                    <a href="index.php" style="text-decoration: none;"><button class="checkout go-checkout" type="submit" formaction="/index.php" style="font-size: 14px; width: 200px;">Save Changes</button></a>
                </div>
            </form>




<!--        </div>-->
    <!--end container80-->
    </div><!--end container-->


    <!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>