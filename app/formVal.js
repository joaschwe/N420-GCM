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
        email: {
            required: true,
            email: true,
            minlength: 5
        },
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
        address: {
            required: true
        },
        city: {
            required: true,
            lettersonly: true
        },
        state: {
          required: true,
            lettersonly: true
        },
        zip: {
            required: true,
            numbers: true,
            exactlength: 5
        }
    },
    messages: {
        fname: {
            required: 'Please enter your first name.',
            minlength: 'Name needs to be at least 2 letters.',
            lettersonly: 'Letters only, please.'
        },
        lname: {
            required: 'Please enter your last name.',
            minlength: 'Name needs to be at least 2 letters.',
            lettersonly: 'Letters only, please.'
        },
        email: {
            required: 'Please enter your email.',
            minlength: 'Please enter a valid email.'
        },
        address: {
            required: 'Please enter your address.'
        },
        city: {
          required: 'Please enter your city.',
            lettersonly: 'Letters only, please.'
        },
        state: {
            required: 'Please enter your state.',
            lettersonly: 'Letters only, please.'
        },
        zip: {
            required: 'Please enter your zipcode.'
            // numbers: 'numbers only, please.'
        }
    }
});



$(document).ready(function () {
    $('button.go-checkout').click(function() {
        // $.validator.addMethod("exactlength", function(value, element, param) {
        //         return this.optional(element) || value.length == param;
        //     },
        //     $.validator.format("5 numbers only."));
        $("#shipForm").valid(); //validate form 1

    });

    // if($('#form2').valid()){  //call valid for form2 and show the errors
    //     alert('submit form');  //only if the form is valid submit the form
    //     $( this ).dialog( "close" );
    // }
});