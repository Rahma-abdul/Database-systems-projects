<?php 
//session_start();
$errors=array();
$db=mysqli_connect('localhost','rahma','Rahma_2712','CarRentalSystem') ;
if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
 }
   //echo "Connected successfully";
?>
