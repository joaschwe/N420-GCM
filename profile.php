<?php
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
                    <input class="shipping" type="email" id="email" name="email" placeholder="janedoe@gmail.com">

                    <label for="fname">Username</label>
                    <label for="fname" generated="true" class="error together"></label>
                    <input class="shipping" type="text" id="fname" name="fname" placeholder="janedoe"/>

                    <label for="address">Street Address</label>
                    <label for="address" generated="true" class="error together"></label>
                    <input class="shipping" type="text" id="address" name="address" placeholder="123 Some Street"/>

                    <label for="apt">Phone Number</label>
                    <input class="shipping" type="tel" id="apt" name="apt" placeholder="(317) 555-1828"/>

                </fieldset>

                <fieldset class="billingInfo" style="margin-top:40px;">
                    <legend><p style="color: #8DC63F;">Change password</p></legend>

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
                    <button type="submit" formaction="/index.php" class="cartPg" style="font-size: 14px; width: 200px; padding:5px;">Back To Shopping 2</button>
                    <a href="index.php" style="text-decoration: none;"><button class="cartPg" style="font-size: 14px; width: 200px; padding:5px;">Back to Shopping</button></a>
                    <a href="index.php" style="text-decoration: none;"><button class="checkout go-checkout" type="submit" style="font-size: 14px; width: 200px;">Save Changes</button></a>
                </div>
            </form>

            <div class="cart" style="width: 50%; margin:100px auto 0 auto;">
                <div class="itemCol">
                    <div class="sort" style="border-bottom: 1px solid #BCBEC0;">
                        <p style="margin-bottom:5px; font-size: 30px; font-family: 'Times New Roman', serif;">Order History</p>
                        <div class="sort-box">
                            <label for="sort-craftsman" id="inline">Sort by: </label>
                            <input type="text" name="sort-craftsman" id="inline" style="width: 200px; padding:4px; border-radius:3px;">
                        </div>
                    </div>
                    <p style="margin:20px 0 0 0; font-family: 'Times New Roman', serif; font-size: 20px;">Order #00000</p>
                    <div class="vendorItem" style="width:100%; margin:10px auto 0 auto; padding:20px; box-sizing: border-box;">

                        <div class="vendor">
                            <p class="venName">Vendor Name</p>
                            <p class="cost">$0.00</p>
                        </div>
                        <div class="item">
                            <img src="images/cart_checkout/cart-item1.png">
                            <div class="itemDescrip" style="width: 60%;">
                                <p class="itemName">item 1</p>
                                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                    mollit
                                    anim id est laborum.</p>
<!--                                 <a href="#">Remove Item</a> -->
                            </div>
                        </div>
                    </div>
                    <div class="vendorItem" style="width:100%; margin:30px auto 0 auto; padding:20px; box-sizing: border-box;">
                        <div class="vendor">
                            <p class="venName">Vendor Name</p>
                            <p class="cost">$0.00</p>
                        </div>
                        <div class="item">
                            <img src="images/cart_checkout/cart-item2.png">
                            <div class="itemDescrip">
                                <p class="itemName">item 2</p>
                                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                    mollit
                                    anim id est laborum.</p>
<!--                                 <a href="#">Remove Item</a> -->
                            </div>
                        </div>
                    </div>
                </div>

<!--                <div class="costCol">-->
<!--                    <div class="itemCost">-->
<!--                        <p>Total (2 items)</p>-->
<!--                        <p class="cost">$0.00</p>-->
<!--                    </div>-->
<!--                    <div class="single">-->
<!--                        <a href="shipping_information.php"><button>Proceed to Shipping</button></a>-->
<!--                        <a href="#">Calculate shipping</a>-->
<!--                    </div>-->
<!--                </div>-->

            </div><!-- end cart -->


<!--        </div>-->
    <!--end container80-->
    </div><!--end container-->


    <!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>