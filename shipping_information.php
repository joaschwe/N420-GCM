<?php
require './includes/header.inc.php';
require './includes/nav.inc.php';

//<form id="shipForm" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);
?>

    <div class="container">
        <div class="container80">

            <!---shipping form--->


            <form id="shipForm" method="post" action="purchase.php" >
                <fieldset class="shippingInfo">
                    <legend class="title"><h3>Shipping</h3></legend>

                    <label for="email" class="together">Email</label>
                    <label for="email" generated="true" class="error together"></label>
                    <input type="email" id="email" name="email">

                    <label for="fname">First Name</label>
                    <label for="fname" generated="true" class="error together"></label>
                    <input type="text" id="fname" name="fname"/>

                    <label for="lname">Last Name</label>
                    <label for="lname" generated="true" class="error together"></label>
                    <input type="text" id="lname" name="lname"/>

                    <label for="address">Street Address</label>
                    <label for="address" generated="true" class="error together"></label>
                    <input type="text" id="address" name="address"/>

                    <label for="apt">Apt/Suite/Other (optional)</label>
                    <input type="text" id="apt" name="apt"/>

                    <label for="city">City</label>
                    <label for="city" generated="true" class="error together"></label>
                    <input type="text" id="city" name="city"/>

<!--                    <div class="zipState">-->
<!--                        <div class="stateGrp">-->
                            <label for="state" class="state">State</label>
                            <label for="state" generated="true" class="error together"></label>
                            <input type="text" id="state" name="state"/>
<!--                        </div>-->
<!--                        <div class="zipGrp">-->
                            <label for="zip" class="zip">Zip Code</label>
                            <label for="zip" generated="true" class="error together"></label>
                            <input type="text" id="zip" name="zip"/>
<!--                        </div>-->

<!--                    </div>-->


<!--                    <div class="buttons">-->
<!--                        <button class="continue" type="button">Continue to Billing</button>-->
<!--                    </div>-->
                    <!--                    <button class="showAll">SHOW ALL INFO</button>-->
                </fieldset>

                <fieldset class="billingInfo">
                    <legend class="title"><h3>Billing</h3></legend>
                    <div class="checkbox">
                        <input type="checkbox" id="checkbox1"/>
                        <label for="checkbox1">Same as Shipping</label>
                    </div>

                    <label for="bill_email">Email</label>
                    <label for="bill_email" generated="true" class="error together"></label>
                    <input type="email" id="bill_email" name="bill_email">

                    <label for="bill_fname">First Name</label>
                    <label for="bill_fname" generated="true" class="error together"></label>
                    <input type="text" id="bill_fname" name="bill_fname"/>

                    <label for="bill_lname">Last Name</label>
                    <label for="bill_lname" generated="true" class="error together"></label>
                    <input type="text" id="bill_lname" name="bill_lname"/>

                    <label for="bill_address">Street Address</label>
                    <label for="bill_address" generated="true" class="error together"></label>
                    <input type="text" id="bill_address" name="bill_address"/>

                    <label for="bill_apt">Apt/Suite/Other (optional)</label>
                    <label for="bill_apt" generated="true" class="error together"></label>
                    <input type="text" id="bill_apt" name="bill_apt"/>

                    <label for="bill_city" class="city">City</label>
                    <label for="bill_city" generated="true" class="error together"></label>
                    <input type="text" id="bill_city" name="bill_city"/>
<!--                    <div class="zipCity">-->
<!--                        <div class="zipGrp">-->
                    <label for="bill_state">State</label>
                    <label for="bill_state" generated="true" class="error together"></label>
                    <input type="text" id="bill_state" name="bill_state"/>

                    <label for="bill_zip" class="zip">Zip Code</label>
                    <label for="bill_zip" generated="true" class="error together"></label>
                            <input type="text" id="bill_zip" name="bill_zip"/>
<!--                        </div>-->
<!--                        <div class="cityGrp">-->

<!--                        </div>-->
<!--                    </div>-->


<!--                    <div class="buttons">-->
<!--                        <button class="payment" type="button">Continue to Payment</button>-->
<!---->
<!--                    </div>-->
                </fieldset>

                <fieldset class="paymentInfo">
                    <legend class="title"><h3>Payment</h3></legend>

                    <label for="cardname">Cardholder Name</label>
                    <label for="cardname" generated="true" class="error together"></label>
                    <input type="text" id="cardname" name="cardname"/>

                    <div class="cardNumType">
                        <div class="cardnumGrp">
                            <label for="cardnum" class="cardnum">Card Number</label>
                            <label for="cardnum" generated="true" class="error together"></label>
                            <input name="cardnum" type="number" id="cardnum"/>
                        </div>
                        <div class="cardtypeGrp">
                            <label for="visa" class="cardtype">&nbsp;</label>
                            <input type="text" id="visa" name="visa" class="visa" disabled/>
                        </div>

                    </div>


                    <div class="cvvDate">
                        <div class="cvvGrp">
                            <label for="cvv" class="cvv">CVV</label>
                            <label for="cvv" generated="true" class="error together"></label>
                            <input type="number" id="cvv" name="cvv"/>
                        </div>
                        <div class="dateGrp">
                            <label for="expmonth" class="expmonth">Expiration Date</label>
                            <label for="expmonth" generated="true" class="error together"></label>
                            <select name="expmonth">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>

<!--                            <label for="expyear" class="expyear"></label>-->
                            <select name="expyear">
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                                <option value="2026">2026</option>
                            </select>
<!--                            <input type="date" id="expdate"name="expdate" placeholder="05 / 21"/>-->
                        </div>
                    </div>

                    <div class="buttons">
                        <button class="cartPg">Back to Cart</button>
<!--                        <button class="checkout go-checkout" type="submit">Review Order</button>-->
                        <button class="checkout go-checkout" type="submit">Review Order</button>
                    </div>
                </fieldset>
            </form>


        </div><!--end container80-->
    </div><!--end container-->


    <!--FOOTER-->
<?php
include './includes/footer.inc.php';
?>