<?php
require './includes/header.inc.php';
require './includes/nav.inc.php';
?>

    <div class="container" style="height: auto;">
<!--        <div class="container80">-->
            <!--cart page title-->
            <div class="title">
                <h3>2 Items In Your Bag</h3>
                <p><a href="index.php">Continue shopping</a></p>
            </div>
            <!--cart page content-->
            <div class="cart">

                <div class="itemCol">
                    <div class="vendorItem">
                        <div class="vendor">
                            <p class="venName">Vendor Name</p>
                            <p class="cost">$0.00</p>
                        </div>
                        <div class="item">
                            <img src="images/cart_checkout/cart-item1.png">
                            <div class="itemDescrip">
                                <p class="itemName">item 1</p>
                                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                    mollit
                                    anim id est laborum.</p>
                                <a href="#">Remove Item</a>
                            </div>
                        </div>
                    </div>
                    <div class="vendorItem">
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
                                <a href="#">Remove Item</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="costCol">
                    <div class="itemCost">
                        <p>Total (2 items)</p>
                        <p class="cost">$0.00</p>
                    </div>
                    <div class="single">
                        <a href="good_cause.php"><button>Select Cause</button></a>
                        <a href="#">Calculate shipping</a>
                    </div>
                </div>

            </div><!-- end cart -->

            <div class="causeAmt">
                <h3 class="amt">$0.00 of this purchase will go to your <span>Good</span> Cause</h3>
            </div>

<!--        </div><!--end container80-->
    </div><!--end container-->

    <!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>




