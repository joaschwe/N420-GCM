<?php
include("../../includes/db_connect.php");
include("../../includes/dropdowns.php");

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Craftsman Registration</title>
</head>
<body>

<h1 class="pageTitle">Craftsman Registration</h1>

<h4 class="sectionTitle">Getting Started</h4>
<p class="regText">Welcome to GoodCauseMarket.com! GCM is an e-commerce store, selling local, Indiana made products like yours and
    then donating 50% of the profit to charitable organizations. Our customers come to us from many non-profits such as
    a PTO, high school bands, robotics club, youth group, sports organizations and the list goes on. You will be part of
    helping the greater good by shipping your products to these customers. It's a win-win for everyone! Thank you for
    joining us in promoting good causes with your good products! Fill out this form and we'll get back to you very
    quickly.
</p>
<p class="regText">Once you fill out the information on this page and click AGREE below, you will receive an email from
    GoodCauseMarket usually within 48hours. Once you receive the email, you will be
    able to login to your GCM page, set up your account and upload your images, descriptions, then enter your inventory
    etc.</p>

<h4 class="sectionTitle">
    Managing Your Page on GCM
</h4>
<p class="regText">
    You agree to update and manage your inventory and products on the GCM website to insure products and inventory are
    accurate and available for our customers. This includes replenishment of inventory, removal of discontinued products
    and timely updates of the site with current information pertinent to the products sold on GCM.
</p>
<input type="checkbox" required>I Agree</input>

<h4 class="sectionTitle">
    Shipping
</h4>
<p class="regText">
    Good Cause Market will try to estimate shipping costs from your zip code to the customer's zip code. In order to
    estimate costs correctly, you will need to enter the physical dimensions and weight of each item. GCM will try to
    estimate costs using USPS, Fedex, and UPS at a minimum. You agree to offer shipping with at least one of the
    previously listed shippers. If you receive discounted shipping rates, you allow GCM to estimate shipping costs with
    the discounted rate. To estimate discounted rates, GCM will need information about your Shipper Accounts. All items shipped
    must have a tracking number. You agree to ship your product for GoodCauseMarket.com in a timely manner and notify us
    of any problems as soon as possible.
</p>
<p class="regText">
    Funnel Shipping is another shipping method GCM uses. It saves the customer on shipping costs by doing a bulk ship
    order. If the customer chooses "Funnel Shipping" at checkout, you will be notified to hold the orders. Once enough
    orders have been received, you can fulfill the order and the customers can share in the shipping cost.
</p>
<input type="checkbox" required>I Agree</input>

<h4 class="sectionTitle">
    Returns
</h4>
<p class="regText">
    I agree that only exchanges are allowed. Because of the handmade nature of the products sold through GCM, returns
    nor refunds are not allowed unless the product itself is faulty or damaged in shipping. It must be returned to you
    unused and unopened. GCM will direct the customer to conduct the return with you so that you are aware of any
    problem that caused the return.
</p>
<input type="checkbox" required>I Agree</input>

<h4 class="sectionTitle">Your Info</h4>
<form id="formRegVendor" name="formRegVendor" method="POST" action="submitVendor.php">
    <div class="formGroup">
        <label for="companyName" name="companyName">Company Name</label>
        <input type="text" id="registerCompanyName" name="companyName" required>
    </div>
    <div class="formGroup">
        <label for="contactName" name="contactName">Contact Name</label>
        <input type="text" id="registerContactName" name="firstname" required>
        <input type="text" id="registerContactName" name="lastname" required>
    </div>
    <div class="formGroup">
        <label for="websiteAddress" name="websiteAddress">Website URL</label>
        <input type="text" id="registerWebsiteURL" name="websiteAddress" required>
    </div>
    <div class="formGroup">
        <label for="addressType" name="addressType">Address Type</label>
        <select name="addressType" id="registerAddressType" required>
            <?php
            while ($row = mysqli_fetch_array($addresstypeResult, MYSQLI_BOTH)){
                echo '<option id="addressType'.$row["ID"].'" value="'.$row["ID"].'">'.$row["Name"].'</option>';
            }
            ?>
        </select>
    </div>
    <div class="formGroup">
        <label for="physicalAddress" name="physicalAddress">Address</label>
        <input type="text" id="registerPhysicalAddress" name="physicalAddress" required>
    </div>
    <div class="formGroup">
        <label for="physicalAddressCity" name="physicalAddressCity">City</label>
        <input type="text" id="registerPhysicalAddressCity" name="physicalAddressCity" required>
    </div>
    <div class="formGroup">
        <label for="physicalAddressState" name="physicalAddressState">State</label>
        <select name="physicalAddressState" id="registerPhysicalAddressState" required>
            <?php
            // Create dropdown for states
            while ($row = mysqli_fetch_array($statesResult, MYSQLI_BOTH)){
                // Set the default state to Indiana
                if ($row["Abbreviation"] == "IN" ) {
                    echo '<option id="'.$row["Abbreviation"].'" value="'.$row["ID"].'" selected=selected >'.$row["Name"].'</option>';
                } else {
                    echo '<option id="'.$row["Abbreviation"].'" value="'.$row["ID"].'">'.$row["Name"].'</option>';
                }
            }
            ?>
        </select>
    </div>
    <div class="formGroup">
        <label for="physicalAddressZip" name="physicalAddressZip">Zip</label>
        <input type="text" id="registerPhysicalAddressZip" name="physicalAddressZip" required>
    </div>
    <div class="formGroup">
        <label for="logoImage" name="logoImage">Upload your logo</label>
        <input type="file">
    </div>
    <div class="formGroup">
        <label for="emailCommunication" name="emailCommunication">Email for Communication</label>
        <input type="email" id="registerEmailCommunication" required>
    </div>
    <div class="formGroup">
        <label for="emailOrders" name="emailOrders">Email for New Orders</label>
        <input type="email" id="registerEmailOrders" required>
    </div>
    <div class="formGroup">
        <label for="phone" name="phone">Phone Number</label>
        <input type="tel" id="registerPhone" name="phone" required>
    </div>
    <div class="formGroup">
        <label for="itemMadeInIndiana" name="itemMadeInIndiana">Are all your products made in Indiana?</label>
        <input type="radio" name="itemMadeInIndianaYN" value="Yes" required> Yes
        <input type="radio" name="itemMadeInIndianaYN" value="No"> No
    </div>
    <div class="formGroup">
        <label for="otherPlacesSelling" name="otherPlacesSelling">Please list other websites where you sell your
            products</label>
        <textarea name="otherPlacesSellingInput" id="otherPlacesSellingInput" cols="30" rows="3"></textarea>
    </div>
    <div class="formGroup">
        <label for="paymentProcessing" name="paymentProcessing">GCM will use Stripe for payment processing. Do you
            currently
            have a Stripe Account?</label>
        <input type="radio" name="paymentProcessingYN" value="Yes"> Yes
        <input type="radio" name="paymentProcessingYN" value="No"> No
    </div>
    <div class="formGroup">
        <label for="paymentProcessingNo" name="paymentProcessingNo">You will need to create a Stripe account in order to
            sell on GCM</label>
        <input type="checkbox" name="paymentProcessingNoAgree" required> I Agree
    </div>
    <div class="formGroup">
        <label for="wholesaleDiscountTier" name="wholesaleDiscountTier">Do you use a discount tier for wholesale
            pricing?</label>
        <input type="radio" name="wholesaleDiscountTierYN" value="Yes"> Yes
        <input type="radio" name="wholesaleDiscountTierYN" value="No"> No
    </div>
    <div class="formGroup">
        <label for="wholesaleDiscount" name="wholesaleDiscount">What is your typical wholesale discount?</label>
        <input type="text" name="wholesaleDiscountInput" id="wholesaleDiscountInput" required>
    </div>

    <h4 class="sectionTitle">Additional Shipping Info</h4>
    <div class="formGroup">
        <label for="additionalShippers" name="additionalShippers">What other shippers do you utilize, if any?</label>
        <textarea name="additionalShippersInput" id="additionalShippersInput" cols="30" rows="3"></textarea>
    </div>
    <div class="formGroup">
        <label for="rateType" name="rateType">What type of rate do you use?</label>
        <input type="radio" name="rateType" value="calculated"> Calculated
        <input type="radio" name="rateType" value="flat"> Flat
        <input type="radio" name="rateType" value="varies"> Varies by Shipper
    </div>
    <div class="formGroup">
        <label for="signatureRequired" name="signatureRequired">Will any of your products require a signature upon
            delivery?</label>
        <input type="radio" name="signatureRequiredYN" value="Yes">Yes
        <input type="radio" name="signatureRequiredYN" value="No">No
    </div>
    <div class="formGroup">
        <label for="averageShippingCost" name="averageShippingCost">In order to help us with our Funnel Shipping, can you estimate an average shipping cost?</label>
        <input type="text" name="averageShippingCostInput" id="averageShippingCostInput" required>
    </div>
    <div class="formGroup">
        <label for="discountedRates" name="discountedRates">Please specify any shippers that provide you discounted
            rates.</label>
        <textarea name="discountedRateShippers" id="discountedRateShippers" cols="30" rows="3"></textarea>
    </div>

    <div class="formGroup">
        <h4 class="sectionTitle">Further Agreements</h4>
        <p class="regText">
            Unfortunately in our world, people sue and if that happens due to your product, you agree that if you are
            sued
            because of something that you did, to hold GoodCauseMarket.com, Beablery Brokery, LLC, its owner and
            property,
            harmless and indemnify us from any legal suit brought against you. You agree and acknowledge your
            understanding
            that we only broker your items and because we are never in possession of these products, any claim against
            you
            or your products that were faulty, misrepresented or caused physical injury will not include
            GoodCauseMarket.com, Beablery Brokery, LLC its owner and property. You agree and are responsible for Your
            product(s) and content. It is understood that you possess all necessary legal rights to your products and
            content and by doing so are stating you are not in violation of or infringing on, any 3rd party claimant’s
            right
            by your use on this website. Furthermore, you give permission to GCM all rights to represent your product
            for
            sale on this website.
        </p>
        <input type="checkbox" name="furtherAgreementIAgree" required>I Agree
    </div>
    <input type="submit" value="Submit">
</form>

</body>
</html>