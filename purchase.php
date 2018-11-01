<?php
require './includes/header.inc.php';
require './includes/navLogoOnly.inc.php';
?>

    <div class="container">
        <div class="container80">
            <!--checkout page title-->
            <div class="title">
                <h3>Review your order</h3>
<!--                <p><a href="cart.php">Back to Cart</a></p>-->
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
                    <div>
                        <button class="order">Place Order</button>
                        <button class="cartPg">Back to Cart</button>
                    </div>
                </div>

            </div><!-- end cart -->

            <div class="causeAmt">
                <h3 class="amt">$00.00 of this purchase will go to a Good Cause</h3>
            </div>

        </div><!--end container80-->
    </div><!--end container-->


    <!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>