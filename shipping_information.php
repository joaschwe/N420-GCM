<?php
require './includes/header.inc.php';
require './includes/navLogoOnly.inc.php';

//<form id="shipForm" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);
?>

    <div class="container">
        <div class="container80">

            <!---shipping form--->
            <form id="shipForm" method="post" action="" >
                <fieldset class="shippingInfo">
                    <legend class="title"><h3>Shipping</h3></legend>
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email">
                    <label for="fname">First Name</label>
                    <input type="text" id="fname" name="fname"/>
                    <label for="lname">Last Name</label>
                    <input type="text" id="lname" name="lname"/>
                    <label for="address">Street Address</label>
                    <input type="text" id="address" name="address"/>
                    <label for="apt">Apt/Suite/Other (optional)</label>
                    <input type="text" id="apt" name="apt"/>
                    <div class="zipCity">
                        <div class="zipGrp">
                            <label for="zip" class="zip">Zip Code</label>
                            <input type="text" id="zip" name="zip"/>
                        </div>
                        <div class="cityGrp">
                            <label for="city" class="city">City</label>
                            <input type="text" id="city" name="city"/>
                        </div>
                    </div>
                    <label for="state">State</label>
                    <input type="text" id="state" name="state"/>

                    <div class="buttons">
                        <button class="continue" type="button">Continue to Billing</button>
                    </div>
                    <!--                    <button class="showAll">SHOW ALL INFO</button>-->
                </fieldset>

                <fieldset class="billingInfo">
                    <legend class="title"><h3>Billing</h3></legend>
                    <div class="checkbox">
                        <input type="checkbox" id="checkbox1"/>
                        <label for="checkbox1">Same as Shipping</label>
                    </div>

                    <label for="bill_email">Email</label>
                    <input type="email" id="bill_email" name="bill_email">
                    <label for="bill_fname">First Name</label>
                    <input type="text" id="bill_fname" name="bill_fname"/>
                    <label for="bill_lname">Last Name</label>
                    <input type="text" id="bill_lname" name="bill_lname"/>
                    <label for="bill_address">Street Address</label>
                    <input type="text" id="bill_address" name="bill_address"/>
                    <label for="bill_apt">Apt/Suite/Other (optional)</label>
                    <input type="text" id="bill_apt" name="bill_apt"/>
                    <div class="zipCity">
                        <div class="zipGrp">
                            <label for="bill_zip" class="zip">Zip Code</label>
                            <input type="text" id="bill_zip" name="bill_zip"/>
                        </div>
                        <div class="cityGrp">
                            <label for="bill_city" class="city">City</label>
                            <input type="text" id="bill_city" name="bill_city"/>
                        </div>
                    </div>
                    <label for="bill_state">State</label>
                    <input type="text" id="bill_state" name="bill_state"/>

                    <div class="buttons">
                        <button class="payment" type="button">Continue to Payment</button>

                    </div>
                </fieldset>

                <fieldset class="paymentInfo">
                    <legend class="title"><h3>Payment</h3></legend>

                    <label for="cardname">Cardholder Name</label>
                    <input type="text" id="cardname" name="cardname"/>

                    <div class="cardNumType">
                        <div class="cardnumGrp">
                            <label for="cardnum" class="cardnum">Card Number</label>
                            <input name="cardnum" type="number" id="cardnum"/>
                        </div>
                        <div class="cardtypeGrp">
                            <label for="visa" class="cardtype">&nbsp;</label>
                            <input type="text" id="visa" name="visa" class="visa"/>
                        </div>

                    </div>


                    <div class="cvvDate">
                        <div class="cvvGrp">
                            <label for="cvv" class="cvv">CVV</label>
                            <input type="number" id="cvv" name="cvv"/>
                        </div>
                        <div class="dateGrp">
                            <label for="expdate" class="expdate">Expire Date</label>
                            <input type="date" id="expdate"name="expdate" placeholder="05 / 21"/>
                        </div>
                    </div>

                    <div class="buttons">
                        <button class="cartPg">Back to Cart</button>
<!--                        <button class="checkout go-checkout" type="submit">Review Order</button>-->
                        <button class="checkout " type="submit">Review Order</button>
                    </div>
                </fieldset>
            </form>


        </div><!--end container80-->
    </div><!--end container-->


    <!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>