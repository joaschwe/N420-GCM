<?php
/**
 * Created by PhpStorm.
 * User: Joanna_schweiger
 * Date: 10/26/18
 * Time: 6:39 PM
 */
?>

<!------- HAMBURGER NAV --------->
<!--    Made by Erik Terwan    -->
<!--   24th of November 2015   -->
<!--        MIT License        -->

<div class="hamburger">
    <div id="menuToggle">
<!--
A fake / hidden checkbox is used as click reciever, so you can use the :checked selector on it.
-->
        <input type="checkbox"/>
<!--
Some spans to act as a hamburger.

They are acting like a real hamburger,
        not that McDonalds stuff.
-->
        <span></span>
        <span></span>
        <span></span>
<!--
Too bad the menu has to be inside of the button but hey, it's pure CSS magic.
-->
        <ul id="menu">
            <li><a href="#">Become a Cause</a></li>
            <li><a href="#">Become a Vendor</a></li>
            <li><a href="#">Sign Up</a></li>
            <li><a href="#">Log In</a></li>
            <li>&mdash;</li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Craftsman</a></li>
            <li><a href="#">Causes</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">FAQs</a></li>
        </ul>
    </div>
</div>
<!------- HAMBURGER NAV --------->
