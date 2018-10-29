<footer>
    <div class="contents">
        <div class="column">
            <h4>START A PROJECT</h4>
            <p>We are ready for the challenge.</p>
            <p>adobexd@mail.com</p>
        </div>
        <div class="column">
            <h4>SAY HELLO</h4>
            <p>479 Evergreen Road, <br/>
                Roseville, CA 46040</p>
            <p>345.678.9300</p>
        </div>
        <div class="column">
            <h4>JOBS</h4>
            <p>We are always looking for talent.</p>
            <p>adobexd@mail.com</p>
        </div>
        <div class="social">
            <img src="../images/icons/facebookIcon.gif">
            <img src="../images/icons/instaIcon.gif">
            <img src="../images/icons/twitterIcon.gif">
        </div>
    </div>
</footer>


<script src="../lib/jquery-3.1.1.min.js"></script>

<script>
    $(document).ready(function () {
        //index pg "more" arrows
//        $(".craftsman p.more").click(function() {
//            var url = "craftsman.php";
//            $(location).attr('href', url);
//        });
//        $(".product p.more").click(function() {
//            var url = "products.php";
//            $(location).attr('href', url);
//        });
//        $(".causeSection p.more").click(function() {
//            var url = "causes.php";
//            $(location).attr('href', url);
//        });

        //faqs questions
        $(this).click(function () {
            $("div.questionDown").css({border: 'none'});
            $("div.answer").slideToggle("slow");
        });

        //various buttons
        $("button.shipping").click(function () {
//            window.history.back();
            var url = "shipping.php";
            $(location).attr('href', url);
//            $('button.continue').trigger('click');
        });
        $("button.checkout").click(function (evt) {
            var url = "checkout.php";
            $(location).attr('href', url);
            evt.preventDefault();

        });
        $("button.order").click(function () {
            var url = "confirm.php";
            $(location).attr('href', url);
        });
        $("button.shopping").click(function () {
            var url = "index.php";
            $(location).attr('href', url);
        });
        $("button.back").click(function () {
            window.history.back();
        });
        $("button.cartPg").click(function () {
            var url = "cart.php";
            $(location).attr('href', url);
        });

        //form
        $("#checkbox1").change(function () {
            if (this.checked) {
                //get the values of the filled fields
                $email = $("#email").val();
                $name = $("#name").val();
                $address = $("#address").val();
                $apt = $("#apt").val();
                $zip = $("#zip").val();
                $city = $("#city").val();
                $state = $("#state").val();
                console.log("name");
                // then add those values to your billing infor window fields

                $("#bill_email").val($email);
                $("#bill_name").val($name);
                $("#bill_address").val($address);
                $("#bill_apt").val($apt);
                $("#bill_zip").val($zip);
                $("#bill_city").val($city);
                $("#bill_state").val($state);

                // then form will be automatically filled ..

            }
            else {
                $("#bill_email").val('');
                $("#bill_name").val('');
                $("#bill_address").val('');
                $("#bill_apt").val('');
                $("#bill_zip").val('');
                $("#bill_city").val('');
                $("#bill_state").val('');
            }
        });
        $("button.continue").click(function () {
//            $("div.questionDown").css({border: 'none'});
            $("fieldset.billingInfo").slideDown("slow");
        });

        $("button.showAll").click(function (evt) {
//            $("div.questionDown").css({border: 'none'});
            $("fieldset.billingInfo").slideDown("slow");
            evt.preventDefault();
        });


//        $("button.checkout").click(function (evt) {
//            evt.preventDefault();
//        })

    });


</script>
<!--<script src="app/app.js"></script>-->


</body>
</html>
