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

}



$(document).ready(function () {
    setBindings();
});