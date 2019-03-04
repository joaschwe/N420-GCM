<?php
include("../../includes/db_connect.php");
include("../../includes/dropdowns.php");

require '../../includes/header.inc.php';
require '../../includes/nav.inc.php';

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Funnel Leader Registration</title>
</head>
<body>

<h1 class="pageTitle">Funnel Leader Registration</h1>

<h4 class="sectionTitle">Getting Started</h4>
<p class="regText">Customers have a choice of shipping methods. Pay direct shipping and the order is shipped to
    the designated destination. OR, to help keep shipping costs low, we can ship using a funnel method. Customers pay
    one
    shipping fee and pick up their order once it has shipped from your organizations dedicated "Funnel Leader". Please
    fill in
    the Funnel Leader's name and contact information below.
</p>
<h4 class="sectionTitle">
    Shipping
</h4>
<p class="regText">
    Funnel Shipping is another shipping method GCM uses. It saves the customer on shipping costs by doing a bulk ship
    order. If the customer chooses "Funnel Shipping" at checkout, the Craftsmen will be notified to hold the orders.
    Once enough
    orders have been received, the Craftsman will fulfill the order and send it to the funnel leader for distribution.
</p>
<p class="regText">
    If your Cause thinks it might participate in the Funnel Shipping option, a Funnel Leader will need to be assigned.
    You can always sign back into your account and revise this information. It will be the Funnel Leader’s
    responsibility to provide pick up location and times to the customers as well as verify receipt of the orders. To
    make your job as the Funnel Leader as simple as possible, GoodCauseMarket.com will provide an email template for you
    to send to the customers regarding their order.
</p>
<input type="checkbox" required>I Agree</input>

<h4 class="sectionTitle">Your Info</h4>
<form id="formRegFunnelLeader" name="formRegFunnelLeader" method="POST" action="submitFunnel.php">
    <div class="formGroup">
        <label for="selectCause" name="selectCause">Select Your Cause</label>
        <select name="selectCause" id="availableCauses">
            <?php
            while ($row = mysqli_fetch_array($causeResult, MYSQLI_BOTH)){
                echo '<option id="cause'.$row["ID"].'" value="'.$row["ID"].'">'.$row["CauseName"].'</option>';
            }
            ?>
        </select>
    </div>
    <div class="formGroup">
        <label for="contactName" name="contactName">Contact Name</label>
        <input type="text" id="registerContactName" name="firstName" placeholder="First Name" required>
        <input type="text" id="registerContactName" name="lastName" placeholder="Last Name" required>
    </div>
    <div class="formGroup">
        <label for="addressType" name="addressType">Address Type</label>
        <select name="addressType" id="registerAddressType" required>
            <?php
            while ($row = mysqli_fetch_array($addresstypeResult, MYSQLI_BOTH)){
                if ($row["Name"] == "PRODUCT PICK-UP"){
                    echo '<option id="addressType'.$row["ID"].'" value="'.$row["ID"].'" selected=selected>'.$row["Name"].'</option>';
                } else {
                    echo '<option id="addressType'.$row["ID"].'" value="'.$row["ID"].'">'.$row["Name"].'</option>';
                }
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
        <select id="registerPhysicalAddressState" name="physicalAddressState" required>
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
        <label for="emailCommunication" name="emailCommunication">Email for Communication</label>
        <input type="email" id="registerEmailCommunication" name="emailCommunication" required>
    </div>
    <div class="formGroup">
        <label for="phone" name="phone">Phone Number</label>
        <input type="tel" id="registerPhone" name="phone" required>
    </div>
    <div class="formGroup">
        <label for="pickupDayArray" name="pickupDay">What days can orders be picked up?</label>
        <input type="checkbox" name="pickupDayArray[]" value="0"> Sunday
        <input type="checkbox" name="pickupDayArray[]" value="1"> Monday
        <input type="checkbox" name="pickupDayArray[]" value="2"> Tuesday
        <input type="checkbox" name="pickupDayArray[]" value="3"> Wednesday
        <input type="checkbox" name="pickupDayArray[]" value="4"> Thursday
        <input type="checkbox" name="pickupDayArray[]" value="5"> Friday
        <input type="checkbox" name="pickupDayArray[]" value="6"> Saturday
    </div>
    <div class="formGroup">
        <input type="checkbox" name="newslettersAndUpdates" value="true" checked>
        <label for="newslettersAndUpdates" name="newslettersAndUpdates">I would like to receive newsletters and updates
            from Good Cause Market.</label>
    </div>

    <div class="formGroup">
        <h4 class="sectionTitle">Further Agreements</h4>
        <p class="regText">
            We will put your website’s link onto the GoodCauseMarket.com website. Will you put Good Cause Market’s link
            on your landing page saying you are teaming with us for a Good Cause?
        </p>
        <p>
            Returned products are not included in the profit amount. The profit is tabulated by and defined as the
            selling price of the product and does not include tax, shipping, handling etc.
        </p>
    </div>

    <div class="formGroup">
        <input type="checkbox" required>
        <label for="finalAgreement" name="finalAgreement">By enrolling, I confirm I have read, understood, and agree to
            the <a>Terms and Conditions</a> of Good Cause Market.</label>
    </div>

    <input type="submit" value="Submit">
</form>

</body>
</html>
<?php
include '../../includes/footer.inc.php';
?>