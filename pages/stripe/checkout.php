<?php require_once('../../includes/stripe-checkout.php'); ?>

<form action="charge.php" method="post">
    <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
            data-key="<?php echo $stripe['publishable_key']; ?>"
            data-description="Access for a year"
            data-amount="5000"
            data-locale="auto"
            data-zip-code="true"
            data-billing-address="true"
            data-shipping-address="true">

    </script>
</form>