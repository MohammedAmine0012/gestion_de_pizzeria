<?php
$servername = "localhost";
$username = "root";
$password = "";
$bd_name ="registre";
$conn = new mysqli($servername, $username, $password,$bd_name);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>