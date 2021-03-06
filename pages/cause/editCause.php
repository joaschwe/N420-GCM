<?php
include("includes/db_connect.php");
include("includes/dropdowns.php");

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Cause</title>
</head>
<body>

<h1 class="pageTitle">Edit Cause</h1>

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
            while ($row = mysqli_fetch_array($addresstypeResult, MYSQLI_BOTH)) {
                echo '<option id="addressType' . $row["ID"] . '" value="' . $row["ID"] . '">' . $row["Name"] . '</option>';
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
            while ($row = mysqli_fetch_array($statesResult, MYSQLI_BOTH)) {
                // Set the default state to Indiana
                if ($row["Abbreviation"] == "IN") {
                    echo '<option id="' . $row["Abbreviation"] . '" value="' . $row["ID"] . '" selected=selected >' . $row["Name"] . '</option>';
                } else {
                    echo '<option id="' . $row["Abbreviation"] . '" value="' . $row["ID"] . '">' . $row["Name"] . '</option>';
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
            while ($row = mysqli_fetch_array($causetypeResult, MYSQLI_BOTH)) {
                echo '<option id="causeType' . $row["ID"] . '" value="' . $row["ID"] . '">' . $row["Name"] . '</option>';
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
        <input type="radio" name="campaignEndDate" value="" checked> Specific End Date
        <input type="date">
    </div>
    <div class="formGroup">
        <label for="peopleBenefit" name="peopleBenefit">How many people benefit from your fundraising?</label>
        <input type="number" name="peopleBenefit" required>
    </div>
    <div class="formGroup">
        <label for="cause501cYN" name="cause501cYN">Is your cause a 501 c 3 organization?</label>
        <input type="radio" name="cause501cYN" value="1"> Yes
        <input type="radio" name="cause501cYN" value="0" checked> No
    </div>

    <div class="formGroup">
        <label for="determinationLetterInput" name="determinationUpload">Upload your determination letter in PDF
            format</label>
        <input type="file" accept="application/pdf" id="determinationLetter">
    </div>

    <div class="formGroup">
        <label for="funnelShippingParticipationYN" name="funnelShippingParticipationYN">If there is a possibility of
            participating in funnel shipping now or in the near future, please click Yes. Otherwise, please click
            No.</label>
        <input type="radio" name="funnelShippingParticipationYN" value="1"> Yes
        <input type="radio" name="funnelShippingParticipationYN" value="0" checked> No
    </div>


    <div class="formGroup">
        <label for="registerFunnelLeaderNowYN" name="registerFunnelLeaderNowYN">At the end of this registration, do you
            want to designate your funnel leader?</label>
        <input type="radio" name="registerFunnelLeaderNowYN" value="1"> Yes
        <input type="radio" name="registerFunnelLeaderNowYN" value="0" checked> No
    </div>


    <div class="formGroup">
        <h4 class="sectionTitle">Further Agreements</h4>
        <p class="regText">
            Unfortunately in our world, people sue and if that happens due to your product or affiliation, you agree
            that if you are
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
            by your use on this website. Furthermore, you give permission to GCM all rights to represent your
            organization
            on this website.
        </p>
        <input type="checkbox" name="furtherAgreementIAgree" required>I Agree
    </div>
    <input type="submit" value="Submit">
</form>

</body>
</html>