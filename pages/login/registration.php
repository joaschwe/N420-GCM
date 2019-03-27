<?php
include '../../includes/header.inc.php';
include '../../includes/nav.inc.php';

?>
<form id="register_form" name="register_form" method="" action="">
    <div class="form-group">
        <label for="username" class="col-xs-3 control-label">User Name</label>
        <input type="text" id="username" name="username" placeholder="User Name">
        <div id="username_error" style="display:none;color:#990000;"></div>
    </div> <!--  /.form-group  -->

    <div class="form-group">
        <label for="password" class="col-xs-3 control-label">Password </label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password">
        <div id="password_error" style="display:none;color:#990000;"></div>
    </div> <!--  /.form-group  -->

    <div class="form-group">
        <label for="email" class="col-xs-3 control-label">E-mail</label>
        <input type="text" id="email" name="email" class="form-control" placeholder="E-mail address">
        <div id="email_error" style="display:none;color:#990000;"></div>
    </div> <!--  /.form-group  -->

    </div> <!-- /.row -->
    <div class="row row-gap">
        <button type="submit" class="btn btn-primary pull-right">Register</button>
        <div id="account_error" style="display:none;color:#990000;"></div>
    </div> <!-- /.row row-gap  -->
</form>

<script type="text/javascript">
    // Attach a submit handler to the form
    $("#register_form").submit(function (event) {
        event.preventDefault();
        $.post("register.php",
            {username: $("#username").val(), password: $("#password").val(), email: $("#email").val()},
            function (data) {

                //reset any previous error messages
                $("#username_error").html("");
                $("#username_error").css("display", "none");
                $("#password_error").html("");
                $("#password_error").css("display", "none");
                $("#email_error").html("");
                $("#email_error").css("display", "none");
                $("#account_error").html("");
                $("#account_error").css("display", "none");

                if (data.status == "success") {
                    window.location = "content.php";
                } else {
                    if (data.username_error != null) {
                        $("#username_error").html(data.username_error);
                        $("#username_error").css("display", "block");
                    }
                    if (data.password_error != null) {
                        $("#password_error").html(data.password_error);
                        $("#password_error").css("display", "block");
                    }
                    if (data.email_error != null) {
                        $("#email_error").html(data.email_error);
                        $("#email_error").css("display", "block");
                    }
                    if (data.account_error != null) {
                        $("#account_error").html(data.account_error);
                        $("#account_error").css("display", "block");
                    }
                }
            },
            "json"
        );
    });
</script>
