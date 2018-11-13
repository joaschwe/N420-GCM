/**
 * Created by joaschwe on 4/16/17.
 */

function setBindings() {



    //faqs questions
    $(function() {
        $("img").click(function() {
            $(this).toggleClass("rotate");
            // $('.question').css('border-bottom', 'none');
            $('.answer').slideToggle('slow');
        });
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


    //form copy ship info to billing
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
        $("fieldset.billingInfo").slideDown("fast");
    });
    $("button.payment").click(function () {
        $("fieldset.paymentInfo").slideDown("fast");
    });

    $("button.showAll").click(function (evt) {
        $("fieldset.billingInfo").slideDown("fast");
        $("fieldset.paymentInfo").slideDown("fast");
        evt.preventDefault();
    });


//        $("button.checkout").click(function (evt) {
//            evt.preventDefault();
//        })

}


$(document).ready(function () {
    setBindings();
});