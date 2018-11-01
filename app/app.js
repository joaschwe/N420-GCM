/**
 * Created by joaschwe on 4/16/17.
 */
function validateEmail(emailString) {
    var rx = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    // console.log(rx.test(emailString));

    return rx.test(emailString);
}


function setBindings() {
    $(".su-submit").click(function (e) {
        e.preventDefault();

        var suName = $(".sign-up form #suName").val(),
            suEmail = $(".sign-up form #suEmail").val(),
            suPass = $(".sign-up form #suPass").val();
        console.log( [suName, suEmail, suPass]);

        if (suName == "") {
            alert("Please enter a name.");
        } else if (!validateEmail(suEmail)) {
            alert("Please enter a valid email.");
        } else if (suPass == "" || suPass.length < 8) {
            alert("Please enter a password with at least 8 characters.");
        } else {
            alert("You have successfully signed up.");
            $(".sign-up form :input.clear").val("");
        }

        console.log(suName);
        console.log(suEmail);
        console.log(suPass);
    });

    $(".si-submit").click(function (e) {
        e.preventDefault();

        var siName = $(".sign-in form #siName").val(),
            siPass = $(".sign-in form #siPass").val();

        console.log(siName);

        if (siName == "") {
            alert("Please enter your username.");
        } else if (siPass == "" || siPass.length < 8) {
            alert("Your password should have at least 8 characters.");
        } else {
            alert("You have successfully signed in.");
            $(".sign-in form :input.clear").val("");
        }

        console.log(siName);
        console.log(siPass);
    });

    //faqs questions
    $(this).click(function () {
        $("div.questionDown").css({border: 'none'});
        $("div.answer").slideToggle("slow");
    });

    //various buttons
    $("button.shipping").click(function (evt) {
        var url = "shipping_information.php";
        $(location).attr('href', url);
        evt.preventDefault();
    });
    $("button.checkout").click(function (evt) {
        var url = "purchase.php";
        $(location).attr('href', url);
        evt.preventDefault();

    });
    $("button.order").click(function () {
        var url = "order_complete.php";
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
        var url = "your_cart.php";
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
    $("button.payment").click(function () {
//            $("div.questionDown").css({border: 'none'});
        $("fieldset.paymentInfo").slideDown("slow");
    });

    $("button.showAll").click(function (evt) {
//            $("div.questionDown").css({border: 'none'});
        $("fieldset.billingInfo").slideDown("slow");
        $("fieldset.paymentInfo").slideDown("slow");
        evt.preventDefault();
    });


//        $("button.checkout").click(function (evt) {
//            evt.preventDefault();
//        })

}


$(document).ready(function () {
    setBindings();
});