<?php
include("includes/db_connect.php");

$addresstypeQuery = "SELECT ID, Name from addresstypes";
$addresstypeResult = mysqli_query($link, $addresstypeQuery);

$causetypesQuery = "SELECT ID, Name FROM causetypes";
$causetypeResult = mysqli_query($link, $causetypesQuery);

$statesQuery = "SELECT ID, Name, Abbreviation FROM states";
$statesResult = mysqli_query($link, $statesQuery);

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Causes Registration</title>
</head>
<body>

<h1 class="pageTitle">Causes Registration</h1>

<h4 class="sectionTitle">Getting Started</h4>
<p class="regText">Welcome to Good Cause Market. Becoming a partner with Good Cause Market is a good thing to do for
    your non-profit group. Every product sold on Good Cause Market earns your non profit organization, 50% profit! To
    earn these
    profits, every non profit must register here.
</p>
<p class="regText"> GCM makes fundraising all year long possible. The need for a lot of volunteers and a lot of
    everyone’s time has been eliminated. And a continuous revenue stream for your organization is right here at Good
    Cause Market.
    Good Cause Market is a place where the charitable organization and small, locally based craftsman come together to
    raise funds for your Cause. In order for us to do this, please fill out the form below.
</p>

<h4 class="sectionTitle">
    Managing Your Page on GCM
</h4>
<p class="regText">
    You will need a logo, graphics plus an “about” that illustrates your organization’s purpose.
    You will have an administrative page to upkeep all this and more information.
    GCM will keep a running total of your fundraising dollars. Disbursement will occur approximately every 30 days.
</p>
<input type="checkbox" required>I Agree</input>

<h4 class="sectionTitle">
    Shipping
</h4>
<p class="regText">
    Funnel Shipping is another shipping method GCM uses. It saves the customer on shipping costs by doing a bulk ship
    order. If the customer chooses "Funnel Shipping" at checkout, the Craftsmen will be notified to hold the orders. Once enough
    orders have been received, the Craftsman will fulfill the order and send to the funnel leader for distribution.
</p>
<p class="regText">
    If you will be participating in funnel shipping, a funnel leader will need to be designated. It is your
    responsibility to upkeep the funnel leaders and their contact information. It is the funnel leader's responsibility to upkeep the pickup locations and verify
    products
</p>
<input type="checkbox" required>I Agree</input>

<h4 class="sectionTitle">Your Info</h4>
<form id="formRegCause" name="formRegCause" method="POST" action="submitCause.php">
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
        <label for="emailCommunication" name="emailCommunication">Email for Communication</label>
        <input type="email" id="registerEmailCommunication" name="emailCommunication" required>
    </div>
    <div class="formGroup">
        <label for="phone" name="phone">Phone Number</label>
        <input type="tel" id="registerPhone" name="phone" required>
    </div>
    <div class="formGroup">
        <label for="typeOfOrganization" name="typeOfOrganization">Type of Organization</label>
        <select name="typeOfOrganization" id="typeOfOrganization" required>
            <?php
            while ($row = mysqli_fetch_array($causetypeResult, MYSQLI_BOTH)){
                echo '<option id="causeType'.$row["ID"].'" value="'.$row["ID"].'">'.$row["Name"].'</option>';
            }
            ?>
        </select>
        <input type="text" name="typeOfOrganizationOther">
    </div>
    <div class="formGroup">
        <label for="logoImage" name="logoImage">Upload your logo</label>
        <input type="file">
    </div>
    <div class="formGroup">
        <label for="purposeInput" name="purpose">What is the purpose of your organization?</label>
        <textarea name="purposeInput" id="purposeInput" cols="30" rows="5"></textarea>
    </div>
    <div class="formGroup">
        <label for="fundsUsed" name="fundsUsed">How will you use your funds?</label>
        <textarea name="fundsUsed" id="fundsUsed" cols="30" rows="4"></textarea>
    </div>
    <div class="formGroup">
        <label for="campaignEndDate" name="campaignSelection">Please select a campaign term.</label>
        <input type="radio" name="campaignEndDate" value="9999-12-31 23:59:59"> Ongoing
        <input type="radio" name="campaignEndDate" value=""> Specific End Date
        <input type="date">
    </div>
    <div class="formGroup">
        <label for="peopleBenefit" name="peopleBenefit">How many people benefit from your fundraising?</label>
        <input type="number" name="peopleBenefit" required>
    </div>
    <div class="formGroup">
        <label for="cause501cYN" name="cause501cYN">Is your cause a 501 c 3 organization?</label>
        <input type="radio" name="cause501cYN" value="1"> Yes
        <input type="radio" name="cause501cYN" value="0"> No
    </div>

    <div class="formGroup">
        <h4 class="sectionTitle">Further Agreements</h4>
        <p class="regText">
            Unfortunately in our world, people sue and if that happens due to your product or affiliation, you agree that if you are
            sued
            because of something that you did, to hold GoodCauseMarket.com, Beablery Brokery, LLC, its owner and
            property,
            harmless and indemnify us from any legal suit brought against you. You agree and acknowledge your
            understanding
            that GCM only brokers items and because GCM is never in possession of these products, any claim against
            you
            or the Craftsman products that were faulty, misrepresented or caused physical injury will not include
            GoodCauseMarket.com, Beablery Brokery, LLC its owner and property. You agree and are responsible for Your
            product(s) and content. It is understood that you possess all necessary legal rights to your products and
            content and by doing so are stating you are not in violation of or infringing on, any 3rd party claimant’s
            right
            by your use on this website. Furthermore, you give permission to GCM all rights to represent your organization
            on this website.
        </p>
        <input type="checkbox" name="furtherAgreementIAgree" required>I Agree
    </div>
    <input type="submit" value="Submit">
</form>

</body>
</html>