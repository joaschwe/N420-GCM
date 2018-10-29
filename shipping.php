<?php
require './includes/header.inc.php';
require './includes/nav.inc.php';
?>

    <div class="container">
        <div class="container80">
            <!--checkout page title-->
            <div class="title">
<!--                <h3>Shipping</h3>-->
                <p><a href="cart.php">Back to Cart</a></p>
            </div>
            <!---shipping form--->
            <form method="post" action="checkout.php">
                <fieldset class="shippingInfo">
                    <legend class="title"><h3>Shipping</h3></legend>
                <label>Email</label>
                <input type="email" id="email">
                <label>Name</label>
                <input type="text" id="name" />
                <label>Street Address</label>
                <input type="text" id="address" />
                <label>Apt/Suite/Other (optional)</label>
                <input type="text" id="apt" />
                    <div class="zipCity">
                        <div class="zipGrp">
                <label for="zip" class="zip">Zip Code</label>
                        <input type="text" id="zip" />
                        </div>
                        <div class="cityGrp">
                    <label for="city" class="city">City</label>
                        <input type="text" id="city" />
                        </div>
                    </div>
                <label>State</label>
                <input type="text" id="state" />

                    <div class="buttons">
                    <button class="cartPg">Back</button>
                    <button class="continue" type="button">Continue to Billing</button>
                    </div>
                    <button class="showAll">SHOW ALL INFO</button>
                </fieldset>

                <fieldset class="billingInfo">
                    <legend class="title"><h3>Billing</h3></legend>
                    <div class="checkbox">
                    <input type="checkbox" id="checkbox1" />
                    <label for="checkbox1">Same as Shipping</label>
                    </div>

                    <label>Email</label>
                    <input type="email" id="bill_email">
                    <label>Name</label>
                    <input type="text" id="bill_name" />
                    <label>Street Address</label>
                    <input type="text" id="bill_address" />
                    <label>Apt/Suite/Other (optional)</label>
                    <input type="text" id="bill_apt" />
                    <div class="zipCity">
                        <div class="zipGrp">
                            <label for="zip" class="zip">Zip Code</label>
                            <input type="text" id="bill_zip" />
                        </div>
                        <div class="cityGrp">
                            <label for="city" class="city">City</label>
                            <input type="text" id="bill_city" />
                        </div>
                    </div>
                    <label>State</label>
                    <input type="text" id="bill_state" />

                    <div class="buttons">
                        <button class="cartPg">Back</button>
                        <button class="checkout" type="submit">Review Order</button>
                    </div>
                </fieldset>
            </form>


        </div><!--end container80-->
    </div><!--end container-->


    <!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>