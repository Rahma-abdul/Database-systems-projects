<?php

$hostName = "localhost";
$dbUser = "rahma";
$dbPassword = "Rahma_2712";
$dbName = "login_register";
$conn = mysqli_connect($hostName, $dbUser, $dbPassword, $dbName);
if (!$conn) {
    die("Something went wrong;");
}

?>