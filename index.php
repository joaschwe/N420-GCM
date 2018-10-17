<?php include "URL_ROOT . config.php"; ?>
<?php include "URL_ROOT . includes/header.inc.php"; ?>



<body>

<nav>
    <div><a href="#">HOME</a></div>
    <div><a href="#">ABOUT</a></div>
    <div><a href="#">SPEAKERS</a></div>
    <div><a href="#">INFO</a></div>
    <div class="join-button">
        <a href="#">JOIN IN</a>
        <div class="joinHolder">
            <!--<h1>Add something</h1>-->
            <div class="sign-in">
                <form>
                    <h2>Sign In</h2>
                    <label>User Name:</label>
                    <input class="clear" id="siName" type="text" placeholder="Name" required>
                    <label>Password:</label>
                    <input type="password" class="clear" id="siPass" placeholder="Password" required>
                    <input class="submit-button si-submit" type="submit">
                </form>
            </div>
            <div class="sign-up">
                <form>
                    <h2>Sign Up</h2>
                    <label>Name:</label>
                    <input type="text" class="clear" id="suName" placeholder="Name" required>
                    <label>Email:</label>
                    <input type="email" class="clear" id="suEmail" placeholder="Email address" required>
                    <label>Password:</label>
                    <input type="password" id="suPass" class="clear" placeholder="Password" required>

                    <input class="submit-button su-submit" type="submit">
                </form>
            </div>
        </div>
    </div>

</nav>


<div class="home">


</div>


<hr>
<div class="foot">
    &copy; Copyright Joanna Schweiger 2018
</div>



<script src="lib/jquery-3.1.1.min.js"></script>
<!--<script src="lib/sweetalert.min.js"></script>-->
<!--<script src="app/app.js"></script>-->


</body>
</html>
