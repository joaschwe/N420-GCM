/**
 * Created by joaschwe on 4/16/17.
 */
function validateEmail(emailString) {
    var rx = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    // console.log(rx.test(emailString));

    return rx.test(emailString);
}


// function setBindings() {
// function checkVal () {
    // evt.preventDefault();
    $("#shipForm").validate({
        rules: {
            fname: {
                required: true,
                minlength: 2,
                lettersonly: true
            },
            lname: {
                required: true,
                minlength: 2,
                lettersonly: true
            },
            // password: {
            //     required: true,
            //     minlength: 5
            // },
            // confirm_password: {
            //     required: true,
            //     minlength: 5,
            //     equalTo: "#password"
            // },
            email: {
                required: true,
                email: true
            },
            address: {
                required: true,
                minlength: 3
            },
            city: {
                required: true,
                minlength: 3,
                lettersonly: true
            },
            zip: {
                required: true,
                minlength: 5,
                maxlength: 5,
                number: true
            },
            state: {
                required: true,
                lettersonly: true,
                minlength: 2,
                maxlength: 2
            },
            bill_fname: {
                required: true,
                minlength: 2,
                lettersonly: true
            },
            bill_lname: {
                required: true,
                minlength: 2,
                lettersonly: true
            },
            bill_email: {
                required: true,
                email: true
            },
            bill_address: {
                required: true,
                minlength: 3
            },
            bill_city: {
                required: true,
                minlength: 3,
                lettersonly: true
            },
            bill_zip: {
                required: true,
                minlength: 5,
                maxlength: 5,
                number: true
            },
            bill_state: {
                required: true,
                lettersonly: true,
                minlength: 2,
                maxlength: 2
            },
            cardname: {
                required: true,
                minlength: 3
            },
            cardnum: {
                required: true,
                number: true,
                minlength: 16,
                maxlength: 16
            },
            cvv: {
                required: true,
                number: true,
                minlength: 3,
                maxlength: 3
            },
            expdate: {
                required: true,
                minlength: 4,
                maxlength: 4,
                number: true
            },

            // topic: {
            //     required: "#newsletter:checked",
            //     minlength: 2
            // },
            // agree: "required"
            // },
            messages: {
                fname: {
                    required: "Please enter your first name",
                    minlength: 'Please enter a valid name.',
                    lettersonly: 'Only letters, please.'
                },
                lname: {
                    required: "Please enter your last name",
                    minlength: 'Please enter a valid name.',
                    lettersonly: 'Only letters, please.'
                },
                email: {
                    required: 'Please enter your email address.',
                    email: 'Please enter a valid email.'
                },
                address: {
                    required: 'Please enter your address.',
                    minlength: 'Address needs to be at least 3 characters.'
                },
                city: {
                    required: 'Please enter your city',
                    minlength: 'City needs to be at least 3 characters.',
                    lettersonly: 'Letters only, please.'
                },
                zip: {
                    required: 'Please enter your zipcode.',
                    minlength: 'Zipcode must be 5 numbers.',
                    maxlength: 'Zipcode must be 5 numbers.',
                    number: 'Numbers only, please.'
                },
                state: {
                    required: 'Please enter your state.',
                    lettersonly: 'Letters only, please.',
                    minlength: 'Please use the state abbreviation.',
                    maxlength: 'Please use the state abbreviation.'
                },
                bill_fname: {
                    required: "Please enter your first name",
                    minlength: 'Please enter a valid name.',
                    lettersonly: 'Only letters, please.'
                },
                bill_lname: {
                    required: "Please enter your last name",
                    minlength: 'Please enter a valid name.',
                    lettersonly: 'Only letters, please.'
                },
                bill_email: {
                    required: 'Please enter your email address.',
                    email: 'Please enter a valid email.'
                },
                bill_address: {
                    required: 'Please enter your address.',
                    minlength: 'Address needs to be at least 3 characters.'
                },
                bill_city: {
                    required: 'Please enter your city',
                    minlength: 'City needs to be at least 3 characters.',
                    lettersonly: 'Letters only, please.'
                },
                bill_zip: {
                    required: 'Please enter your zipcode.',
                    minlength: 'Zipcode must be 5 numbers.',
                    maxlength: 'Zipcode must be 5 numbers.',
                    number: 'Numbers only, please.'
                },
                bill_state: {
                    required: 'Please enter your state.',
                    lettersonly: 'Letters only, please.',
                    minlength: 'Please use the state abbreviation.',
                    maxlength: 'Please use the state abbreviation.'
                },
                cardname: {
                    required: 'Please enter the name on the credit card.',
                    minlength: 'Name needs to be at least 3 characters.'
                },
                cardnum: {
                    required: 'Please enter the number on the credit card.',
                    creditcard: true,
                    minlength: 'Card number must be 16 numbers.',
                    maxlength: 'Zipcode must be 5 numbers'
                },
                cvv: {
                    required: 'Please enter the security code on the back of the card.',
                    number: 'Numbers only, please.',
                    minlength: 'CVV must be 3 numbers.',
                    maxlength: 'CVV must be 3 numbers.'
                },
                expdate: {
                    required: 'Please enter the expiration date on the credit card.'
                    // minlength: 'Date is only 4 numbers.',
                    // maxlength: 'Date is only 4 numbers.',
                    // number: 'Numbers only, please.'
                }
            }
        }
    });
// });
// }




/*
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

else if (!validateEmail(suEmail)) {
        alert("Please enter a valid email.");
} else if (suPass == "" || suPass.length < 8) {
    alert("Please enter a password with at least 8 characters.");



    $(".go-checkout").click(function (e) {
        e.preventDefault();


        // var payCardname = $('#cardname').val(),
        //     payCardnum = $('#cardnum').val(),
        //     payCardcvv = $('#cvv').val(),
        //     payExpdate = $('#expdate').val();
        // console.log( [payCardname, payCardnum, payCardcvv, payExpdate]);
        //
        // if (payCardname == "") {
        //     alert("Please enter the name on the credit card.");
        // } else if (payCardnum == '') {
        //     alert("Please enter a credit card number.");
        // } else if (payCardcvv == '' || payCardnum < 3 || payCardnum > 3) {
        //     alert("Please enter a valid number.");
        // } else if (payExpdate == '' || payExpdate == '1') {
        //     alert ("Please enter a valid expiration date.")
        //     alert("You have successfully signed up.");
        //     $(".sign-up form :input.clear").val("");
        // } else {
        //
        //     alert("You have successfully signed up.");
        //     $(".sign-up form :input.clear").val("");
        // }
        //
        // console.log(suName);
        // console.log(suEmail);
        // console.log(suPass);
    });

    /*
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


    // username: {
    //     required: "Please enter a username",
    //     minlength: "Your username must consist of at least 2 characters"
    // },
    // password: {
    //     required: "Please provide a password",
    //     minlength: "Your password must be at least 5 characters long"
    // },
    // confirm_password: {
    //     required: "Please provide a password",
    //     minlength: "Your password must be at least 5 characters long",
    //     equalTo: "Please enter the same password as above"


}
*/

$(document).ready(function () {
    $('button.go-checkout').click(checkVal);
});