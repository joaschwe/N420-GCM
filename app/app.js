/**
 * Created by joaschwe on 4/16/17.
 */

function setBindings() {

    //faqs
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight){
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }


    // MODAL
// When the user clicks the button, open the modal
    $('#loginBtn').click(function() {
        $('.modal').css('display', 'block')
    });

// When the user clicks on <span> (x), close the modal
    $('span').click(function(e) {
            $('.modal').css('display', 'none');
    });

// When the user clicks anywhere outside of the modal, close it
    $('window').click(function(e) {
        if (e.target == modal) {
            $(this).css('display', 'none');
        }
    });

    // When the user clicks the login button, go to user page
    $('button#user-login').click(function() {
        var go_to_url = 'user-pg.php';
        //this will redirect us in new tab
        window.open(go_to_url, '_blank');
    });



    //form copy ship info to billing
    $("#checkbox1").change(function () {
        if (this.checked) {
            //get the values of the filled fields
            $email = $("#email").val();
            $fname = $("#fname").val();
            $lname = $("#lname").val();
            $address = $("#address").val();
            $apt = $("#apt").val();
            $zip = $("#zip").val();
            $city = $("#city").val();
            $state = $("#state").val();
            console.log("name");
            // then add those values to your billing infor window fields

            $("#bill_email").val($email);
            $("#bill_fname").val($fname);
            $("#bill_lname").val($lname);
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

    // $( function() {
    //     $( "#slider-range" ).slider({
    //         range: true,
    //         min: 0,
    //         max: 500,
    //         values: [ 75, 300 ],
    //         slide: function( event, ui ) {
    //             $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
    //         }
    //     });
    //     $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
    //         " - $" + $( "#slider-range" ).slider( "values", 1 ) );
    // } );


//        $("button.checkout").click(function (evt) {
//            evt.preventDefault();
//        })

}


$(document).ready(function () {
    setBindings();
});